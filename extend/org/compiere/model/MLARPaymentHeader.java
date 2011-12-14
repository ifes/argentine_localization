package org.compiere.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import org.compiere.apps.ADialog;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Payment Header
 * @author Wagner Germán 
 */

public class MLARPaymentHeader extends X_LAR_PaymentHeader
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2698873064570244615L;
	
	/**	Logger							*/
	private static CLogger	s_log = CLogger.getCLogger (MLARPaymentHeader.class);

	/**************************************************************************
	 * 	Payment Header Constructor
	 *	@param ctx context
	 *	@param A_Asset_ID asset
	 *	@param trxName transaction name 
	 */
	public MLARPaymentHeader (Properties ctx, int LAR_PaymentHeader_ID, String trxName)
	{
		super (ctx, LAR_PaymentHeader_ID, trxName);
	}	//	MLARPaymentHeader

	/**
	 *  Load Constructor
	 *  @param ctx context
	 *  @param rs result set record
	 *	@param trxName transaction
	 */
	public MLARPaymentHeader (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLARPaymentHeader
	

	protected boolean beforeSave(boolean newRecord) 
	{
		if(!newRecord)
		{
			MPayment[] pays;
			try 
			{
				pays = getPayments(get_TrxName());
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				return false;
			}
			for(int i=0;i<pays.length;i++)
			{
				pays[i].setC_DocType_ID(getC_DocType_ID());
				pays[i].setDocumentNo(getDocumentNo());
				pays[i].setDateTrx(getDateTrx());
				pays[i].setDateAcct(getDateTrx());
				pays[i].setC_BPartner_ID(getC_BPartner_ID());
//				pays[i].setDocStatus(getDocStatus());
				pays[i].setIsReceipt(isReceipt());
//				pays[i].setProcessed(isProcessed());
				pays[i].setIsActive(isActive());
				if(!pays[i].save(get_TrxName()))
				{
					try 
					{
						DB.rollback(false, get_TrxName());
					} 
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return false;
				}
			}
		}
		return true;
	}
	
	/**
	 * @param success
	 */
	protected boolean afterDelete(boolean success) 
	{
		if(success)
		{
			try 
			{
				MPayment[] pays=getPayments(get_TrxName());
				for(int i=0;i<pays.length;i++)
					if(!pays[i].delete(false, get_TrxName()))
					{
						String msg="No se pudo eliminar alguno de los pagos vinculados al documento que se está eliminando. Se cancelará la operación";
						s_log.severe(msg);
						ADialog.error(0, null, msg);
						return false;
					}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				return false;
			}
		}
		return success;
	}
	
	/**
	 * Devuelve un array con todos los payments vinculados a la cabecera
	 * @param trxName
	 * @return MPayment[] array con los pagos vinculados al documento
	 * @throws SQLException
	 */
	public MPayment[] getPayments(String trxName) throws SQLException
	{
		MPayment[] result= new MPayment[0];
		ArrayList<MPayment> pays = new ArrayList<MPayment>();
		
		String sql=""
			+ " SELECT * FROM C_Payment "
			+ " WHERE LAR_PaymentHeader_ID = "+getLAR_PaymentHeader_ID();
		
		PreparedStatement pstmt;
		pstmt = DB.prepareStatement(sql, null);
		ResultSet rs=null;
		
		try
		{
			rs=pstmt.executeQuery();
			while(rs.next())
				pays.add(new MPayment(getCtx(),rs,trxName));
		}
		catch (SQLException e)
		{
			DB.close(rs, pstmt);
			throw e;
		}
		finally
		{
			DB.close(rs, pstmt);
			rs=null;pstmt=null;
		}
		
		result=pays.toArray(result);
		
		return result;
	}
	
	/**
	 * 	Process document
	 *	@param processAction document action
	 *	@return true if performed
	 */
	public boolean processIt (String processAction)
	{
		MPayment[] pays;
		try 
		{
			pays = getPayments(get_TrxName());
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			return false;
		}
		
		for(int i=0;i<pays.length;i++)
		{
			if(!pays[i].processIt(processAction))
			{
				try 
				{
					DB.rollback(false, get_TrxName());
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
				return false;
			}
			if(!pays[i].save(get_TrxName()))
			{
				try 
				{
					DB.rollback(false, get_TrxName());
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
				return false;
			}
		}
		
		if(!isProcessed())
			setProcessed(true);
		
		setDocStatus(processAction);
		
		if(!save())
		{
			try 
			{
				DB.rollback(false, get_TrxName());
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return false;
		}
		return true;
		
	}	//	process
	
}	//	MLARPaymentHeader
