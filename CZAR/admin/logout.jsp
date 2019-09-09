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
	Player player=(Player)session.getAttribute("player");
	Question question=(Question)session.getAttribute("question");
		
	player=null;
	question=null;
	
	session.setAttribute("player",player);
	session.setAttribute("question",question);
	
	request.getSession().removeAttribute("player");
	request.getSession().removeAttribute("question");
	
	session.invalidate();
	
}
catch(NullPointerException e)
{
	%>
	<script>	
		 alert("check player Unknown Null Error");
	   window.location.replace("../index.jsp?msg=Check logout: Unknown Null Error");
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
		setCookie("login","0");
		setCookie("registeration","0");
		setCookie("rules","0");
		setCookie("thanku","0");
		window.location.replace("../index.jsp");
		</script>
<%
%>

</body>
</html>