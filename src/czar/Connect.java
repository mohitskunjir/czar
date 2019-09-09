package czar;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class Connect 
{
	private PreparedStatement prepareStatement;
	private Connection connection;
	
	public Connect() throws ClassNotFoundException, SQLException, NullPointerException
    {
		String url="jdbc:mysql://localhost/czar";
		
		Properties loginProperties = new Properties();
		loginProperties.setProperty("user","root");
		loginProperties.setProperty("password","root");
		
		prepareStatement = null;
		connection = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
			
		connection = DriverManager.getConnection(url, loginProperties);
		
    }
	
	public ResultSet loginUser(String emailId, String password) throws ClassNotFoundException, SQLException, NullPointerException
	{	
			prepareStatement = connection.prepareStatement("select * from playerdetails where emailId=? and password=?");
			prepareStatement.setString(1, emailId);
			prepareStatement.setString(2, password);
			return prepareStatement.executeQuery();
	}
	
	public int registerUser(String emailId, String password, String name, String contact, String college, String year) throws ClassNotFoundException, SQLException, NullPointerException
	{	
		prepareStatement = connection.prepareStatement("insert into playerdetails(emailId, password, name, contact, college, year) values(?,?,?,?,?,?)");
					
		prepareStatement.setString(1, emailId);
		prepareStatement.setString(2, password);
		prepareStatement.setString(3, name);
		prepareStatement.setString(4, contact);
		prepareStatement.setString(5, college);
		prepareStatement.setString(6, year);

		return prepareStatement.executeUpdate(); 
				
	}
	
	public int updatePlayerInfo(Player player, Question question)  throws ClassNotFoundException, SQLException, NullPointerException
	{
		prepareStatement = connection.prepareStatement("update playerdetails set score=? , time=?, questionsAttempted=?, correctlyAnswered=?, skipsRemaining=? where emailId=?");
		
		prepareStatement.setInt(1,player.getScore());
		prepareStatement.setString(2, player.getTime());
		prepareStatement.setInt(3, player.getQuestionsAttempted());
		prepareStatement.setInt(4, player.getCorrectlyAnswered());
		prepareStatement.setInt(5, player.getSkipsRemaining());
		prepareStatement.setString(6, player.getEmail());
	
		return prepareStatement.executeUpdate(); 	
	}
	
	public ResultSet executeQuery(String query) throws ClassNotFoundException, SQLException, NullPointerException
	{
		prepareStatement = connection.prepareStatement(query);
		return prepareStatement.executeQuery();	
	}
	
	public int executeUpdate(String query) throws ClassNotFoundException, SQLException, NullPointerException
	{
		prepareStatement = connection.prepareStatement(query);
		return prepareStatement.executeUpdate();	
	}
	
	public void giveFeedback(String name, String college, String level, String email, String contact, int ui, int speed, int difficulty, String comments)  throws ClassNotFoundException, SQLException, NullPointerException
	{
		prepareStatement = connection.prepareStatement("insert into feedback(name, college, level, email, contact, ui, speed, difficulty, comments) values(?,?,?,?,?,?,?,?,?)");
		prepareStatement.setString(1,name);
		prepareStatement.setString(2,college);
		prepareStatement.setString(3,level);
		prepareStatement.setString(4,email);
		prepareStatement.setString(5,contact);
		prepareStatement.setInt(6, ui);
		prepareStatement.setInt(7,speed);
		prepareStatement.setInt(8, difficulty);
		prepareStatement.setString(9,comments);
		prepareStatement.executeUpdate();
	}
	
	public int addQuestion(String question, String op1, String op2, String op3, String op4, String answer, String table)  throws ClassNotFoundException, SQLException, NullPointerException
	{
		int questionNo;
		prepareStatement = connection.prepareStatement("select count(*) from " + table);
		ResultSet rs = prepareStatement.executeQuery();
		
		if( rs.next() == true )
		{
			questionNo = rs.getInt(1);
			prepareStatement = connection.prepareStatement("insert into " + table + " values(?,?,?,?,?,?,?)");
			prepareStatement.setInt(1, questionNo);
			prepareStatement.setString(2,question);
			prepareStatement.setString(3,op1);
			prepareStatement.setString(4,op2);
			prepareStatement.setString(5,op3);
			prepareStatement.setString(6,op4);
			prepareStatement.setString(7,answer);
			prepareStatement.executeUpdate();
			
			return questionNo;
		}
		
		return -1;
	}
	
	public void disconnect() throws ClassNotFoundException, SQLException, NullPointerException
	{
		if ( prepareStatement != null )
			prepareStatement.close();
		if ( connection != null )
			connection.close();
		
		prepareStatement = null;
		connection = null;

	}
	
	public static void main(String args[])
	{
		
	
		try 
		{
			ResultSet rs = null;
			Connect conn = new Connect();
			
			/*
			System.out.print("Value: ");
			System.out.println(c.registerUser("supriya@gmail.com", "qwerty", "SWATS", "7040336919", "PVGCOET", "FE"));
			*/
			
			rs = conn.loginUser("qwerty@gmail.com", "developer");

			if( rs.next() == true )
			{	
				System.out.println("\n" + rs.getString(1));
				System.out.println("\n" + rs.getString(2));
				System.out.println("\n" + rs.getString(3));
				System.out.println("\n" + rs.getString(4));
				System.out.println("\n" + rs.getString(5));
				System.out.println("\n" + rs.getString(6));
							
				System.out.println("\n" + rs.getInt(7));
				System.out.println("\n" + rs.getString(8));
				System.out.println("\n" + rs.getInt(9));
				System.out.println("\n" + rs.getInt(10));
				System.out.println("\n" + rs.getInt(11));
				System.out.println("\n" + rs.getString(12));
				System.out.println("\n" + rs.getString(13));
			
			}
			else
			{
				
				System.out.println("\nPlayer doesnt exist " + rs.next());
			}
			
			
			/*
			Player player = new Player("mohitssj10@gmail.com","qwerty");
			player.setScore(8);
			player.setTime("15:25");
			player.setQuestionsAttempted(5);
			player.setCorrectlyAnswered(5);
			player.setSkipsRemaining(3);
			Question question = new Question("FE",0,1);
			
			System.out.println("Updated: " + conn.updatePlayerInfo(player, question));
			*/
			
			
			//int questionNo = conn.addQuestion("What is a Public?", "Access Specifier", "Data Type", "Pointer", "None", "op2", "table1");
			//System.out.println("Question No: \t" + questionNo--);
			//conn.giveFeedback("fsdfdsf", "gererger", "rgerg", "fbdfs", "bfgbdf",3, 2,1, "bfgbfgb");
					
			conn.disconnect();
			
		}
		catch (SQLException e) 
		{
			 System.out.println("\n SQLExcetion Connect");
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
		 	else if(e.getMessage()=="1" ) // programmer defined occurs when user name or password do not match
		 	{				
		 		System.out.println("\nPlayer Does not Exist, Please register.");
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
		catch (ClassNotFoundException e)
		{
			System.out.println("\n ClassNotFoundExcetion Connect");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
		}
		catch(NullPointerException e)
		{
			System.out.println("\n NullPointerException Connect");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
			
			System.out.println("\nUnknown Null Error");
		
		}
		catch(Exception e)
		{
			System.out.println("\n Exception Connect");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
			
			System.out.println("Unknown Error");	
		}
	}

}
