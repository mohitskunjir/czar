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
	
	<script>
			var request;
			function sendInfo()
			{
				var v=document.getElementById("emailId").value;
				var url="playerSettings.jsp?val="+v;
				if(window.XMLHttpRequest)
				{
					request=new XMLHttpRequest();
				}
				else if(window.ActiveXObject)
				{
					request=new ActiveXObject("Microsoft.XMLHTTP");
				}
				try
				{
					request.onreadystatechange=getInfo;
					request.open("GET",url,true);
					request.send();
				}
				catch(e)
				{
					alert("Unable to connect to server");
				}
			}
			
			function getInfo()
			{
				if(request.readyState==4)
				{
					var val=request.responseText;	
					val=val.trim();
					
					if(val != "" && val != "admin")
					{
						
						document.getElementById("delete").disabled = false;
						
						if( val == "block" )
						{
							document.getElementById("stat").disabled = false;							
							document.getElementById("stat").removeAttribute('disabled');
							
							document.getElementById("unblock").disabled = false;	
							
						}
						else if( val == "unblock" || val == "playing" )
						{		
							document.getElementById("block").disabled = false;
						}
					}
					else
					{
						alert("Player Not Found");
					}
				}
			}
			
			function disableButtons()
			{
				document.getElementById("delete").disabled = true;
				document.getElementById("unblock").disabled = true;	
				document.getElementById("block").disabled = true;
				document.getElementById("stat").setAttribute('disabled', 'disabled');
				document.getElementById("stat").disabled = true;
			}
	</script>
	
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
        <li><a href="addQues.jsp">Add Questions </a></li>
        <li><a href="dispQues.jsp">Display Questions</a></li>
        <li class="active"><a href="managePlayer.jsp">Manage Player <span class="sr-only">(current)</span></a></li>
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
    Player
	</span>
	&nbsp; Details!	
	</h3>
	<br>
	<form method="post" action="#process">
  
			  <br>
			  <div class="input-group">
			  		<span class="input-group-addon" id="basic-addon1">@</span>
			  		<input type="text" class="form-control" name="emailId" id="emailId" placeholder="Enter Email Id" aria-describedby="basic-addon1" onkeyup="disableButtons()"/>
			  		  
			  </div>
			  <br>
			  <button type="button" class="btn btn-default" name="button" value="search" onclick="sendInfo()">
				  <span class="glyphicon glyphicon-search"></span>
				  Search
			  </button>
			  <br><br><br>
			  
			  <div class="input-group">
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 	 <label for="stat"> Reset Player Stat:</label>
			 	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  	<input type="checkbox"  name="stat" id="stat" aria-describedby="basic-addon1" disabled/>
			  </div>
			   <br><br><br>
			  <div class="container-fluid" style="text-align:center;">
				  <div class="btn-group" role="group" aria-label="...">
				    <button type="submit" class="btn btn-default" name="button" id="block" value="block" disabled>Block</button>
					
				    <button type="submit" class="btn btn-default" name="button" id="unblock" value="unblock" disabled>Unblock</button>
					
				    <button type="submit" class="btn btn-default" name="button" id="delete" value="delete" disabled>Delete</button>
				  </div>
			  </div>
			  <br>
    </form>	
  </div>
		
	</div>


<div class="col-sm-4" id="#process">
	<p  id="error" style="color:red;"> 
	<%
			String buttonClicked = null;
			String emailId = null;
			String stat = null;
			String query = null;
			
			int rs = 0;
			
			Connect con = null;
				try
				{
				 	buttonClicked = request.getParameter("button");
				 	emailId = request.getParameter("emailId");
				 	stat = request.getParameter("stat");
				 	con = new Connect();
					

					if(buttonClicked.equalsIgnoreCase("delete"))
					{
						
						query = "delete from playerdetails where emailId='"+emailId+"'";
						rs=con.executeUpdate(query);
						if (rs <= 0 )
						{
							out.println("Player Not Deleted");
						}
						else
						{
							out.println("Player having emailId " + emailId + " has been Deleted");
							
						}
						
					}
					
					else if(buttonClicked.equalsIgnoreCase("block"))
						{
							query = "update playerdetails set status='"+buttonClicked+"' where emailId='"+emailId+"'";
							rs=con.executeUpdate(query);
							if (rs <= 0 )
							{
								out.println("Player Not Blocked");
							}
							else
							{
								out.println("Player having emailId " + emailId + " has been " + buttonClicked + "ed");
							}
							
						}
					else if((buttonClicked.equalsIgnoreCase("unblock")))
					{
						if(stat != null && stat.equalsIgnoreCase("on"))
						{
query = "update playerdetails set score='"+0+"', time='"+"20:00"+"', questionsAttempted='"+0+"', correctlyAnswered='"+0+"', skipsRemaining='"+3+"',  status='"+buttonClicked+"' where emailId='"+emailId+"'";
						}
						else
						{
							query = "update playerdetails set status='"+buttonClicked+"' where emailId='"+emailId+"'";
						}
						rs=con.executeUpdate(query);
						if (rs <= 0 )
						{
							out.println("Player Not Blocked");
						}
						else
						{
							out.println("Player having emailId " + emailId + " has been " + buttonClicked + "ed");
						}
						
					}
					con.disconnect();
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
	
					else if(e.getErrorCode()==1406) //  occurs when size too long
					{
						 out.println("Error: Data too long"); 	
					}
					else if( e.getMessage().equals("1") ) // programmer defined occurs when question does not exist
					{
						out.println("Player Does Not Exist"); 	
					}
					
					else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database  (Won't Occur)
					{
						out.println("Player Already Exist"); 	
					}
					else
					{
						out.println("Unknown Error"); 	
					}
				}
				catch(ClassNotFoundException e)
				{

					%>
						<script>				
						   window.location.replace("managePlayer.jsp");
						</script>
					<%
				}
				catch(NullPointerException e)
				{
					
				}				
				catch(Exception e)
				{
					out.println("Error: Unknown Error occured"); 	
				}
					
		 
 %>
	</p>
	
</div>

</body>
</html>