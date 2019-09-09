<%@ page language="java" %>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<html lang="en">

<head>
  
    <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>CZAR Admin</title>
	
 	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	
	<script src="../js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/cookie.js"></script>
	<script src="../js/addQues.js"></script>

</head>

<body>

<script>
	
	var admin = getCookie("admin");
	if(admin!=1)
	{
			window.location.replace("../index.jsp?msg=You are not Admin");
	}

</script>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false" aria-controls="bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Czar Admin</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admin.jsp">Admin Settings</a></li>
        <li class="active"><a href="addQues.jsp">Add Questions <span class="sr-only">(current)</span></a></li>
        <li><a href="dispQues.jsp">Display Questions</a></li>
        <li><a href="managePlayer.jsp">Manage Player</a></li>
        <li><a href="logout.jsp">Log Out</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="col-sm-3">
	
</div>
<div class="col-sm-6">
	<div class="container-fluid"  style="text-align:center;">

			<h3>
			Enter The
			<span class="label label-default">
				 Question
			</span>
			&nbsp; Details!	
			</h3>
			<form name="question" id="question" method="post" action="#process">
				  <br>
				  <textarea class="form-control" rows="5" placeholder="Type a Question ..." name="questionTextArea" id="questionTextArea"></textarea>
				  <br>
					<div class="input-group">
				  <span class="input-group-addon">A</span>
				  <textarea  rows="2" class="form-control" placeholder="Option A" aria-describedby="basic-addon1" name="option1" id="option1"></textarea>
				  </div>
				
				  <div class="input-group">
				  <span class="input-group-addon" >B</span>
				  <textarea  rows="2" class="form-control" placeholder="Option B" aria-describedby="basic-addon1" name="option2" id="option2"></textarea>
				  </div>
				
				  <div class="input-group">
				  <span class="input-group-addon" >C</span>
				  <textarea  rows="2" class="form-control" placeholder="Option C" aria-describedby="basic-addon1" name="option3" id="option3"></textarea>
				  </div>
				
				  <div class="input-group">
				  <span class="input-group-addon">D</span>
				  <textarea rows="2" class="form-control" placeholder="Option D" aria-describedby="basic-addon1" name="option4" id="option4"></textarea>
				  </div>
				
				  <br>
				  <div class="input-group">
				  <span class="input-group-addon">Answer</span>
				  <select class="form-control" id="answer" name="answer" aria-describedby="basic-addon1">
				    <option value="" selected disabled>--Select Answer--</option>
					<option id="op1" value="op1">Option A</option>
					<option id="op2" value="op2">Option B</option>
					<option id="op3" value="op3">Option C</option>
					<option id="op1" value="op4">Option D</option>
				  </select>
				  </div>
				
				  <br>
				  <div class="input-group">
				  <span class="input-group-addon">Level</span>
				  
				   <select class="form-control" id="level" name="level" aria-describedby="basic-addon1" onchange="addTableNames()">
					<option value="" selected disabled>--Difficulty Level--</option>
					<option id="FE" value="FE">FE</option>
					<option id="SE" value="SE">SE</option>
					<option id="TE" value="TE">TE</option>
					<option id="BE" value="BE">BE</option>
				  </select>
				  </div>
				  <div class="input-group">
				  <span class="input-group-addon">Table</span>
				  <select class="form-control" name="tableName" id="tableName" aria-describedby="basic-addon1">
				    <option value="" selected disabled>--Select Table--</option>
				  </select>
				  </div>
				
				<br>
				
				  <button type="submit" class="btn-default btn-group-justified form-control" name="button" value="submit" onclick="return validForm()">
				  	Submit
				  </button>
				  <br>
		  </form>		
	</div>
	
	</div>

<div class="col-sm-3" id="process">

	<p  id="error" style="color:red;"> 
	<%
				try
				{
				 	String buttonClicked = request.getParameter("button");
					if(buttonClicked.equalsIgnoreCase("submit"))
					{
						int questionNo = -1;
						String question = request.getParameter("questionTextArea");
						String op1 = request.getParameter("option1");
						String op2 = request.getParameter("option2");
						String op3 = request.getParameter("option3");
						String op4 = request.getParameter("option4");
						String answer = request.getParameter("answer");
						String table = request.getParameter("tableName");	
						
						Connect conn = new Connect();
						questionNo = conn.addQuestion(question,op1,op2,op3,op4,answer,table);	
						conn.disconnect();
						questionNo+=1;
						out.println("Question No: " + questionNo); 
					}
				}
				catch (SQLException e)
				{
					if(e.getErrorCode() == 1049) // occurs when database is not found
					{	
						%>
							<script>				
							   window.location.replace("../index.jsp?msg=check addQues: Database not found.");
							</script>
						<%	
					}
					
					else if(e.getErrorCode() == 1045) // occurs when database credentials are illegal.... check properties
					{
						%>
							<script>				
							   window.location.replace("../index.jsp?msg=check addQues: Access Denied");
							</script>
						<%
					}
				
					else if(e.getErrorCode() == 1406) //  occurs when size too long
					{
						 out.println("Error: Data too long"); 	
					}
					else if(e.getMessage() == "1" ) // programmer defined occurs when username or password do not match
					{
						out.println("Question does not exist");
					}
					else if(e.getMessage() == "2" ) // programmer defined occurs when some registration problem occurs
					{
						out.println("Question does not exist.");
					}
					else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database
					{
						out.println("Question already registered");
					}
					else
					{
						out.println("Unknown Database Error");
					}
				}
				catch(ClassNotFoundException e)
				{
					%>
						<jsp:forward page="addQues.jsp"></jsp:forward>
					<%	
				}
				catch(NullPointerException e)
				{
					
				}				
				catch(Exception e)
				{
					out.println("Unknown Error");
				}		
			
		 
 %>
	</p>
					
</div>

</body>
</html>

