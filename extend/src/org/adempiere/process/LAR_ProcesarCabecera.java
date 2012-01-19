package org.adempiere.process;

import java.util.logging.Level;

import org.compiere.model.MLARPaymentHeader;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;

/**
 * 
 * @author german wagner
 *
 */
public class LAR_ProcesarCabecera extends SvrProcess
{
	private String accion = null;
	private Integer paymentHeader_ID = null;
	
	protected void prepare() 
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			
			if (para[i].getParameter() == null)
				;
			else if (name.equals("Accion"))
			{
				accion = para[i].getParameter().toString();
			}
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
		String result="Documento procesado con éxito";
		
		MLARPaymentHeader header = new MLARPaymentHeader(getCtx(),paymentHeader_ID, get_TrxName());
		if(!header.processIt(accion))
			result="No se pudo procesar el documento";
		
		return result;
	}
}
