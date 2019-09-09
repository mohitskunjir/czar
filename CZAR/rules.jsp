<%@ page language="java" %>

<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="czar.*"%>
<!DOCTYPE>
<html>
<head>
<title>Rules</title>
 <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-social.css" rel="stylesheet" >
    
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" >
       
   
     <link href="css/rules.css" rel="stylesheet" type="text/css" />
    
    <script src="js/jquery.min.js"></script>  
    <script src="bootstrap/js/bootstrap.min.js"></script> 
    <script src="js/cookie.js"> </script>  
</head>
<body   style="background-image:url(imgs/asci.jpg) ; background-size: 100% 100% ;">
<script>

	/* Cookie checks whether user did not reach this page via direct URL addressing*/

	/*setCookie("rules","1"); //*** Comment this line during actual deployment ***  */

	var rules = getCookie("rules");
	if(rules != 1)
	{
		window.location.replace("index.jsp?msg=rules c not set");
	}
      
    setCookie("registration","0");
    setCookie("login","0");
    setCookie("rules","0");  
</script>
<%
Player player = null;
player = (Player)session.getAttribute("player");
session.setAttribute("player", player);
%>
<div class="container-fluid text-left">
<h1 class="myfont" style="color:darkgray ">Rules</h1>
<ol>
<li class="logo" style="font-size:1.5em ;color:darkgray ;" >You have to solve 30 MCQ type questions</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">Time is 30 minutes</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">There is a Negative Marking Scheme</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">For every Question there are 4 Options and 3 Confidence Levels</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">Marks will Added or Deducted according  to the confidence level of your Answer</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">You can skip at most 3 Questions and End Game any time you want</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">We request you to give us your Feedback at the end</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">Please Logout after giving your Feedback</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">Refreshing the page is not allowed, else you will be blocked</li>
<li class="logo" style="color:darkgray ;font-size:1.5em">Pressing the back button or using back shortcut is strictly prohibited, else you will be blocked</li>
</ol>
<br><br>
<div  class="container-fluid text-center" >
 <a class="btn btn-default btn-lg" href="jsp/setTest.jsp">I Agree</a>
</div>
</div>
</body>
</html>