package czar;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Player 
{
	private String name,college,level,contact,email, time, status;
	private int score, questionsAttempted, correctlyAnswered, skipsRemaining;
	
	public Player(String email, String password) throws ClassNotFoundException, SQLException, NullPointerException
	{	
		Connect conn = new Connect();
		ResultSet rs = conn.loginUser(email, password);
		
		if(rs.next() == true)
		{
			this.name = rs.getString("name");
			
			this.college  = rs.getString("college");
			
			this.level=rs.getString("year");
			
			this.contact=rs.getString("contact");
			
			this.email=rs.getString("emailId");
			
			this.questionsAttempted = Integer.parseInt(rs.getString("questionsAttempted"));
			
			this.score=Integer.parseInt(rs.getString("score"));
			
			this.time=rs.getString("time");
			
			this.correctlyAnswered=Integer.parseInt(rs.getString("correctlyAnswered"));
			
			this.skipsRemaining=Integer.parseInt(rs.getString("skipsRemaining"));
			
			this.status=rs.getString("status");
					
			conn.disconnect();
		}
		
		else
		{
			conn.disconnect();
			throw new SQLException("1");
		}
	}
	
	public Player(String name,String college,String level,String contact,String email,String password)  throws ClassNotFoundException, SQLException, NullPointerException
	{
	    Connect conn = new Connect();
	    
	    int regFlag;
	    regFlag = conn.registerUser(email, password, name, contact, college, level);
		
		conn.disconnect();
		
		if(regFlag < 1)
		{
			throw new SQLException("2");
		}
	}
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String firstName) {
		this.name = firstName;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String playerLevel) {
		this.level = playerLevel;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String playerContact) {
		this.contact = playerContact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String playerEmail) {
		this.email = playerEmail;
	}

	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public int getQuestionsAttempted() {
		return questionsAttempted;
	}

	public void setQuestionsAttempted(int questionsAttempted) {
		this.questionsAttempted = questionsAttempted;
	}

	public int getCorrectlyAnswered() {
		return correctlyAnswered;
	}

	public void setCorrectlyAnswered(int correctlyAnswered) {
		this.correctlyAnswered = correctlyAnswered;
	}

	public int getSkipsRemaining() {
		return skipsRemaining;
	}

	public void setSkipsRemaining(int skipsRemaining) {
		this.skipsRemaining = skipsRemaining;
	}
	
	public void setStatus(String status)  throws ClassNotFoundException, SQLException, NullPointerException
	{
		this.status = status;
		
		Connect conn = new Connect();
		String query = "update playerdetails set status='"+status+"' where emailId='"+email+"'";
		conn.executeUpdate(query);
		conn.disconnect();
	
	}
	
	public String getStatus() {
		return status;
	}

	

	public static void main(String[] args) 
	{
		Player p1;
		try 
		{
			//p1 = new Player("Alex Anthony", "BMCC", "FE", "7418523698","alexia@gmail.com","zxcvb");
			
			p1 = new Player("qwerty@gmail.com","developer");
			System.out.println(p1.getName());
			
		} 
		catch (SQLException e) 
		{
			 System.out.println("\n SQLExcetion Player");
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
			System.out.println("\n ClassNotFoundExcetion Player");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
		}
		catch(NullPointerException e)
		{
			System.out.println("\n NullPointerException Player");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
			
			System.out.println("\nUnknown Null Error");
		
		}
		catch(Exception e)
		{
			System.out.println("\n Exception Player");
			System.out.println("\n Local Message: " + e.getLocalizedMessage());
			System.out.println("\n Error Message: " + e.getMessage());
			System.out.println("\n Cause: " + e.getCause());
			
			System.out.println("Unknown Error");	
		}
	}
}
