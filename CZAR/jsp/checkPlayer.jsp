<%@ page language="java"%>

<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<html>

<head>

	<meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Checking Player</title>
	
	<script src="../js/cookie.js"></script>
	
	
</head>

<body>

Loading Please Wait......
<br>

<%

String buttonClicked = null;	// Required Objects Declaration
String status = null;

Player player = null;

try
{
	buttonClicked = new String(request.getParameter("button"));
	
	if(buttonClicked.equalsIgnoreCase("Start Game"))
	{		
			player = new Player(request.getParameter("emailIdL"), request.getParameter("passwordL") );		
			
			status = new String(player.getStatus());
			
			if( status.equalsIgnoreCase("admin") )
			{		
				
					%>
						<script>				
							setCookie("admin","1");
							window.location.replace("../admin/admin.jsp");
						</script>
					<%
					
			}
			
			else if( status.equalsIgnoreCase("unblock") || status.equalsIgnoreCase("playing") )
			{		
					player.setStatus("playing");
					session.setAttribute("player",player);
					
					%>
						<script>		
						   setCookie("rules","1");
						   window.location.replace("../rules.jsp");
						</script>
					<%
			}
			
			else if( status.equalsIgnoreCase("block") )
			{
					%>
						<script>				
							alert("This Player is Blocked!!!");
							window.location.replace("../index.jsp");
						</script>
					<%
			}
			else
			{
					%>
						<script>				
							window.location.replace("../index.jsp?Unknown Status of player");
						</script>
					<%
			}
	}
	else if( buttonClicked.equalsIgnoreCase("Ready To Rock") )
	{
		 player = new Player( request.getParameter("playerNameF") + " " + request.getParameter("playerNameL"), request.getParameter("playerCollege"), request.getParameter("playerLevel"), request.getParameter("playerContact"), request.getParameter("playerEmail"), request.getParameter("playerPassword") );
	    
		   session.setAttribute("player",player);
			
			%>
				<script>		
				   alert("Player Registered Successfully, Now Login")
				   window.location.replace("../index.jsp?msg=Player registered successfully, Now Login");
				</script>
			<%						
	}
	else
	{
		%>
				<script>				
					window.location.replace("../index.jsp?msg=Wrong button");
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
		   window.location.replace("../index.jsp?msg=check player Database Not found");
		</script>
		<%
	}
	
	else if(e.getErrorCode()==1045) // occurs when database credentials are illegal.... check properties
	{
		%>
		<script>	
		   alert("check player Access Denied");
		   window.location.replace("../index.jsp?msg=check player Access Denied");
		</script>
		<%
	}


	else if(e.getErrorCode()==1406) //  occurs when size too long
	{
		
		
		%>
			<script>			
			    alert("Data too long.");
			   window.location.replace("../index.jsp?msg=Data too long."); 
			</script>
		<%
	}
	else if(e.getMessage() == "1" ) // programmer defined occurs when username or password do not match
	{
		%>
		<script>		
			 alert("Wrong Email Id or Password.");
		   window.location.replace("../index.jsp?msg=Wrong Email Id or Password.");
		</script>
		<%
	}
	else if(e.getMessage() == "2" ) // programmer defined occurs when some registration problem occurs
	{
		%>
		<script>	
			 alert("Player Not Registered.");
		   window.location.replace("../index.jsp?msg=Player Not Registered.");
		</script>
		<%
	}
	else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database
	{
		%>
		<script>	
			 alert("Player already registered, Please Login.");
		   window.location.replace("../index.jsp?msg=Player already registered, Please Login.");
		</script>
		<%
	}
	else
	{
		%>
		<script>
			 alert("check player Unknown Database Error");
			window.location.replace("../index.jsp?msg=check player Unknown Database Error"); 
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
		 alert("check player Unknown Null Error");
	   window.location.replace("../index.jsp?msg=check player Unknown Null Error");
	</script>
	<%
}
catch(Exception e)
{
	%>
	<script>	
		 alert("check player Unknown Error");
	   window.location.replace("../index.jsp?msg=check player Unknown Error");
	</script>
	<%
}

%>

</body>

</html>