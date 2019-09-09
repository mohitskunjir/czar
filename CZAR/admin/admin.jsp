<%@ page language="java"%>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<html lang="en">

<head>

    <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>CZAR Admin </title>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	
	<script src="../js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/cookie.js"></script>
	<script src="../js/admin.js"></script>
	
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
        <li class="active"><a href="admin.jsp">Admin Settings  <span class="sr-only">(current)</span></a></li>
        <li><a href="addQues.jsp">Add Questions</a></li>
        <li><a href="dispQues.jsp">Display Questions</a></li>
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
		 User
	</span>
	&nbsp; Details!	
	</h3>
	<br>
	<form method="post" action=#process>
	<div class="input-group">
  <input type="text" name="oldEmail" id = "oldEmail" class="form-control" placeholder="Old EamilId" aria-describedby="basic-addon1">
  <input type="password" name="oldPass" id="oldPass" class="form-control" placeholder="Old Password" aria-describedby="basic-addon1">
  
  <input type="password" name="newPass" id="newPass" class="form-control" placeholder="New Password" aria-describedby="basic-addon1">
  <input type="password" name="cPass" id="cPass" class="form-control" placeholder="Confirm Password" aria-describedby="basic-addon1">
  </div>
	<br>
  <button type="submit" name="button" value="Submit" onclick="return validForm()" class="btn-default btn-group-justified">
  	Submit
  </button>
  <br>
  </form>		
	</div>
	
	</div>

<div class="col-sm-4" id="process">
	<p  id="error" style="color:red;"> 
	<%
				try
				{
				 	String buttonClicked = request.getParameter("button");
					if(buttonClicked.equalsIgnoreCase("submit"))
					{
	
						String newPass = request.getParameter("newPass");	
						
						Connect conn = new Connect();
						ResultSet rs = conn.executeQuery("select emailId, password from playerdetails where status='"+"admin"+"'");
						
						if(rs.next())
						{
									
							if(request.getParameter("oldEmail").equals(rs.getString("emailId")) && request.getParameter("oldPass").equals(rs.getString("password")))
							{
		
								if(conn.executeUpdate("update playerdetails set  password='"+newPass+"' where status='"+"admin"+"'") <= 0)
								{
									out.println("Administrator Credentials not Changed");
								}
								else
								{
									out.println("Administrator Credentials Changed");
								}
							}
							else
							{
								out.println("Old Administrator Credentials are Wrong");
							}
							conn.disconnect();
						}
						else
						{
							conn.disconnect();
							throw new SQLException("1");
						}
						
			
					}
				}
				catch (SQLException e)
				{
					if(e.getErrorCode() == 1049) // occurs when database is not found
					{	
						%>
							<script>				
							   window.location.replace("../index.jsp?msg=check admin: Database not found.");
							</script>
						<%	
					}
					
					else if(e.getErrorCode() == 1045) // occurs when database credentials are illegal.... check properties
					{
						%>
							<script>				
							   window.location.replace("../index.jsp?msg=check admin: Access Denied");
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
						<jsp:forward page="admin.jsp"></jsp:forward>
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