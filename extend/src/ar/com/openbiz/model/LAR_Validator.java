/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.openbiz.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.I_C_Invoice;
import org.compiere.model.MBPartner;
import org.compiere.model.MClient;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPayment;
import org.compiere.model.MInvoice;
import org.compiere.model.MSysConfig;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.util.LAR_Utils;


/**
 *	Validator for Localization Argentina 
 *	
 *  @author Alejandro Falcone - afalcone - OPENBIZ - http://openbiz.com.ar
 */
public class LAR_Validator implements ModelValidator
{
	/**
	 *	Constructor.
	 *	The class is instanciated when logging in and client is selected/known
	 */
	public LAR_Validator ()
	{
		super ();
	}	//	MyValidator
	
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(LAR_Validator.class);
	/** Client			*/
	private int		m_AD_Client_ID = -1;
	
	/**
	 *	Initialize Validation
	 *	@param engine validation engine 
	 *	@param client client
	 */
	public void initialize (ModelValidationEngine engine, MClient client)
	{
		
		//Client = null for global validator
		if (client != null) {	
			m_AD_Client_ID = client.getAD_Client_ID();
			log.info(client.toString());
		}
		else  {
			log.info("Initializing global validator: "+this.toString());
		}

	
		//	Tables to be monitored
		engine.addModelChange(MBPartner.Table_Name, this);
		engine.addModelChange(MOrgInfo.Table_Name, this);
		engine.addModelChange(MInvoice.Table_Name, this);
		
		//german wagner custom
		engine.addModelChange(MPayment.Table_Name, this);
		
		
		// Document to be monitored
		engine.addDocValidate(I_C_Invoice.Table_Name, this);
		

	}	//	initialize

    /**
     *	Model Change of a monitored Table.
     *	Called after PO.beforeSave/PO.beforeDelete
     *	when you called addModelChange for the table
     *	@param po persistent object
     *	@param type TYPE_
     *	@return error message or null
     *	@exception Exception if the recipient wishes the change to be not accept.
     */
	public String modelChange (PO po, int type) throws Exception
	{
		log.info(po.get_TableName() + " Type: "+type);
		String msg;

		if (po.get_TableName().equals(MBPartner.Table_Name) && (	type == ModelValidator.TYPE_BEFORE_NEW || 
																	type == ModelValidator.TYPE_BEFORE_CHANGE))
		{
			MBPartner bp = (MBPartner) po;
			
			Integer claseDoc_ID= (Integer) bp.get_Value("LAR_ClaseDocumento_ID");
			String taxID = bp.getTaxID();
			
			// Valida que el nro. documento ingresado sea unico
			if(taxID != null && !LAR_Utils.taxIDUnico(taxID, bp))
				// El documento ingresado ya Existe 
				return Msg.getMsg(bp.getCtx(), "LAR_CUITDuplicated");
			
			// Si el tipo de documento requiere validacion => lo valida
			if (taxID != null && validationRequired(claseDoc_ID, bp.get_TrxName())) 
			{
				msg = taxIDValido(taxID, bp.getCtx());
				if (msg != null)
					return msg;  
			}
	
			// Verifica si esta habilitado asignar el nro. de documento como Value del BPartner....
			if(MSysConfig.getBooleanValue ("LAR_CUIT_AS_VALUE", false, Env.getAD_Client_ID(bp.getCtx())))
					asignarValue(bp,taxID);
	
		}
	
		if (po.get_TableName().equals(MBPartner.Table_Name) && (type == ModelValidator.TYPE_BEFORE_DELETE ))
		{
			MBPartner bp = (MBPartner) po;
			
			msg = validaOperaciones(bp);	// Valida que  no haya operaciones (OC, Facturas, Pagos) para este socio de Negocios
			if (msg != null)
				return msg; 
			
		}
		
		if (po.get_TableName().equals(MOrgInfo.Table_Name) && (	type == ModelValidator.TYPE_BEFORE_NEW || 
				type == ModelValidator.TYPE_BEFORE_CHANGE))
		{
			MOrgInfo oi = (MOrgInfo) po;
			
			String taxID = oi.getTaxID();
			
			// Valida el numero de documento... al ser Organizacion el unico tipo valido es el CUIT
			if (taxID != null) 
			{
				msg = taxIDValido(taxID, oi.getCtx());
				if (msg != null)
				return msg;  
			}
			
		}

	//german wagner custom
	//{
		if 
			(po.get_TableName().equals(MPayment.Table_Name) && 
					(	type == ModelValidator.TYPE_BEFORE_NEW || type == ModelValidator.TYPE_BEFORE_CHANGE))
		{
			MPayment pay = (MPayment) po;
			Integer source = (Integer) pay.get_Value("LAR_PaymentSource_ID");
			
			if((source==null)||(source <=0))
				return null;
			
			msg=setReconcilied(source, "Y", pay.get_TrxName());
			if(msg!=null)
				return msg;
			
			msg=setReconcilied(pay.getC_Payment_ID(),"Y", pay.get_TrxName());
			if(msg!=null)
				return msg;
			
		}
		
		if 
		(po.get_TableName().equals(MPayment.Table_Name) && (type == ModelValidator.TYPE_BEFORE_DELETE ))
		{
			MPayment pay = (MPayment) po;
			Integer source = (Integer) pay.get_Value("LAR_PaymentSource_ID");

			if((source==null)||(source <=0))
				return null;

			msg=setReconcilied(source, "N", pay.get_TrxName());
			if(msg!=null)
				return msg;
		}

		
		if (po.get_TableName().equals(MInvoice.Table_Name) && 
				(type == ModelValidator.TYPE_BEFORE_CHANGE ||
				 type == ModelValidator.TYPE_BEFORE_NEW 
				)
			)
		{
			MInvoice inv = (MInvoice)po;
			log.info(po.toString());
			
			// Verifica que el documento no este ya ingresado 
			msg= isUniqueInvoice(inv);
			if (msg != null)
				return msg;
			
		}
		
			
		//}
		return null;
	}	//	modelChange
	
	 
	/**
	 * german wagner
	 * @param payID
	 * @param value valor en que se seteara el campo isreconcilied
	 * @param trxName
	 * @return
	 */
	private String setReconcilied(Integer payID, String value, String trxName) 
	{
		String sql="UPDATE C_Payment SET isReconciled='"+value+"' WHERE C_Payment_ID="+payID;
		
		int result = DB.executeUpdate(sql, trxName);
		if(result<0)
			return "ERROR al setear los pagos como reconciliados";
		
		return null;
	}

	/**
	 * Valida que no existan operaciones (OC, Facturas, Pagos) registradas para el BP que se desea borrar
	 * @param bp
	 * @return
	 * @throws SQLException
	 */
	private String validaOperaciones(MBPartner bp) throws SQLException {
		
		int C_BPartner_ID= bp.getC_BPartner_ID();
		int cant = 0;

		// C_Order
		String sqlsearch = "SELECT Count(*) "
			             +  " FROM C_Order"
			             + " WHERE C_BPartner_ID = "+ C_BPartner_ID 
		                  +  " AND AD_Client_ID = "+ Env.getAD_Client_ID(bp.getCtx());
		
		
		PreparedStatement pstmtsearch = DB.prepareStatement(sqlsearch, bp.get_TrxName());
		ResultSet rssearch = pstmtsearch.executeQuery();
		if (rssearch.next())
			cant = rssearch.getInt(1);
		rssearch.close();
		pstmtsearch.close();
		
		if (cant > 0)
			return Msg.getMsg(bp.getCtx(), "LAR_BPNotDeleted")+" (Ordenes)"; 
		
		// C_Invoice
		sqlsearch = "SELECT Count(*) "
            +  " FROM C_Invoice"
            + " WHERE C_BPartner_ID = "+ C_BPartner_ID 
             +  " AND AD_Client_ID = "+ Env.getAD_Client_ID(bp.getCtx());


		pstmtsearch = DB.prepareStatement(sqlsearch, bp.get_TrxName());
		rssearch = pstmtsearch.executeQuery();
		if (rssearch.next())
			cant = rssearch.getInt(1);
		rssearch.close();
		pstmtsearch.close();
		
		if (cant > 0)
			return Msg.getMsg(bp.getCtx(), "LAR_BPNotDeleted")+" (Facturas)"; 
		
		// C_Payment
		sqlsearch = "SELECT Count(*) "
            +  " FROM C_Payment"
            + " WHERE C_BPartner_ID = "+ C_BPartner_ID 
             +  " AND AD_Client_ID = "+ Env.getAD_Client_ID(bp.getCtx());


		pstmtsearch = DB.prepareStatement(sqlsearch, bp.get_TrxName());
		rssearch = pstmtsearch.executeQuery();
		if (rssearch.next())
			cant = rssearch.getInt(1);
		rssearch.close();
		pstmtsearch.close();
		
		if (cant > 0)
			return Msg.getMsg(bp.getCtx(), "LAR_BPNotDeleted")+" (Pagos)"; 
		
		
		return null;
		
	}  //  validaOperaciones
	
	public static boolean IsNumeric(String s){
		for(int i=0;i<s.length();i++){
			if(s.charAt(i) < '0' || s.charAt(i)> '9' )
				return false;
		}
		return true;
	}  //  IsNumeric
	
	private String taxIDValido (String taxID, Properties ctx)  throws SQLException {

        taxID = taxID.replace( " ","" );
        
        log.fine("taxID = "+taxID.toString());
		
		if (taxID.length()==13 || taxID.length()==12){
			taxID = taxID.replace( "-","" );
		}
		
		if(!IsNumeric(taxID))
			return Msg.getMsg(ctx , "LAR_CUITNotNumber"); //"CUIT/CUIL debe ser NUMERICO";
		
		char[] arreglo = taxID.toCharArray();
		
		if (arreglo.length != 11){
			return Msg.getMsg(ctx , "LAR_CUITLengthInvalid");
		}
		
		// Valida 2 primeros digitos 
		int digitos = Integer.parseInt(taxID.substring(0, 2));
		if (digitos != 20 && digitos != 23 && digitos != 24 && digitos != 27 && digitos != 30 && digitos != 33 && digitos != 34)
			return Msg.getMsg(ctx , "LAR_CUITInvalidStart")+ taxID.substring(0, 2);   //El CUIT/CUIL comienza con un valor invalido

	    if (!LAR_Utils.validateCUIT(taxID)) {
      	return Msg.getMsg(ctx , "LAR_CUITInvalid");  // CUIT/CUIL INVALIDO
        }
		
	    return null;
	
	}  //  taxIDValido

	/**
	 * Asigna el nro. documento como Value del BP
	 * @param bp
	 * @param taxID
	 * @return
	 */
	private String asignarValue(MBPartner bp, String taxID) {
		
		if (taxID != null && taxID.compareTo("") != 0 && Double.parseDouble(taxID.replace( "-","" )) != 0)
			bp.setValue(taxID);
		
		return null;
	}  //  asignarValue
	
	/**
	 * Verifica si la Clase de Documento requiere que posteriormente se valide el numero
	 * @param claseDoc_ID
	 * @param bp
	 * @return
	 * @throws SQLException
	 */
	private boolean validationRequired(Integer claseDoc_ID, String trxName) throws SQLException {
		boolean validationRequired = false;
		
		String sqlvalida = 
			  "SELECT IsValidationRequired "
			 + " FROM LAR_ClaseDocumento"
			+ " WHERE LAR_ClaseDocumento_ID = " + claseDoc_ID +
			   " AND IsActive = 'Y'";
		
		PreparedStatement pstmtvalida = DB.prepareStatement(sqlvalida, trxName);
		ResultSet rsvalida = pstmtvalida.executeQuery();
		if (rsvalida.next())
			validationRequired = rsvalida.getString(1).equals("Y") ? true : false;
		rsvalida.close();
		pstmtvalida.close();
		return validationRequired;
	}  //  validationRequired

	
	
	
	/**
	 * Search if the Invoice to be Saved exist
	 * @param isSOTrx
	 * @param ad_client_id
	 * @param c_DocType_ID
	 * @param cmpDocumentNo
	 * @param c_BPartner_ID
	 * @param dateinvoiced
	 * @return Error msg if the invoice exists or null otherwise
	 */
	private String isUniqueInvoice(MInvoice inv)
			
	{
		if (inv.isSOTrx()) // No valida Facturas Venta
			return null;
		
		boolean isSOTrx = inv.isSOTrx();
		int ad_client_id = inv.getAD_Client_ID();
		int c_DocType_ID =  inv.getC_DocTypeTarget_ID();      //inv.getC_DocType_ID();
		
		if (inv.getDocumentNo()== null)
			return "Falta ingresar Nro.Documento";
		
		String c_DocumentNo =  inv.getDocumentNo();
		int c_BPartner_ID = inv.getC_BPartner_ID();
		int c_Invoice_ID = inv.getC_Invoice_ID();
		
		int no= 0;
		
		String sql = "SELECT Count(*) FROM C_Invoice " +
				     " WHERE AD_Client_ID = "+ad_client_id +
				       " AND DocumentNo = '"+c_DocumentNo +"'"+
				       " AND (C_DocType_ID="+c_DocType_ID+" or C_DocTypeTarget_ID="+c_DocType_ID+")" +
				       " AND C_Invoice_ID <> "+c_Invoice_ID +
				       " AND DocStatus NOT IN ('VO','RE') ";
		
		
		if (!isSOTrx)
			sql = sql + " AND C_BPartner_ID="+c_BPartner_ID;
		
		try
		{
			PreparedStatement pstmt = DB.prepareStatement (sql, inv.get_TrxName());
			ResultSet rs = pstmt.executeQuery ();
			if (rs.next())
				no= rs.getInt(1);
			rs.close();
			pstmt.close();
			
			if (no > 0)
				return "Documento Duplicado";
			
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, "Searching for Unique Invoice", e);
			return "SQLException: Searching for Unique Invoice - "+ e.toString();
		}
			
		return null;
	}
	
	
	
	/**
	 *	Validate Document.
	 *	Called as first step of DocAction.prepareIt 
     *	when you called addDocValidate for the table.
     *	Note that totals, etc. may not be correct.
	 *	@param po persistent object
	 *	@param timing see TIMING_ constants
     *	@return error message or null
	 */
	public String docValidate (PO po, int timing)
	{
		
		log.info(po.get_TableName() + " Timing: "+timing);
		String msg;

		// Validaciones sobre O.C.
		if (po.get_TableName().equals(I_C_Invoice.Table_Name) && timing == TIMING_BEFORE_VOID) {
			msg = anulaNroDocumento((MInvoice) po);
			if (msg != null)
				return msg;
			
		}
		return null;
	}	//	docValidate

	private String anulaNroDocumento(MInvoice inv)	
	{
		
		if (inv.isSOTrx()) // No modifica numero documento si es Facturas Venta
			return null;
		
		int ad_client_id = inv.getAD_Client_ID();
		int c_DocType_ID =  inv.getC_DocTypeTarget_ID();      
		int c_Invoice_ID = inv.getC_Invoice_ID();
		int c_BPartner_ID = inv.getC_BPartner_ID();
		
		Integer lar_Prefijo = inv.get_ValueAsInt("LAR_Prefijo");
		Integer lar_NroDoc  = inv.get_ValueAsInt("LAR_NroDoc");
		
		String sNroDoc = "00000000"+lar_NroDoc.toString().trim();
		sNroDoc = sNroDoc.substring(sNroDoc.length() - 8);

		String c_DocumentNo= null;
		lar_Prefijo = 999;
		
		int no = 0;
		do {
		
			String sPrefijo = "V"+lar_Prefijo.toString().trim();
			sPrefijo = sPrefijo.substring(sPrefijo.length() - 4);
			
			c_DocumentNo= sPrefijo+"-"+sNroDoc;
		
			String sql = "SELECT Count(*) FROM C_Invoice " +
			" WHERE AD_Client_ID = "+ad_client_id +
			" AND DocumentNo = '"+c_DocumentNo +"'"+
			" AND (C_DocType_ID="+c_DocType_ID+" or C_DocTypeTarget_ID="+c_DocType_ID+")" +
			" AND C_Invoice_ID <> "+c_Invoice_ID +
			" AND C_BPartner_ID="+c_BPartner_ID;

			try
			{
				PreparedStatement pstmt = DB.prepareStatement (sql, inv.get_TrxName());
				ResultSet rs = pstmt.executeQuery ();
				if (rs.next())
					no= rs.getInt(1);
				rs.close();
				pstmt.close();
				
				if (no > 0)
					lar_Prefijo --;
				
			}
			catch (SQLException e)
			{
				log.log(Level.SEVERE, "Anular Documento", e);
				return "SQLException: Anular Documento - "+ e.toString();
			}
		    
		 } while ( no > 0 );
		
		log.fine("Asigna Nro Doc="+c_DocumentNo);
		
		inv.setDocumentNo(c_DocumentNo);
		
		
		return null;
	}
	
	/**
	 *	User Login.
	 *	Called when preferences are set
	 *	@param AD_Org_ID org
	 *	@param AD_Role_ID role
	 *	@param AD_User_ID user
	 *	@return error message or null
	 */
	public String login (int AD_Org_ID, int AD_Role_ID, int AD_User_ID)
	{
		log.info("AD_User_ID=" + AD_User_ID);
		return null;
	}	//	login

	
	/**
	 *	Get Client to be monitored
	 *	@return AD_Client_ID client
	 */
	public int getAD_Client_ID()
	{
		return m_AD_Client_ID;
	}	//	getAD_Client_ID

	
	/**
	 * 	String Representation
	 *	@return info
	 */
	@Override
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("LAR_Validator");
		return sb.toString ();
	}	//	toString
	
}	//	LAR_Validator