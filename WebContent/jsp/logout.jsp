<%@ page language="java"%>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>
<!DOCTYPE>
<html>
<head>

	<title>Logout</title>
	
	<meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="../js/cookie.js"> </script>
    
    
</head>
<body>
Logging Out...
<%
try
{
	Connect con = new Connect();
	
	Player player=(Player)session.getAttribute("player");
	Question question=(Question)session.getAttribute("question");
	
	player.setStatus("block");
	con.updatePlayerInfo(player, question);
	con.disconnect();
	
	player=null;
	question=null;
	
	session.setAttribute("player",player);
	session.setAttribute("question",question);
	
	request.getSession().removeAttribute("player");
	request.getSession().removeAttribute("question");
	session.invalidate();
	
}
catch (SQLException e)
{
	if(e.getErrorCode()==1049) // occurs when database is not found
	{
		%>
			<script>	
				
			   window.location.replace("../index.jsp?msg=Check logout: Database Not found");
			</script>
		<%
	}
	
	else if(e.getErrorCode()==1045) // occurs when database credentials are illegal.... check properties
	{
		%>
			<script>
				
			   window.location.replace("../index.jsp?msg=Check logout: Access Denied");
			</script>
		<%
	}


	else if(e.getErrorCode()==1406) //  occurs when size too long
	{
		
		%>
			<script>	
				
			   window.location.replace("../index.jsp?msg=Check logout: Data too long"); 
			</script>
		<%	
	}
	else if(e.getMessage()=="1") // programmer defined occurs when username or password don not match 
	{
		%>
			<script>	
			   window.location.replace("../index.jsp?msg=Check logout: Player Does not Exist, Cannot Update.");
			</script>
		<%
	}
	else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database 
	{
		%>
			<script>	
			   window.location.replace("../index.jsp?msg=Check logout: User already exist");
			</script>
		<%
	}
	else
	{
		%>
		<script>				
			window.location.replace("../index.jsp?msg=Check logout: Unknown Database Error"); 
		</script>
		<%
	}
}
catch(ClassNotFoundException e)
{
	
	%>
		<script>
		   window.location.replace("../index.jsp"); 
		</script>
	<%
	
}

catch(NullPointerException e)
{
	%>
	<script>	
	   window.location.replace("../index.jsp?msg=check logout Unknown Null Error");
	</script>
	<%
}
catch(Exception e)
{
	%>
		<script>		
		   window.location.replace("../index.jsp?msg=Check logout: Unknown Error occured!!!");
		</script>
	<%
	
}
	
%>
		<script>		
		setCookie("admin","0");
		setCookie("quiz","0");
		setCookie("rules","0");
		setCookie("thanku","0");
		window.location.replace("../index.jsp");
		</script>
<%
%>

</body>
</html>