<%@ page language="java"%>

<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="czar.*"%>

<!DOCTYPE>
<html>

<head>
	<meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Set Test</title>
	<script src='../js/cookie.js'></script>
</head>

<body>

Loading Questions ...
<%

Player player = null;
Question question = null;
int questionsRemaining = 0;

try
{
	player = (Player)session.getAttribute("player");

	questionsRemaining = ( player.getQuestionsAttempted() + ( 3 - player.getSkipsRemaining() ) );
	
	question = new Question(player.getLevel(),questionsRemaining,1);
	
	session.setAttribute("question",question);
	
	if( questionsRemaining <= question.testQuestions)
	{  
		
	   %>
			<script>
			
				setCookie("timer1","<%=player.getTime()%>")
				setCookie("quiz","1");
				
				window.location.replace("../quiz.jsp");
				
			</script>
		<%
	}
	else
	{
		%>
		<script>
			
			setCookie("thanku","1");
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
			   window.location.replace("../index.jsp?msg=Check test: Database Not found");
			</script>
		<%
	}
	
	else if(e.getErrorCode()==1045) // occurs when database credentials are illegal.... check properties
	{
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check test: Access Denied");
			</script>
		<%
	}

	else if(e.getErrorCode()==1406) //  occurs when size too long (Won't Occur)
	{	
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check test: Data too long"); 
			</script>
		<%	
	}
	
	else if( e.getMessage().equals("1") ) // programmer defined occurs when question does not exist
	{
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check test: Questions not loaded"); 
			</script>
		<%
	}
	
	else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database  (Won't Occur)
	{
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check test: repeated question");
			</script>
		<%
	}
	else
	{
		%>
			<script>				
				window.location.replace("../index.jsp?msg=Check test: Unknown Database Error"); 
			</script>
		<%
	}
}
catch(ClassNotFoundException e)
{
		%>
			<script>				
			   window.location.replace("setTest.jsp"); 
			</script>
		<%
	
}
catch(NullPointerException e)
{
	%>
		<script>				
		   window.location.replace("../index.jsp?msg=Check test: Unknown Null Error");
		</script>
	<%
}
catch(ArrayIndexOutOfBoundsException e)
{
	%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check test: Questions not loaded."); 
			</script>
		<%
}

catch(Exception e)
{
	%>
		<script>				
		   window.location.replace("../index.jsp?msg=Check test: Unknown Error");
		</script>
	<%
}
%>
</body>
</html>