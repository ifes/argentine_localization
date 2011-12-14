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
package org.openbiz.model;

import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Model for LAR_TipoContribuyente
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS - $Id$ */
public class X_LAR_TipoContribuyente extends PO implements I_LAR_TipoContribuyente, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20110728L;

    /** Standard Constructor */
    public X_LAR_TipoContribuyente (Properties ctx, int LAR_TipoContribuyente_ID, String trxName)
    {
      super (ctx, LAR_TipoContribuyente_ID, trxName);
      /** if (LAR_TipoContribuyente_ID == 0)
        {
			setDiscriminateTax (false);
			setLAR_TipoContribuyente_ID (0);
			setName (null);
			setValue (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_TipoContribuyente (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 6 - System - Client 
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
      StringBuffer sb = new StringBuffer ("X_LAR_TipoContribuyente[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Codigo AFIP.
		@param CodeAFIP 
		Codigo segun AFIP
	  */
	public void setCodeAFIP (int CodeAFIP)
	{
		set_Value (COLUMNNAME_CodeAFIP, Integer.valueOf(CodeAFIP));
	}

	/** Get Codigo AFIP.
		@return Codigo segun AFIP
	  */
	public int getCodeAFIP () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_CodeAFIP);
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

	/** Set Discrimina I.V.A..
		@param DiscriminateTax 
		Discrimina el I.V.A.
	  */
	public void setDiscriminateTax (boolean DiscriminateTax)
	{
		set_Value (COLUMNNAME_DiscriminateTax, Boolean.valueOf(DiscriminateTax));
	}

	/** Get Discrimina I.V.A..
		@return Discrimina el I.V.A.
	  */
	public boolean isDiscriminateTax () 
	{
		Object oo = get_Value(COLUMNNAME_DiscriminateTax);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	public org.openbiz.model.I_LAR_ClaseDocumento getLAR_ClaseDocumento() throws RuntimeException
    {
		return (org.openbiz.model.I_LAR_ClaseDocumento)MTable.get(getCtx(), org.openbiz.model.I_LAR_ClaseDocumento.Table_Name)
			.getPO(getLAR_ClaseDocumento_ID(), get_TrxName());	}

	/** Set Clase Documento.
		@param LAR_ClaseDocumento_ID 
		Clase de Documento del contribuyente
	  */
	public void setLAR_ClaseDocumento_ID (int LAR_ClaseDocumento_ID)
	{
		if (LAR_ClaseDocumento_ID < 1) 
			set_Value (COLUMNNAME_LAR_ClaseDocumento_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_ClaseDocumento_ID, Integer.valueOf(LAR_ClaseDocumento_ID));
	}

	/** Get Clase Documento.
		@return Clase de Documento del contribuyente
	  */
	public int getLAR_ClaseDocumento_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_ClaseDocumento_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Tipo Contribuyente.
		@param LAR_TipoContribuyente_ID 
		Tipo de contribuyente
	  */
	public void setLAR_TipoContribuyente_ID (int LAR_TipoContribuyente_ID)
	{
		if (LAR_TipoContribuyente_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_TipoContribuyente_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_TipoContribuyente_ID, Integer.valueOf(LAR_TipoContribuyente_ID));
	}

	/** Get Tipo Contribuyente.
		@return Tipo de contribuyente
	  */
	public int getLAR_TipoContribuyente_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_TipoContribuyente_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Name.
		@param Name 
		Alphanumeric identifier of the entity
	  */
	public void setName (String Name)
	{
		set_Value (COLUMNNAME_Name, Name);
	}

	/** Get Name.
		@return Alphanumeric identifier of the entity
	  */
	public String getName () 
	{
		return (String)get_Value(COLUMNNAME_Name);
	}

    /** Get Record ID/ColumnName
        @return ID/ColumnName pair
      */
    public KeyNamePair getKeyNamePair() 
    {
        return new KeyNamePair(get_ID(), getName());
    }

	/** Set Search Key.
		@param Value 
		Search key for the record in the format required - must be unique
	  */
	public void setValue (String Value)
	{
		set_Value (COLUMNNAME_Value, Value);
	}

	/** Get Search Key.
		@return Search key for the record in the format required - must be unique
	  */
	public String getValue () 
	{
		return (String)get_Value(COLUMNNAME_Value);
	}
}