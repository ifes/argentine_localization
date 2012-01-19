package org.compiere.apps.search;

import java.awt.Frame;

import org.compiere.apps.AEnv;


/**
 * 
 * @author German Wagner
 *
 */
public class InfoFactoryDocEnCartera implements InfoFactory
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2917241055484901704L;

	public InfoFactoryDocEnCartera()
	{
	}

	public Info create(Frame frame, boolean modal, int WindowNo, String tableName, String keyColumn, String value, boolean multiSelection, String whereClause) 
	{
		Info i=InfoDocEnCartera.create(frame, modal, WindowNo, tableName, keyColumn, value, true, whereClause);
		AEnv.positionCenterWindow(frame, i);
		return i;
	}
	
	
}   //  InfoPayment
