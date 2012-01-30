/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
/** Generated Model - DO NOT CHANGE */
package org.compiere.model;

import java.sql.ResultSet;
import java.util.Properties;

/** Generated Model for AD_Package_Exp_Detail_Tab
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS - $Id$ */
public class X_AD_Package_Exp_Detail_Tab extends PO implements I_AD_Package_Exp_Detail_Tab, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120127L;

    /** Standard Constructor */
    public X_AD_Package_Exp_Detail_Tab (Properties ctx, int AD_Package_Exp_Detail_Tab_ID, String trxName)
    {
      super (ctx, AD_Package_Exp_Detail_Tab_ID, trxName);
      /** if (AD_Package_Exp_Detail_Tab_ID == 0)
        {
			setAD_Package_Exp_Detail_ID (0);
// @AD_Package_Exp_Detail_ID@
			setAD_Package_Exp_Detail_Tab_ID (0);
			setDescription (null);
        } */
    }

    /** Load Constructor */
    public X_AD_Package_Exp_Detail_Tab (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 4 - System 
      */
    protected int get_AccessLevel()
    {
      return accessLevel.intValue();
    }

    /** Load Meta Data */
    protected POInfo initPO (Properties ctx)
    {
      POInfo poi = POInfo.getPOInfo (ctx, Table_ID, get_TrxName());
      return poi;
    }

    public String toString()
    {
      StringBuffer sb = new StringBuffer ("X_AD_Package_Exp_Detail_Tab[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public I_AD_Package_Exp_Detail getAD_Package_Exp_Detail() throws RuntimeException
    {
		return (I_AD_Package_Exp_Detail)MTable.get(getCtx(), I_AD_Package_Exp_Detail.Table_Name)
			.getPO(getAD_Package_Exp_Detail_ID(), get_TrxName());	}

	/** Set Package Exp. Detail.
		@param AD_Package_Exp_Detail_ID Package Exp. Detail	  */
	public void setAD_Package_Exp_Detail_ID (int AD_Package_Exp_Detail_ID)
	{
		if (AD_Package_Exp_Detail_ID < 1) 
			set_Value (COLUMNNAME_AD_Package_Exp_Detail_ID, null);
		else 
			set_Value (COLUMNNAME_AD_Package_Exp_Detail_ID, Integer.valueOf(AD_Package_Exp_Detail_ID));
	}

	/** Get Package Exp. Detail.
		@return Package Exp. Detail	  */
	public int getAD_Package_Exp_Detail_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AD_Package_Exp_Detail_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set AD_Package_Exp_Detail_Tab_ID.
		@param AD_Package_Exp_Detail_Tab_ID 
		Tab to be exported
	  */
	public void setAD_Package_Exp_Detail_Tab_ID (int AD_Package_Exp_Detail_Tab_ID)
	{
		if (AD_Package_Exp_Detail_Tab_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_AD_Package_Exp_Detail_Tab_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_AD_Package_Exp_Detail_Tab_ID, Integer.valueOf(AD_Package_Exp_Detail_Tab_ID));
	}

	/** Get AD_Package_Exp_Detail_Tab_ID.
		@return Tab to be exported
	  */
	public int getAD_Package_Exp_Detail_Tab_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AD_Package_Exp_Detail_Tab_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_AD_Tab getAD_Tab() throws RuntimeException
    {
		return (I_AD_Tab)MTable.get(getCtx(), I_AD_Tab.Table_Name)
			.getPO(getAD_Tab_ID(), get_TrxName());	}

	/** Set Tab.
		@param AD_Tab_ID 
		Tab within a Window
	  */
	public void setAD_Tab_ID (int AD_Tab_ID)
	{
		if (AD_Tab_ID < 1) 
			set_Value (COLUMNNAME_AD_Tab_ID, null);
		else 
			set_Value (COLUMNNAME_AD_Tab_ID, Integer.valueOf(AD_Tab_ID));
	}

	/** Get Tab.
		@return Tab within a Window
	  */
	public int getAD_Tab_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AD_Tab_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_AD_Window getAD_Window() throws RuntimeException
    {
		return (I_AD_Window)MTable.get(getCtx(), I_AD_Window.Table_Name)
			.getPO(getAD_Window_ID(), get_TrxName());	}

	/** Set Window.
		@param AD_Window_ID 
		Data entry or display window
	  */
	public void setAD_Window_ID (int AD_Window_ID)
	{
		if (AD_Window_ID < 1) 
			set_Value (COLUMNNAME_AD_Window_ID, null);
		else 
			set_Value (COLUMNNAME_AD_Window_ID, Integer.valueOf(AD_Window_ID));
	}

	/** Get Window.
		@return Data entry or display window
	  */
	public int getAD_Window_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AD_Window_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Description.
		@param Description 
		Optional short description of the record
	  */
	public void setDescription (String Description)
	{
		set_Value (COLUMNNAME_Description, Description);
	}

	/** Get Description.
		@return Optional short description of the record
	  */
	public String getDescription () 
	{
		return (String)get_Value(COLUMNNAME_Description);
	}

	/** Set Line No.
		@param Line 
		Unique line for this document
	  */
	public void setLine (int Line)
	{
		set_Value (COLUMNNAME_Line, Integer.valueOf(Line));
	}

	/** Get Line No.
		@return Unique line for this document
	  */
	public int getLine () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Line);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}
}