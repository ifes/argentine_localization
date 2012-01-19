
	package ar.com.openbiz.process;

	import java.math.BigDecimal;
	//import java.sql.PreparedStatement;
	import org.compiere.util.CPreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Timestamp;
	import java.util.logging.Level;

	import org.adempiere.util.ProcessUtil;
	import org.compiere.model.MPInstance;
	import org.compiere.model.MPInstancePara;
	import org.compiere.model.MProcess;
	import org.compiere.process.ProcessInfo;
	import org.compiere.process.ProcessInfoParameter;
	import org.compiere.process.SvrProcess;
	import org.compiere.util.DB;
import org.compiere.util.Env;

	public class LAR_Balance extends SvrProcess
	{
		private final String procName="CONTRPT_Balance";
		static Integer p_AD_Client_ID;
		static Integer p_AD_Org_ID;
		static Integer p_AcctSchema_ID;
		static Integer p_Year_ID;
		static String p_Recalcula;
		static Timestamp p_Date_Init;
		static Timestamp p_Date_End;
		
		private boolean 	error = false;
		
	    static private Timestamp v_Date;	
		static private int p_OrderNo;
		
		public String trxName;
		
		
		public String start(Integer P_AD_Client_ID, Integer P_AD_Org_ID, Integer P_AcctSchema_ID, Timestamp P_Date_Init, Timestamp P_Date_End, Integer P_Year_ID, String P_Recalcula)
		{
			
			trxName = this.get_TrxName();
			
			//OB_Load_Tmp_Balance(P_AD_Client_ID, P_AD_Org_ID, P_AcctSchema_ID, P_Date_Init, P_Date_End, P_Year_ID);
			try {
				NodeBalance(P_Recalcula);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			return callJR();
		}
		

		
		public Timestamp OB_Date_InitAccountYear(Integer P_AD_Client_ID, Integer  P_Year_ID)
		{
			Timestamp v_date_init=null;
	        Integer p_Year=null;
			
			String sql=
				"	SELECT x_dateinit, fiscalyear " +
				"	  FROM C_YEAR y " +
				"	  INNER JOIN AD_CLIENTINFO c ON (y.AD_Client_ID = c.AD_CLIENT_ID) " +
				"	  WHERE y.AD_Client_ID = '"+P_AD_Client_ID.toString()+"' AND " +
				"	        y.C_Year_ID = '"+P_Year_ID.toString()+"'";
			
	    	CPreparedStatement pstmt=DB.prepareStatement(sql,trxName);
	        ResultSet rs;
	        
			try 
			{
				rs = pstmt.executeQuery();
		        if(rs.next())
		        {
		        	v_date_init = rs.getTimestamp("x_dateinit");
		        	p_Year = rs.getInt("fiscalyear");
		        	log.fine("Fecha Inicio Ejercicio Fiscal ("+p_Year +") :" + v_date_init);
		        }

				if(v_date_init==null)
				{
					sql=
					    "	SELECT To_Date('01-01-'|| To_Char("+p_Year+",'9999'), 'dd-mm-yyyy') AS v_date_init;";
					pstmt=DB.prepareStatement(sql,null);
					rs = pstmt.executeQuery();
			        if(rs.next())
			        {
			        	v_date_init = rs.getTimestamp("v_date_init");
			        	log.fine("Fecha Inicio Ejercicio Fiscal :" + v_date_init);
			        }
				}

		        rs.close();
				pstmt.close();
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}		
			
			
			return v_date_init;
		}
		
		
		public void NodeBalance(String P_Recalcula) throws java.lang.Exception
		{
			
			p_AD_Client_ID = Env.getAD_Client_ID(getCtx());
	
	        Timestamp d= OB_Date_InitAccountYear(p_AD_Client_ID, p_Year_ID);
		
		    if (d.equals(null))
		    	v_Date=p_Date_Init;
		    else
		    	v_Date=d;
		    
		    StringBuffer sqldelete = null;
		    sqldelete = new StringBuffer ("DELETE xx_temp_plan_cuentas");
		    CPreparedStatement pstmtdelete = DB.prepareStatement(sqldelete.toString(),trxName);
			int no = pstmtdelete.executeUpdate();
			pstmtdelete.close();
			log.info("Delete Temporal Plan CUentas =" + no);

			 String sql = "SELECT a.AD_Client_ID, a.AD_Org_ID, "
				+ "a.Node_ID, "
				+ "e.Name, "
				+ "e.Value, "
				+ "a.Parent_ID, "
				+ "a.SeqNo, "
				+ "e.IsSummary, "
				+ "e.AccountType "
				+ "FROM AD_TreeNode a, C_ElementValue e "
				+ "WHERE a.AD_Client_ID="+p_AD_Client_ID+" AND "
				+ "(a.AD_Org_ID="+ p_AD_Org_ID+ " OR a.AD_Org_ID=0) AND "
				+ "a.IsActive='Y' AND "
				+ "a.ad_tree_id = (Select AD_Tree_ID FROM AD_Tree WHERE AD_Client_ID= "+p_AD_Client_ID+" AND treetype='EV') AND "   //********************* Descablear
				+ "a.Parent_ID=0 AND "
				+ "a.Node_ID=e.C_ElementValue_ID "
				+ "ORDER BY a.Parent_ID,a.SeqNo,to_number(e.VALUE,'999999')";
			 try
			 {
			 
				 CPreparedStatement pstmt = DB.prepareStatement(sql,trxName);
			 	ResultSet rs = pstmt.executeQuery();
				while (rs.next()) 			
				
				{
					p_OrderNo = p_OrderNo + 1 ;
					int t_order=p_OrderNo;
					LAR_SaldoBalance saldo = 
						GetChild( rs.getInt(1),rs.getInt(2),p_AcctSchema_ID, 1, rs.getInt(3));
					
					sql = "INSERT INTO XX_TEMP_PLAN_CUENTAS "
						+ "(ad_client_id, ad_org_id, c_acctschema_id,"
						+ " account_id, account_parent_id, value, name,"
						+ " accounttype, levelno, issummary, orderno,debe,haber)"
						+ " VALUES("
						+ rs.getInt(1) + ","	//Client
						+ rs.getInt(2) + ","	//Org
						+ p_AcctSchema_ID + ","
						+ rs.getInt(3) + ","	//Account_ID
						+ "0,'"					//Parent_ID
						+ rs.getString(5) + "','" //value
						+ rs.getString(4) + "','" //name
						+ rs.getString(9) + "',"  //accounttype
						+ "0,'"					  //levelno
						+ rs.getString(8) + "',"  //issummery
						+ t_order   + ","
						+ saldo.getDebe()    + ","
						+ saldo.getHaber()   +")";
						CPreparedStatement pstmt2 = DB.prepareStatement(sql,trxName);
						pstmt2.executeUpdate();
						pstmt2.close();
						
				}   //while
				rs.close();
				pstmt.close();
			}	//try
			catch (SQLException e)
			{
				log.log(Level.SEVERE, sql, e);
				error = true;
				return ;//e.getLocalizedMessage();
			}
			commitEx();
		
			return;
		}	//	doIt

		
		/**
		 *  Gets Childs Accounts Recursivaly
		 *  @return voiv
		 *  @throws Exception
		 */
		
		
		private LAR_SaldoBalance GetChild(int p_Client_ID,int p_AD_Org_ID,int p_C_AcctSchema_ID,int p_level, int p_Parent_ID)
		{
			String v_NameLevel = "";
			LAR_SaldoBalance saldo=null;
			int Account_id = 0;
			String sql = "SELECT a.AD_Client_ID, a.AD_Org_ID, "
				        + "a.Node_ID, "
						+ "e.Name, "
						+ "e.Value, "
						+ "a.Parent_ID, "
						+ "a.SeqNo, "
						+ "e.IsSummary, "
						+ "e.AccountType "
					
						+ ",(select sum(g.AmtAcctDr)  from Fact_Acct g WHERE "  
						+ "	g.DateAcct>= '"+v_Date + "' AND " 
						+ "	(g.DateAcct<='"+p_Date_End+"' OR '"+p_Date_End+"' IS NULL) AND " 
						+ "g.account_ID=e.C_ElementValue_id ) as debe"

						+ ",(select sum(g.AmtAcctCr)  from Fact_Acct g WHERE "  
						+ "	g.DateAcct>= '"+v_Date + "' AND " 
						+ "	(g.DateAcct<='"+p_Date_End+"' OR '"+p_Date_End+"' IS NULL) AND " 
						+ "g.account_ID=e.C_ElementValue_id ) as haber "
						+ "FROM AD_TreeNode a, C_ElementValue e "
						+ "WHERE a.AD_Client_ID="+p_Client_ID+" AND "
						+ "(a.AD_Org_ID="+ p_AD_Org_ID+ " OR a.AD_Org_ID=0) AND "
						+ "a.IsActive='Y' AND "  //
						+ "a.ad_tree_id = (Select AD_Tree_ID FROM AD_Tree WHERE AD_Client_ID= "+p_Client_ID+" AND treetype='EV') AND "   //********************* Descablear
						+ "a.Parent_ID="+p_Parent_ID+" AND "
						+ "a.Node_ID=e.C_ElementValue_ID "
						+ "ORDER BY a.Parent_ID,a.SeqNo,to_number(e.VALUE,'999999')";
			
			try
			 {
			 
				CPreparedStatement pstmt = DB.prepareStatement(sql,trxName);
			 	ResultSet rs = pstmt.executeQuery();
			 	boolean setS=false;
				while (rs.next())
				{
					boolean isSum=false;
					if(rs.getString("isSummary").compareTo("Y")==0)
						isSum=true;
					if(!setS)
					{
						saldo= new LAR_SaldoBalance();
						setS=true;
					}
					p_OrderNo = p_OrderNo + 1;
					v_NameLevel = rs.getString(4);
					Account_id  = rs.getInt(3);
					int i;
					for (i=0; i<p_level;i++)
						v_NameLevel = "   " + v_NameLevel;
					
					int t_order= p_OrderNo;
					log.fine("Level"+ p_level + " Cuenta:"+Account_id+" "+v_NameLevel+"t-order: "+t_order);			
					LAR_SaldoBalance saldochild=
						GetChild(rs.getInt(1),rs.getInt(2),p_AcctSchema_ID, p_level + 1,Account_id);
					if (saldochild!=null)
						saldo.addSaldo(saldochild); 
					saldo.addDebe(rs.getBigDecimal("debe"));
					saldo.addHaber(rs.getBigDecimal("haber"));
					
					sql = "INSERT INTO XX_TEMP_PLAN_CUENTAS "
						+ "(ad_client_id, ad_org_id, c_acctschema_id,"
						+ " account_id, account_parent_id, value, name,"
						+ " accounttype, levelno, issummary, orderno,debe,haber)"
						+ " VALUES("
						+ rs.getInt(1) + ","	//Client
						+ rs.getInt(2) + ","	//Org
						+ p_AcctSchema_ID + ","
						+ rs.getInt(3) + ","	//Account_ID
						+ Account_id + ",'"	//Parent_ID
						+ rs.getString(5) + "','" //value
						+ v_NameLevel     + "','" //name
						+ rs.getString(9) + "',"  //accounttype
						+ p_level+",'"					  //levelno
						+ rs.getString(8) + "',"  //issummery
						+ t_order + ", ";
						
					if(isSum)
					{
						if (saldochild!=null)
						{
							sql=sql+ saldochild.getDebe() + ",";
							sql=sql+ saldochild.getHaber();
						}
						else
							sql=sql+ "0, 0";;
					}
					else
					{
						sql=sql+ rs.getBigDecimal("debe") + ",";
						sql=sql+ rs.getBigDecimal("haber");					
					}
						
					sql=sql+")";
						
						CPreparedStatement pstmt2 = DB.prepareStatement(sql,trxName);
						pstmt2.executeUpdate();
			 
				} //while
				rs.close();
				pstmt.close();
			}	//try
			catch (SQLException e)
			{
				log.log(Level.SEVERE, sql, e);
				error = true;
				//return e.getLocalizedMessage();
			}
			
	        return saldo;
			
		}    //GetChild
		
		
		public String callJR()
		{
			  int proc_id = 0 ;	//JR process
			  
			  ProcessInfo pi;
			  String sql = "SELECT AD_Process_id FROM AD_Process WHERE name='"+procName+"'";
			  CPreparedStatement pstmt = DB.prepareStatement(sql,null);
			  
			  ResultSet rs;
			  try
			  {
			 	rs = pstmt.executeQuery();
			 	
			 	if (rs.next())
			 		proc_id = rs.getInt(1); //1000010 ;
			 		else
			 		{
			 			log.warning("Proceso Inexistente");
			 			return "Proceso Inexistente";
					} //else
					
			  }	//try
			  catch (SQLException e)
			   {
					log.log(Level.SEVERE, sql, e);
					error = true;
					//return e.getLocalizedMessage();
				}
			  finally
			  {
				  try
				  {
					  pstmt.close();
				  }
				  catch (SQLException e)
				   {
						log.log(Level.SEVERE, sql, e);
						error = true;
					}
				  
			  }	
			 	MPInstance p = new MPInstance(getCtx(),proc_id,proc_id);    	
		    	p.save();
			 
		    	MProcess pro = new MProcess (getCtx(),proc_id, null);
		    	String proName = pro.getName();
		    	
		    	ProcessInfoParameter p_edu_p[] = 
				{
		    			new ProcessInfoParameter("AD_Client_ID",new BigDecimal(p_AD_Client_ID),null,null,null),
		    			new ProcessInfoParameter("AD_Org_ID",new BigDecimal(p_AD_Org_ID),null,null,null),
		    			new ProcessInfoParameter("C_AcctSchema_ID",new BigDecimal(p_AcctSchema_ID),null,null,null),
		    			new ProcessInfoParameter("Date_Init",p_Date_Init,null,null,null),
		    			new ProcessInfoParameter("Date_End",p_Date_End,null,null,null),
		    			new ProcessInfoParameter("C_Year_ID",new BigDecimal(p_Year_ID),null,null,null)   			
				};
		    	
		        MPInstancePara param=new MPInstancePara(Env.getCtx(),p.getAD_PInstance_ID(),0);
		        param.setParameterName("AD_Client_ID");
		        param.setP_Number(p_AD_Client_ID);
		        param.setAD_Org_ID(Env.getAD_Org_ID(Env.getCtx()));
		        param.save();
		        
		        MPInstancePara param2=new MPInstancePara(Env.getCtx(),p.getAD_PInstance_ID(),1);
		        param2.setParameterName("AD_Org_ID");
		        param2.setP_Number(p_AD_Org_ID);
		        param2.setAD_Org_ID(Env.getAD_Org_ID(Env.getCtx()));
		        param2.save();
		        
		        MPInstancePara param3=new MPInstancePara(Env.getCtx(),p.getAD_PInstance_ID(),2);
		        param3.setParameterName("C_AcctSchema_ID");
		        param3.setP_Number(p_AcctSchema_ID);
		        param3.setAD_Org_ID(Env.getAD_Org_ID(Env.getCtx()));
		        param3.save();
		        
		        MPInstancePara param4=new MPInstancePara(Env.getCtx(),p.getAD_PInstance_ID(),3);
		        param4.setParameterName("Date_Init");
		        param4.setP_Date(v_Date);
		        param4.setAD_Org_ID(Env.getAD_Org_ID(Env.getCtx()));
		        param4.save();
		        
		        MPInstancePara param5=new MPInstancePara(Env.getCtx(),p.getAD_PInstance_ID(),4);
		        param5.setParameterName("Date_End");
		        param5.setP_Date(p_Date_End);
		        param5.setAD_Org_ID(Env.getAD_Org_ID(Env.getCtx()));
		        param5.save();
		        
		        MPInstancePara param6=new MPInstancePara(Env.getCtx(),p.getAD_PInstance_ID(),5);
		        param6.setParameterName("C_Year_ID");
		        param6.setP_Number(p_Year_ID);
		        param6.setAD_Org_ID(Env.getAD_Org_ID(Env.getCtx()));
		        param6.save();
		        
		    	pi= new ProcessInfo(proName,proc_id);
		    	pi.setParameter(p_edu_p);
		    	pi.setRecord_ID(proc_id);
		    	pi.setAD_Process_ID(proc_id);
		    	pi.setAD_PInstance_ID(p.get_ID());
		    	pi.setClassName("org.compiere.report.ReportStarter");  // JasperReport class
		       
		    	ProcessUtil.startJavaProcess(getCtx(), pi, null);
		    	
		    	return "@Ok@";
		}

		@Override
		protected String doIt() throws Exception 
		{
			return start(p_AD_Client_ID, p_AD_Org_ID, p_AcctSchema_ID, p_Date_Init, p_Date_End, p_Year_ID, p_Recalcula);
		}

		@Override
		protected void prepare() 
		{
			ProcessInfoParameter[] para = getParameter();
			p_AD_Client_ID=Env.getAD_Client_ID(getCtx());
			for (int i = 0; i < para.length; i++)
			{
				String name = para[i].getParameterName();
				
				if (para[i].getParameter() == null)
					;
				else if (name.compareToIgnoreCase("AD_Client_ID")==0 )//&& i == 0)
					p_AD_Client_ID  = ((BigDecimal)para[i].getParameter()).intValueExact();
				else if (name.compareToIgnoreCase("AD_Org_ID")==0 )//&& i == 1)
					p_AD_Org_ID  = ((BigDecimal)para[i].getParameter()).intValueExact();
				else if (name.compareToIgnoreCase("C_AcctSchema_ID")==0)// && i == 2)
					p_AcctSchema_ID  =  ((BigDecimal)para[i].getParameter()).intValueExact();
				else if (name.compareToIgnoreCase("Date_Init")==0 )//&& i == 3)
					p_Date_Init  = (Timestamp)para[i].getParameter();
				else if (name.compareToIgnoreCase("Date_End")==0 )//&& i == 4)
					p_Date_End  = (Timestamp)para[i].getParameter();
				else if (name.compareToIgnoreCase("C_Year_ID")==0 )//&& i == 5)
					p_Year_ID  =  ((BigDecimal)para[i].getParameter()).intValueExact();
				else
					log.log(Level.SEVERE, "Unknown Parameter: " + name);
			}
			
		}
	}
