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
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LAR_WithholdingCertificate
 *  @author Adempiere (generated)
 *  @version 3.6.0LTS+P20110709 - $Id$ */
public class X_LAR_WithholdingCertificate extends PO implements I_LAR_WithholdingCertificate, I_Persistent
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120130L;

    /** Standard Constructor */
    public X_LAR_WithholdingCertificate (Properties ctx, int LAR_WithholdingCertificate_ID, String trxName)
    {
      super (ctx, LAR_WithholdingCertificate_ID, trxName);
      /** if (LAR_WithholdingCertificate_ID == 0)
        {
			setC_DocType_ID (0);
// 0
			setC_DocTypeTarget_ID (0);
			setC_Invoice_ID (0);
// 0
			setC_Payment_ID (0);
			setDocumentNo (null);
			setLAR_WithholdingCertificate_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LAR_WithholdingCertificate (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 7 - System - Client - Org
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
      StringBuffer sb = new StringBuffer ("X_LAR_WithholdingCertificate[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Address 1.
		@param Address1
		Address line 1 for this location
	  */
	public void setAddress1 (String Address1)
	{
		throw new IllegalArgumentException ("Address1 is virtual column");	}

	/** Get Address 1.
		@return Address line 1 for this location
	  */
	public String getAddress1 ()
	{
		return (String)get_Value(COLUMNNAME_Address1);
	}

	/** Set BP Name.
		@param BPName BP Name	  */
	public void setBPName (String BPName)
	{
		throw new IllegalArgumentException ("BPName is virtual column");	}

	/** Get BP Name.
		@return BP Name	  */
	public String getBPName ()
	{
		return (String)get_Value(COLUMNNAME_BPName);
	}

	public I_C_DocType getC_DocType() throws RuntimeException
    {
		return (I_C_DocType)MTable.get(getCtx(), I_C_DocType.Table_Name)
			.getPO(getC_DocType_ID(), get_TrxName());	}

	/** Set Document Type.
		@param C_DocType_ID
		Document type or rules
	  */
	public void setC_DocType_ID (int C_DocType_ID)
	{
		if (C_DocType_ID < 0)
			set_Value (COLUMNNAME_C_DocType_ID, null);
		else
			set_Value (COLUMNNAME_C_DocType_ID, Integer.valueOf(C_DocType_ID));
	}

	/** Get Document Type.
		@return Document type or rules
	  */
	public int getC_DocType_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_DocType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Target Document Type.
		@param C_DocTypeTarget_ID
		Target document type for conversing documents
	  */
	public void setC_DocTypeTarget_ID (int C_DocTypeTarget_ID)
	{
		if (C_DocTypeTarget_ID < 1)
			set_Value (COLUMNNAME_C_DocTypeTarget_ID, null);
		else
			set_Value (COLUMNNAME_C_DocTypeTarget_ID, Integer.valueOf(C_DocTypeTarget_ID));
	}

	/** Get Target Document Type.
		@return Target document type for conversing documents
	  */
	public int getC_DocTypeTarget_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_DocTypeTarget_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_Invoice getC_Invoice() throws RuntimeException
    {
		return (I_C_Invoice)MTable.get(getCtx(), I_C_Invoice.Table_Name)
			.getPO(getC_Invoice_ID(), get_TrxName());	}

	/** Set Invoice.
		@param C_Invoice_ID
		Invoice Identifier
	  */
	public void setC_Invoice_ID (int C_Invoice_ID)
	{
		if (C_Invoice_ID < 1)
			set_Value (COLUMNNAME_C_Invoice_ID, null);
		else
			set_Value (COLUMNNAME_C_Invoice_ID, Integer.valueOf(C_Invoice_ID));
	}

	/** Get Invoice.
		@return Invoice Identifier
	  */
	public int getC_Invoice_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Invoice_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set City.
		@param City
		Identifies a City
	  */
	public void setCity (String City)
	{
		throw new IllegalArgumentException ("City is virtual column");	}

	/** Get City.
		@return Identifies a City
	  */
	public String getCity ()
	{
		return (String)get_Value(COLUMNNAME_City);
	}

	public I_C_Payment getC_Payment() throws RuntimeException
    {
		return (I_C_Payment)MTable.get(getCtx(), I_C_Payment.Table_Name)
			.getPO(getC_Payment_ID(), get_TrxName());	}

	/** Set Payment.
		@param C_Payment_ID
		Payment identifier
	  */
	public void setC_Payment_ID (int C_Payment_ID)
	{
		if (C_Payment_ID < 1)
			set_Value (COLUMNNAME_C_Payment_ID, null);
		else
			set_Value (COLUMNNAME_C_Payment_ID, Integer.valueOf(C_Payment_ID));
	}

	/** Get Payment.
		@return Payment identifier
	  */
	public int getC_Payment_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Payment_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Document No.
		@param DocumentNo
		Document sequence number of the document
	  */
	public void setDocumentNo (String DocumentNo)
	{
		set_Value (COLUMNNAME_DocumentNo, DocumentNo);
	}

	/** Get Document No.
		@return Document sequence number of the document
	  */
	public String getDocumentNo ()
	{
		return (String)get_Value(COLUMNNAME_DocumentNo);
	}

	/** Set LAR_WithholdingCertificate.
		@param LAR_WithholdingCertificate_ID LAR_WithholdingCertificate	  */
	public void setLAR_WithholdingCertificate_ID (int LAR_WithholdingCertificate_ID)
	{
		if (LAR_WithholdingCertificate_ID < 1)
			set_ValueNoCheck (COLUMNNAME_LAR_WithholdingCertificate_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_LAR_WithholdingCertificate_ID, Integer.valueOf(LAR_WithholdingCertificate_ID));
	}

	/** Get LAR_WithholdingCertificate.
		@return LAR_WithholdingCertificate	  */
	public int getLAR_WithholdingCertificate_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_WithholdingCertificate_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set NAICS/SIC.
		@param NAICS
		Standard Industry Code or its successor NAIC - http://www.osha.gov/oshstats/sicser.html
	  */
	public void setNAICS (String NAICS)
	{
		throw new IllegalArgumentException ("NAICS is virtual column");	}

	/** Get NAICS/SIC.
		@return Standard Industry Code or its successor NAIC - http://www.osha.gov/oshstats/sicser.html
	  */
	public String getNAICS ()
	{
		return (String)get_Value(COLUMNNAME_NAICS);
	}

	/** Set Percent.
		@param Percent
		Percentage
	  */
	public void setPercent (BigDecimal Percent)
	{
		throw new IllegalArgumentException ("Percent is virtual column");	}

	/** Get Percent.
		@return Percentage
	  */
	public BigDecimal getPercent ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Percent);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set ZIP.
		@param Postal
		Postal code
	  */
	public void setPostal (String Postal)
	{
		throw new IllegalArgumentException ("Postal is virtual column");	}

	/** Get ZIP.
		@return Postal code
	  */
	public String getPostal ()
	{
		return (String)get_Value(COLUMNNAME_Postal);
	}

	/** Set Region.
		@param RegionName
		Name of the Region
	  */
	public void setRegionName (String RegionName)
	{
		throw new IllegalArgumentException ("RegionName is virtual column");	}

	/** Get Region.
		@return Name of the Region
	  */
	public String getRegionName ()
	{
		return (String)get_Value(COLUMNNAME_RegionName);
	}

	/** Set Tax Amount.
		@param TaxAmt
		Tax Amount for a document
	  */
	public void setTaxAmt (BigDecimal TaxAmt)
	{
		throw new IllegalArgumentException ("TaxAmt is virtual column");	}

	/** Get Tax Amount.
		@return Tax Amount for a document
	  */
	public BigDecimal getTaxAmt ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_TaxAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Tax ID.
		@param TaxID
		Tax Identification
	  */
	public void setTaxID (String TaxID)
	{
		throw new IllegalArgumentException ("TaxID is virtual column");	}

	/** Get Tax ID.
		@return Tax Identification
	  */
	public String getTaxID ()
	{
		return (String)get_Value(COLUMNNAME_TaxID);
	}
}