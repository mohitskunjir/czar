<%@ page language="java"%>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<html>
<head>
<meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Submitting Feedback</title>
</head>
<body>
Submitting Feedback ...
<%

	Player player;
	Question question;
	
	String buttonClicked;
	Connect connect;
	
	String name;
	String college;
	String level;
	String email;
	String contact;

	int ui = 0;
	int speed = 0;
	int difficulty = 0;
	
	String comments;
	
	try
	{
		 player = (Player)session.getAttribute("player");
		 question = (Question)session.getAttribute("question");
		 
		 buttonClicked=request.getParameter("button");
		
		if(buttonClicked.equalsIgnoreCase("feedback"))
		{
			name = player.getName();
			college = player.getCollege();
			level = player.getLevel();
			email = player.getEmail();
			contact = player.getContact();
			
			ui = Integer.parseInt(request.getParameter("UI"));
			speed = Integer.parseInt(request.getParameter("speed"));
			difficulty = Integer.parseInt(request.getParameter("difficulty"));
			
			comments = request.getParameter("comments");
			
			out.println("<br>" + name);
			out.println("<br>" + college);
			out.println("<br>" + level);
			out.println("<br>" + email);
			out.println("<br>" + contact);
			out.println("<br>" + ui);
			out.println("<br>" + speed);
			out.println("<br>" + difficulty);
			out.println("<br>" + comments);
			
			
			connect = new Connect();
			connect.giveFeedback(name,college,level,email,contact,ui,speed,difficulty,comments);
			connect.disconnect();
%>

			<script>
				window.location.replace("../thanku2.jsp");
			</script>
			
<% 		
		}
	}
	catch (SQLException e)
	{
		if(e.getErrorCode()==1049) // occurs when database is not found
		{
			%>
			<script>	
			   alert("check player Database Not found");
			   window.location.replace("../thanku2.jsp?msg=check feedback Database Not found");
			</script>
			<%
		}
		
		else if(e.getErrorCode()==1045) // occurs when database credentials are illegal.... check properties
		{
			%>
			<script>	
			   alert("check player Access Denied");
			   window.location.replace("../thanku2.jsp?msg=check feedback Access Denied");
			</script>
			<%
		}


		else if(e.getErrorCode()==1406) //  occurs when size too long
		{
			
			
			%>
				<script>			
				    alert("Data too long.");
				   window.location.replace("../thanku2.jsp?msg=Data too long."); 
				</script>
			<%
		}
		else if(e.getMessage() == "1" ) // programmer defined occurs when username or password do not match
		{
			%>
			<script>		
				 alert("Wrong Email Id or Password.");
			   window.location.replace("../thanku2.jsp?msg=check feedback Wrong Email Id or Password.");
			</script>
			<%
		}
		else if(e.getMessage() == "2" ) // programmer defined occurs when some registration problem occurs
		{
			%>
			<script>	
				 alert("Player Not Registered.");
			   window.location.replace("../thanku2.jsp?msg=check feedback Player Not Registered.");
			</script>
			<%
		}
		else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database
		{
			%>
			<script>	
				 alert("Feedback already Submitted.");
			   window.location.replace("../thanku2.jsp?msg=Feedback already Submitted.");
			</script>
			<%
		}
		else
		{
			%>
			<script>
				
				window.location.replace("../thanku2.jsp?msg=check feedback Unknown Database Error"); 
			</script>
			<%
		}
	}
	catch(ClassNotFoundException e)
	{
		
		%>
			<script>
			   window.location.replace("../thanku2.jsp?msg=check feedback Class Not Found Exception"); 
			</script>
		<%
		
	}
	catch(NullPointerException e)
	{
		%>
		<script>				
		   window.location.replace("../thanku2.jsp?msg=check feedback Unknown Null Error");
		</script>
		<%
	}
	
	catch(Exception e)
	{
		%>
		<script>				
		   window.location.replace("../thanku2.jsp?msg=check feedback Unknown Error");
		</script>
		<%
	}
%>

</body>
</html>