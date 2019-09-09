<%@ page language="java"%>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>
   

<html>
<head>

		<title>Questions</title>

       <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">	
        
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"> 
	    <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="../css/quiz.css">    
	    <link href="../bootstrap/css/bootstrap-social.css" rel="stylesheet" >
           
        <script src="../js/jquery.min.js"></script>  
    	<script src="../bootstrap/js/bootstrap.min.js"></script> 
    	
    	<script src="../js/cookie.js"></script> 
    	<script src="../js/quiz.js"></script>
    	 
        <script>
        
	        function start()
	        {
	        	
	        	var timerVal = getCookie("timer1");
	        	
	            document.getElementById("timer1").setAttribute("value",timerVal);
	           
	            timer2();
	        }
	        
        </script>
        
</head>

<body  onload="start()" >

<script>
	
	/* Cookie checks whether user did not reach this page via direct URL addressing*/

	/*setCookie("quiz","1"); //*** Comment this line during actual deployment ***  */
	
	var quiz = getCookie("quiz");
	if( quiz != 1 )
	{
		window.location.replace("../index.jsp");
	}

	setCookie("quiz","0");
	
</script>

<%

String ques = null;					// Required Objects delclaration
String options[] = new String[4];
int questionNo = 2;

Player player = (Player)session.getAttribute("player");
Question question =(Question)session.getAttribute("question");


questionNo = question.getQuestionNo();

try
{
	ques = question.generateQuestion();

	if(ques != null)
	{
		options = question.generateOptions();
	}
	else
	{
		throw new SQLException("1");
	}
}
catch (SQLException e)
{
	if(e.getErrorCode()==1049) // occurs when database is not found
	{
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check quiz: Database Not found");
			</script>
		<%
	}
	
	else if(e.getErrorCode()==1045) // occurs when database credentials are illegal.... check properties
	{
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check quiz: Access Denied");
			</script>
		<%
	}

	else if(e.getErrorCode()==1406) //  occurs when size too long (Won't Occur)
	{	
		%>
			<script>				
			   window.location.replace("quiz.jsp?msg=Check quiz: Data too long"); 
			</script>
		<%	
	}
	
	else if( e.getMessage().equals("1") ) // programmer defined occurs when question does not exist
	{
		ques = new String("Question No: " + new Integer(questionNo).toString() +  " does not exist"); 
	}
	
	else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database  (Won't Occur)
	{
		%>
			<script>				
			   window.location.replace("../index.jsp?msg=Check quiz: User already exist");
			</script>
		<%
	}
	else
	{
		%>
			<script>				
				window.location.replace("../index.jsp?msg=Check quiz: Unknown Database Error"); 
			</script>
		<%
	}
}
catch(ClassNotFoundException e)
{
		%>
			<script>				
			   window.location.replace("quiz.jsp"); 
			</script>
		<%
	
}
catch(NullPointerException e)
{
	%>
		<script>				
		   window.location.replace("../index.jsp?msg=Check quiz: Unknown Null Error");
		</script>
	<%
}
catch(ArrayIndexOutOfBoundsException e)
{
	ques = new String("Question No: " + new Integer(questionNo).toString() +  " does not exist."); 
}
catch(Exception e)
{
	%>
		<script>				
		   window.location.replace("../index.jsp?msg=Check quiz: Unknown Error");
		</script>
	<%
}

session.setAttribute("player",player);
session.setAttribute("question",question);

%>
 <div id="ruleModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>Rules</h4>
                </div>
                <div class="modal-body">
               
                       <ol>

<li class="logo" style="font-size:1.5em ; color:darkgray ;" ></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li>
<li class="logo" style="color:darkgray ;font-size:1.5em"></li><li class="logo" style="color:darkgray ;font-size:1.5em"></li>


</ol>
                    
                </div>
            </div>
        </div>
    </div>
    
    
    
    <form class="form-horizontal" name="quizForm"  method="post" id="quizForm" action="checkAnswer.jsp">
    
    <div id="endGameModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>End Game</h4>
                </div>
                <div class="modal-body">
               
                       <label><strong>Are You sure You want to End this Game?</strong></label>
                                   
                    	<button type="submit" class="btn btn-default" name="button" value="End Game">YES</button>                
                    	
                    	<button type="button" class="btn btn-default" data-dismiss="modal" name="button" value="No">NO</button>           
                </div>
            </div>
        </div>
    </div>
    
     <div id="skipModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>Skip Question</h4>
                </div>
                <div class="modal-body">
               
                       <label><strong>Are You sure You want to Skip this Question?</strong></label>
                     
                    	
                    		<button type="submit" class="btn btn-default" name="button" value="Skip" onclick="decSkip()">YES</button>                
                    	
                    	<button type="button" class="btn btn-default" data-dismiss="modal" name="button" value="No">NO</button>           
                </div>
            </div>
        </div>
    </div>


     <header class="jumbotron" style="background:#c6c6c6">
      <div class="container-fluid" style="padding-top:5px">
        <div class="row row-content">
        <div class="col-xs-12 col-sm-3">   
       <img src="imgs/images3.png" class="img-responsive" style="max-height:350px ; opacity:0.7">
    </div>
    
     
     <div class="col-xs-12 col-sm-2">
     <h3   id="playerName" class="myfont3" ><%=player.getName() %></h3>
				
				<h3  id="playerLevel" class="myfont3"><%=player.getLevel()%></h3>
      </div>
      
     <div class="col-xs-12 col-sm-offset-2 col-sm-4 ">
     	<div class="row">
     	 <div class="col-xs-12 col-sm-4 ">
     		<h4>Time Remaining : </h4>
        </div>
        <div>
       <span class="label label-info timerDiv" id="timerDiv"><input  type="text" class="timerText text-center" name="timer1" id="timer1" value="red" readonly>
</span>
      </div>
      </div><br><br>
      <div class="row">
       <div class="col-xs-12 col-sm-4 ">
     		<h4>Your Score: </h4>
        </div>
        <div>
      	<span class="label label-info timerDiv">
					<!--  <label class="timerText" for="scoreNumber" id="scoreNumber" >15</label>-->
					
					<input type="text" class="timerText text-center" name="scoreNumber" id="scoreNumber" style="background:transparent ; border : none" value="<%=player.getScore()%>" readonly="readonly">
					
					
					
				</span>
      </div>
      
      </div><br><br>
      <div class="row">
     	 <div class="col-xs-12  col-sm-offset-7 col-sm-4 ">
     		<a  class="btn btn-default" data-toggle="modal" data-target="#ruleModal">
           Visit Rules</a>
        </div>
      </div>
      
      </div>
      
      
     </div>
      </div>
     </header>
     
  <div class="container-fluid">
		<div class=" container-fluid form-group">
			<div id="questionP" class=" jumbotron questions">
				
				<h3><span  class="label label-info ">
					<label id="questionNoP"  > Question # </label>
				
					<input type="text" name="questionNumber" id="questionNumber" style="  background:transparent ; border : none ; width:1em" value="<%=question.getQuestionNo() + 1%>" readonly="readonly">
				</span></h3>
				&nbsp;
				<pre class="size"><%=ques %></pre>
				<div class="row">
				<div class="nextbtn col-xs-12 col-sm-offset-10 col-sm-2">
						<button type="submit" class="btn btn-default  btn-md" style=" font-weight:bold" name="button" id="button" value="Next" onclick="return std_ans()">Go To Next</button>
						<p id="error" style="font-size:1em;font-style:italic;font-weight:bold;color:red"></p>
					</div>
				
				
				
				
				</div>
			</div>
		
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Option</th>
						<th>Description</th>       
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						  <div class="radio">
								<label><input type="radio" name="optradio" id="opt1" value="op1">A</label>
						   </div>
						</td>
						<td><pre class="size"><%=options[0]%></pre></td>
					</tr>
					<tr>
						<td>
							<div class="radio">
								<label><input type="radio" name="optradio" id="opt2" value="op2">B</label>
							</div>
						</td>
						<td><pre class="size"><%=options[1]%></pre></td>
					</tr>
					<tr>
						<td>
							<div class="radio">
								<label><input type="radio" name="optradio" id="opt3"  value="op3">C</label>
							</div>
						</td>
						<td><pre class="size"><%=options[2]%></pre></td>
					</tr>
					<tr>
						<td>
							<div class="radio">
								<label><input type="radio" name="optradio" id="opt4" value="op4">D</label>
							</div>
						<td><pre class="size"><%=options[3]%></pre></td>
					</tr>
				</tbody>
			</table>
			
		</div>
	</div>
	
	
	<footer class="raw-footer container-fluid" style="padding : 15px 15px ; background:whitesmoke">
		
			<div class="row">
				<div class="col-xs-12 col-sm-4">
					
					<button type="button" id="skip" class="btn btn-default btn-md skipButton" style="background:lightgray" data-toggle="modal" data-target="#skipModal">Skip <%=player.getSkipsRemaining()%></button>
					<script>
						var skipsRemaining = <%=player.getSkipsRemaining()%>
						
						if(skipsRemaining < 1)
						{
						   document.getElementById("skip").style.visibility = "hidden";
						}
						
					</script>
				</div>
				
				<div class="col-xs-12 col-sm-4">
					
						<div class="row">
							<div class="col-xs-12 col-sm-3">
								<label>Confidence:- </label>
							</div>
							<div class="col-xs-12  col-sm-3">
								<input type="radio" name="confidence" id="lt20" value="20" title="Right: +1; Wrong: -1"> &lt; 20%
							</div>
							
							<div class="col-xs-12 col-sm-3">
								<input type="radio" name="confidence" id="et50" value="50"  title="Right: +2; Wrong: -2"> 50%
							</div>
							
							<div class="col-xs-12 col-sm-3">
								<input type="radio" name="confidence" id="gt80" value="80"  title="Right: +3; Wrong: -3"> &gt; 80%
							</div>
						</div>
					
				</div>
				
				<div class=" col-xs-12 col-sm-offset-3 col-sm-1">
					
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#endGameModal">End Game</button>
					
				</div>
			</div>
		</footer>
		</form>
		 
		
</body>
    <script src="style2.js"></script>
  <script>
$(document).ready(function(){
  
  $(".navbar ul a, footer a[href='#myPage']").on('click', function(event) {

  if (this.hash !== "") {

    event.preventDefault();
    var hash = this.hash;
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 750, function(){

    
      window.location.hash = hash;
      });
    } 
  });
})


$(window).scroll(function() {
  $(".slideanim").each(function(){
    var pos = $(this).offset().top;

    var winTop = $(window).scrollTop();
    if (pos < winTop + 600) {
      $(this).addClass("slide");
    }
  });
});



    </script>
    <script src="js/bootstrap.min.js"></script>

</html>