package org.adempiere.process;

import java.awt.Frame;
import java.util.logging.Level;

import org.compiere.apps.AEnv;
import org.compiere.apps.search.Info;
import org.compiere.apps.search.InfoDocEnCartera;
import org.compiere.model.MLARPaymentHeader;
import org.compiere.model.MPayment;
import org.compiere.model.PO;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereSystemError;
import org.compiere.util.Env;

/**
 * 
 * @author german wagner
 *
 */
public class LAR_SeleccionarDocumentosEnCartera extends SvrProcess
{
	private Integer paymentHeader_ID = null;
	
	protected void prepare() 
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			
			if (para[i].getParameter() == null)
				;
			else if (name.equals("LAR_PaymentHeader_ID"))
			{
				paymentHeader_ID = para[i].getParameterAsInt();
			}
			else
			{
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
			}
		}

	}
	
	protected String doIt() throws Exception 
	{
		String result="No se seleccionaron documentos";
		
		MLARPaymentHeader header = new MLARPaymentHeader(getCtx(),paymentHeader_ID, get_TrxName());
		
		Frame frame=new Frame();
		String usedDocs="" 	//Consulta que devuelve el ID de los documentos (recibos) que ya 
			+ "SELECT "		//fueron transferidos en algún pago, siempre y cuando ese pago no haya sido cancelado
			+ "		distinct(REC.c_payment_id) "
			+ "FROM c_payment PAY "
			+ "		INNER JOIN c_payment REC "
			+ "		ON REC.c_payment_id = PAY.lar_paymentsource_id " 
			+ "		AND REC.Processed='Y' "
			+ "		AND REC.isReceipt='Y' "
			+ "		AND PAY.docstatus NOT IN('IN', 'RE', 'VO')  "
			;
		
		String whereSQL="isReceipt='Y' AND Docstatus IN ('CO','CL') AND TenderType IN ('K') AND C_Payment_ID NOT IN ("+usedDocs+")";
		Info inf=InfoDocEnCartera.create(frame, true, 0, "C_Payment", "C_Payment_ID", "", true, whereSQL);
		AEnv.showCenterWindow(frame, inf);
		Object[] pays=inf.getSelectedKeys();
		
		if(pays==null)
			return result;
		
		for(int i=0;i< pays.length;i++)
		{
			MPayment receipt = new MPayment(Env.getCtx(),(Integer)pays[i],get_TrxName());
			MPayment pay = new MPayment(Env.getCtx(),0,get_TrxName());
			PO.copyValues(receipt, pay);
			pay.set_CustomColumn("LAR_PaymentHeader_ID", header.getLAR_PaymentHeader_ID());
			pay.set_CustomColumn("LAR_PaymentSource_ID", receipt.getC_Payment_ID());
			pay.setC_DocType_ID(header.getC_DocType_ID());
			pay.setDocumentNo(header.getDocumentNo());
			pay.setDocStatus(header.getDocStatus());
			pay.setDateTrx(header.getDateTrx());
			pay.setDateAcct(header.getDateTrx());
			pay.setErrorMessage("");
			pay.setC_BPartner_ID(header.getC_BPartner_ID());
//			pay.setC_BankAccount_ID(header.getC_BankAccount_ID()); //No se modifica, ya que la cuenta de salida debe ser la misma que la de entrada
			pay.setIsReceipt(header.isReceipt());
//			pay.setProcessed(header.isProcessed());
			pay.setProcessed(false);
			pay.setIsActive(header.isActive());
			pay.setPosted(false);
			pay.setC_Invoice_ID(0);
			pay.setC_Order_ID(0);
			pay.setIsApproved(false);
			pay.setIsAllocated(false);
			pay.setIsDelayedCapture(false);
			pay.setIsOnline(false);
			pay.setIsPrepayment(false);
			pay.setIsReconciled(false);
			pay.setOProcessing("N");
			pay.setOrig_TrxID("");
			pay.setPONum("");
			pay.setRef_Payment_ID(0);
			pay.setReversal_ID(0);
			pay.setReplication(false);
			pay.setTrxType(MPayment.TRXTYPE_Sales);
			pay.setUser1_ID(0);
			pay.setUser2_ID(0);
			pay.setVoiceAuthCode("");
			pay.setOverUnderAmt(Env.ZERO);
			pay.setWriteOffAmt(Env.ZERO);
			pay.setIsOverUnderPayment(false);
			
			receipt.setIsReconciled(false);
			
			if(!pay.save(get_TrxName()))
			{
				rollback();
				throw new AdempiereSystemError("Error al seleccionar documentos");
			}
			
			if(!receipt.save(get_TrxName()))
			{
				rollback();
				throw new AdempiereSystemError("Error al seleccionar documentos");
			}

		}
		result=pays.length+" Documentos seleccionados";
		return result;
	}
}
