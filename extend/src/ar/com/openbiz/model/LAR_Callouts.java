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

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 *	User Callout for LAR Localization ARgentina
 *		
 *  @author Alejandro Falcone - OPENBIZ - info@openbiz.com.ar
 *  
 */
public class LAR_Callouts extends CalloutEngine
{
	/**
	 *	Set Default Clase Documento based on Tipo Contribuyente 
	 *
	 *  @param ctx context
	 *  @param WindowNo current Window No
	 *  @param mTab Grid Tab
	 *  @param mField Grid Field
	 *  @param value New Value
	 *  @return "" or error message
	 */
	public  String tipoContribuyente (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value, Object oldValue)
	{
		Integer LAR_TipoContribuyente_ID = (Integer)value;
		
		if (LAR_TipoContribuyente_ID == null || LAR_TipoContribuyente_ID.intValue() == 0)
			return "";
		
		String sql = "SELECT LAR_ClaseDocumento_ID " 
			       + "FROM LAR_TipoContribuyente "
			       + "WHERE LAR_Tipocontribuyente_ID=? AND IsActive='Y'";		//	#1

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, null);
			pstmt.setInt(1, LAR_TipoContribuyente_ID.intValue());
			rs = pstmt.executeQuery();
			//
			if (rs.next())
			{
				int claseDoc= rs.getInt("LAR_ClaseDocumento_ID");
				
				if (claseDoc == 0)
					mTab.setValue("LAR_ClaseDocumento_ID", null);
				else
					mTab.setValue("LAR_ClaseDocumento_ID", new Integer(claseDoc));
				
			}
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, "LARTipoContribuyente", e);
			return e.getLocalizedMessage();
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}
		return "";
	}	//	tipoContribuyente
	
	/**
	 *	Invoice Header - DocType.
	 *		- PaymentRule
	 *		- temporary Document
	 *  Context:
	 *  	- DocSubTypeSO
	 *		- HasCharges
	 *	- (re-sets Business Partner info of required)
	 *	@param ctx context
	 *	@param WindowNo window no
	 *	@param mTab tab
	 *	@param mField field
	 *	@param value value
	 *	@return null or error message
	 */
	public String docType (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer C_DocType_ID = (Integer)value;
		if (C_DocType_ID == null || C_DocType_ID.intValue() == 0)
			return "";

		String sql = "SELECT d.IsDocNoControlled," // 1
			+ "s.CurrentNext, COALESCE(s.Prefix,'0') " //2..3
			+ "FROM C_DocType d, AD_Sequence s "
			+ "WHERE C_DocType_ID=?"		//	1
			+ " AND d.DocNoSequence_ID=s.AD_Sequence_ID(+)";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, null);
			pstmt.setInt(1, C_DocType_ID.intValue());
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				//	DocumentNo
				if (rs.getString(1).equals("Y"))
				{
					
					String sPrefijo = rs.getString(3).replace("-", "");
					
					if(!LAR_Validator.IsNumeric(sPrefijo))
						sPrefijo="";
					
					Integer iPrefijo = Integer.parseInt(sPrefijo); //rs.getInt(3);
					Integer iNroDoc  = rs.getInt(2);
					mTab.setValue("LAR_Prefijo", iPrefijo);
					mTab.setValue("LAR_NroDoc", iNroDoc);
				}
			}
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
			return e.getLocalizedMessage();
		}
		finally
		{
			DB.close(rs, pstmt);
		}
		return "";
	}	//	docType
	
	
	/**
	 * Completa el NroDocumento con los valores ingresados por el usuario en Prefijo y Documento. Solo para Documentos de Compra.
	 * @param ctx
	 * @param WindowNo
	 * @param mTab
	 * @param mField
	 * @param value
	 * @return
	 */
	public String lar_PrefixDoc (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		
		if (Env.getContext(ctx,WindowNo,"IsSOTrx").equals("Y"))
			return "";
		
		String column = mField.getColumnName();
		if (value == null)
			return "";

		Integer LAR_Prefijo = 0;
		Integer LAR_NroDoc = 0;
		if (column.equals("LAR_Prefijo"))
		{
			LAR_Prefijo = ((Integer)value).intValue();
			LAR_NroDoc = Env.getContextAsInt(ctx, WindowNo, "LAR_NroDoc");
		}
		else
		{
			LAR_Prefijo = Env.getContextAsInt(ctx, WindowNo, "LAR_Prefijo");
			LAR_NroDoc = ((Integer)value).intValue();
		}
		
		String sPrefijo = "0000"+LAR_Prefijo.toString().trim();
		sPrefijo = sPrefijo.substring(sPrefijo.length() - 4);
		String sNroDoc = "00000000"+LAR_NroDoc.toString().trim();
		sNroDoc = sNroDoc.substring(sNroDoc.length() - 8);
		mTab.setValue("DocumentNo", sPrefijo+"-"+sNroDoc);

	return "";	
	}  //  lar_PrefixDoc
	
	
}  // LAR_Callouts