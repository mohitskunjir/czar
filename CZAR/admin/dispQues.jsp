<%@ page language="java"%>

<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<html lang="en">

<head>

    <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> CZAR Admin </title>
	
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	
	<script src="../js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/cookie.js"></script>
	<script src="../js/dispQues.js"></script>
	
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
        <li><a href="addQues.jsp">Add Questions</a></li>
        <li class="active"><a href="dispQues.jsp">Display Questions <span class="sr-only">(current)</span></a></li>
        <li><a href="managePlayer.jsp">Manage Player</a></li>
        <li><a href="logout.jsp">Log Out</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="col-sm-4">
	
</div>
<div class="col-sm-4">
	<div class="container-fluid"  style="text-align:center;">

	<h3>
	Enter The
	<span class="label label-default">
		 Question
	</span>
	&nbsp; Number!
	</h3>
	<br>
	<form name="dispQuestion" id="dispQuestion" method="post" action="#process"> 
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Number</span>
  <input type="number" class="form-control" name="questionNo" id="questionNo" placeholder="Enter the Question Number" aria-describedby="basic-addon1">
  </div>

  <br>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Level</span>
  <select class="form-control" id="level" name="level" aria-describedby="basic-addon1" onchange="addTableNames()">
   <option value="" selected disabled>--Difficulty Level--</option>
	<option id="FE" value="FE">FE</option>
	<option id="SE" value="SE">SE</option>
	<option id="TE" value="TE">TE</option>
	<option id="BE" value="BE">BE</option>
  </select>
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Table</span>
  <select class="form-control" id="tableName" name="tableName" aria-describedby="basic-addon1">
   <option value="" selected disabled>--Select Level--</option>
  </select>
  </div>


  <br>
  <button class="btn-default btn-group-justified" name="button" id="button" value="submit" onclick="return validForm()">
  	Submit
  </button>
  <br>
  </form>	
	</div>
		
	</div>


<div class="col-sm-4" id="process">

<p  id="error" style="color:red;"> 
<%
				Player player = null;
				Question questionObj = null;
				Connect conn = null;
				ResultSet rs = null;
				int questionNo = 0;
				String buttonClicked = null;
				
				try
				{
				 	buttonClicked = request.getParameter("button");
					if(buttonClicked.equalsIgnoreCase("submit"))
					{
						
						questionNo = Integer.parseInt(request.getParameter("questionNo"));
						questionNo--;
						String level = request.getParameter("level");
						String table = request.getParameter("tableName");	
						
						conn = new Connect();
						rs = conn.executeQuery("select emailId, password from playerdetails where status='"+"admin"+"'");
						rs.next();
								
						player = new Player(rs.getString("emailId"),rs.getString("password"));
						
						conn.disconnect();
						
						questionObj = new Question(table,questionNo,0);
						
						session.setAttribute("player",player);
						session.setAttribute("question",questionObj);
						
						%>
							<script>
								setCookie("timer1","<%=player.getTime()%>");
								setCookie("quiz","1");
								window.location.replace("quiz.jsp");
							</script>
						<%
					}
				}
				catch (SQLException e)
				{
					if(e.getErrorCode() == 1049) // occurs when database is not found
					{	
						%>
							<script>				
							   window.location.replace("../index.jsp?msg=check dispQues: Database not found.");
							</script>
						<%	
					}
					
					else if(e.getErrorCode() == 1045) // occurs when database credentials are illegal.... check properties
					{
						%>
							<script>				
							   window.location.replace("../index.jsp?msg=check dispQues: Access Denied");
							</script>
						<%
					}
				
					else if(e.getErrorCode() == 1406) //  occurs when size too long
					{
						 out.println("Error: Data too long"); 	
					}
					else if(e.getMessage() == "1" ) // programmer defined occurs when username or password do not match
					{
						out.println("Question does not exist or admin username password do not match");
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
						<jsp:forward page="dispQues.jsp"></jsp:forward>
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