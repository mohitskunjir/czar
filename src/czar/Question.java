package czar;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class Question 
{
	final public int testQuestions = 30;
	private int arr[];	
	private String selectedTable;
	private int questionNo;
	

	public Question(String level, int questionNumber, int flags) throws ClassNotFoundException, SQLException, NullPointerException
	{
		if( flags == 1 )
		{
			String query;
		    String tableName[];
			int length;
		    
		    Connect conn = null;
		    ResultSet rs = null;
		    Random random = null;
		
			query = "select count(*) from get_tbl where level='"+level+"'";
			conn = new Connect();
			rs = conn.executeQuery(query);
			
			if(rs.next())
			{
				
				length = rs.getInt(1);
				
				tableName = new String[length];
				length = 0;
				
				query = "select * from get_tbl where level='"+level+"'";
				rs = conn.executeQuery(query);
				rs.next();
				
				do
				{
					tableName[length++] = rs.getString("tbl_name");
				}while(rs.next());
								
				random = new Random();
				selectedTable = tableName[random.nextInt(3)];	
				
				arr = new int[testQuestions];
				int i, flag=0,j=0,temp;		
				
				query = "select count(*) from " + selectedTable;
				rs = conn.executeQuery(query);
				rs.next();
				
				int maxQuestions = rs.getInt(1);
	
				for(i=0;i<testQuestions;i++)
				{
					do
					{
						flag=0;
						temp=random.nextInt(maxQuestions);
						j=0;
						do 
						{
							if(temp==arr[j])	
							{
								flag=1;
								break;
							}
							j++;
						}while(j<i);
						
						if(flag!=1)
						{	
							arr[i]=temp;
							flag=0;
						}
					}while(flag==1);
				}
				
				this.questionNo=questionNumber;
				
				conn.disconnect();
			}
		}
		else
		{
			this.selectedTable = level;
			this.questionNo = questionNumber;
		}
	}

	public String generateQuestion(int num) throws ClassNotFoundException, SQLException, NullPointerException, ArrayIndexOutOfBoundsException
	{
		Connect con = new Connect();
		String ques = null;
		ResultSet rs = con.executeQuery("select question from " + selectedTable + " where number='"+arr[num]+"'");
		if(rs.next())
			ques = new String(rs.getString(1));
		con.disconnect();
		return ques;
	}
	public String generateQuestion() throws ClassNotFoundException, SQLException, NullPointerException
	{
		Connect con = new Connect();
		String ques = null;
		String query = "select question from " + selectedTable + " where number='"+questionNo+"'";
		ResultSet rs = con.executeQuery(query);
		if(rs.next())
			ques = new String(rs.getString(1));
		return ques;
	}
	
	
	public String[] generateOptions(int num) throws ClassNotFoundException, SQLException, NullPointerException,  ArrayIndexOutOfBoundsException
	{
		Connect con = new Connect();
		String options[] = null;
		ResultSet rs = con.executeQuery("select o1,o2,o3,o4 from " + selectedTable + " where number='"+arr[num]+"'");
		if(rs.next())
		{
			options = new String[4];
			options[0] = new String(rs.getString("o1"));
			options[1] = new String(rs.getString("o2"));
			options[2] = new String(rs.getString("o3"));
			options[3] = new String(rs.getString("o4"));
		}
		con.disconnect();
		return options;
	}
	public String[] generateOptions() throws ClassNotFoundException, SQLException, NullPointerException
	{
		Connect con = new Connect();
		String options[] = null;
		ResultSet rs = con.executeQuery("select o1,o2,o3,o4 from " + selectedTable + " where number='"+questionNo+"'");
		if(rs.next())
		{
			options = new String[4];
			options[0] = new String(rs.getString("o1"));
			options[1] = new String(rs.getString("o2"));
			options[2] = new String(rs.getString("o3"));
			options[3] = new String(rs.getString("o4"));
		}
		con.disconnect();
		return options;
	}
	public String generateAnswer(int num) throws ClassNotFoundException, SQLException, NullPointerException, ArrayIndexOutOfBoundsException
	{
		Connect con = new Connect();
		String answer = null;
		ResultSet rs = con.executeQuery("select answer from " + selectedTable + " where number='"+arr[num]+"'");
		if(rs.next())
			answer = new String(rs.getString(1));
		con.disconnect();
		return answer;
	}
	public String generateAnswer() throws ClassNotFoundException, SQLException, NullPointerException
	{
		Connect con = new Connect();
		String answer = null;;
		ResultSet rs = con.executeQuery("select answer from " + selectedTable + " where number='"+questionNo+"'");
		if(rs.next())
			answer = new String(rs.getString(1));
		con.disconnect();
		return answer;
	}
	public void setSelectedTable(String selectedTable) 
	{
		this.selectedTable = selectedTable;
	}
	
	 public String getSelectedTable() 
	 {
			return selectedTable;
	 }
	 
	 public int[] getArr()
	 {
			return arr;
	 }
	public void setArr(int[] arr) 
	{
			this.arr = arr;
	}
	public int getQuestionNo() 
	{
		return questionNo;
	}
	public void setQuestionNo(int questionNo)
	{
		this.questionNo = questionNo;
	}
	public static void main(String args[])
	{
		Question q1;
		
		String ques = null;
		
		try 
		{
			
			q1 = new Question("table1",2,0);
			//q1 = new Question("FE",0,1);
			
			ques = q1.generateQuestion();
		
			//ques = q1.generateQuestion(5);
			
			if( ques != null )
			{
				System.out.println("\n\nQuestion: " + ques);			
				System.out.println("\nAnswer: " + q1.generateAnswer());
				//System.out.println("\nAnswer: " + q1.generateAnswer(5));
				
			}	
			else
			{
				throw new SQLException("1");
			}
			
			
			
		}
		catch (SQLException e) 
		{
			 System.out.println("\n SQLExcetion Question");
		     System.out.println("\n Local Message: " + e.getLocalizedMessage());
			 System.out.println("\n Error Message: " + e.getMessage());
		     System.out.println("\n Cause: " + e.getCause());
		     System.out.println("\n Error Code: " + e.getErrorCode());
		     System.out.println("\n SQL State: " + e.getSQLState());
		    
		    if(e.getErrorCode() == 1049) // occurs when database is not found
			{
		    	 System.out.println("\nDatabase Not found");			
			}
				
			else if(e.getErrorCode() == 1045) // occurs when database credentials are illegal.... check properties
			{
				System.out.println("\nAccess Denied");					
			}
		     		     	
			else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database
			{
				System.out.println("\nUser Already Exists!!!");				
			}
		     
		 	else if(e.getErrorCode()==1406) //  occurs when size too long
		 	{					
		 		System.out.println("\nData too long"); 
		 	}
		 	else if(e.getMessage()=="1" ) // programmer defined occurs when Question Number does not exist
		 	{				
		 		System.out.println("\nNo such Question Number");
		 	}
		     
		 	else if( e.getErrorCode() == 1062 ) // occurs when specified user name already exists in the database
		 	{					
		 		System.out.println("\nUser Already Exists!!!");	
		 	}
		 	else
		 	{
		 		System.out.println("\nUnknown Database Error"); 
		 	}
		}
		catch(ArrayIndexOutOfBoundsException e)
		{
			System.out.println("\n ArrayIndexOutOfBoundsException Question");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("\n ClassNotFoundExcetion Question");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
		}
		catch(NullPointerException e)
		{
			System.out.println("\n NullPointerException Question");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
			
			System.out.println("\nUnknown Null Error");
		
		}
		catch(Exception e)
		{
			System.out.println("\n Exception Question");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
			
			System.out.println("\nUnknown Error");	
		}
	}
	
}
