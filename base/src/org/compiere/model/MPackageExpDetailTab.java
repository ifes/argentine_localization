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
 * Contributor(s): ______________________________________.                    *
 *****************************************************************************/
package org.compiere.model;

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.util.DB;

/**
 *	Menu Model
 *	
 *  @author Jorg Janke
 *  @version $Id: MMenu.java,v 1.5 2005/05/14 05:32:16 jjanke Exp $
 */
public class MPackageExpDetailTab extends X_AD_Package_Exp_Detail_Tab
{	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5110078103695767282L;



	/**
	 * 	MPackageExpDetail
	 *	@param ctx
	 *	@param int
	 */
	public MPackageExpDetailTab (Properties ctx, int AD_Package_Exp_Detail_ID, String trxName)
	{
		super(ctx, AD_Package_Exp_Detail_ID, trxName);		
		
	}	//	MPackageExpDetailTab 

	/**
	 * 	MPackageExp
	 *	@param ctx
	 *	@param rs
	 */
	public MPackageExpDetailTab (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);		
		
	}	//	MPackageExpDetailTab 
	

	
	/* (non-Javadoc)
	 * @see org.compiere.model.PO#beforeSave(boolean)
	 */
	@Override
	protected boolean beforeSave(boolean newRecord) {
		if (getLine() == 0) {
			final String sql = "SELECT max("+COLUMNNAME_Line+")"
								+ "FROM "+Table_Name
								+ " WHERE "+COLUMNNAME_AD_Package_Exp_Detail_ID+"=?"
									+" AND "+COLUMNNAME_AD_Package_Exp_Detail_Tab_ID+"<>?";
			int lineNo = DB.getSQLValue(get_TrxName(), sql, getAD_Package_Exp_Detail_ID(), getAD_Package_Exp_Detail_Tab_ID());
			if (lineNo >= 0)
				setLine(lineNo+10);
		}
		//
		return true;
	}
}	//	MMenu
