<%@ page language="java"%>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<html>
<head>
	<title>See You Again</title>
     
     <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-social.css" rel="stylesheet" >  
     <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" >      
    <link href="css/thanku.css" rel="stylesheet" >
    
    <script src="js/jquery.min.js"></script>  
    <script src="bootstrap/js/bootstrap.min.js"></script> 
    <script src="js/cookie.js"> </script>
    
    
  
</head>


<body id="myPage" data-spy="scroll" data-target="#myScroll" >

<script>

		setCookie("thanku","1"); //*** Comment this line during actual deployment ***  */
		var thanku = getCookie("thanku");
			
		if( thanku != 1 )
		{
				window.location.replace("index.jsp?msg=thanku c not set");
		}
			       	     
		setCookie("thanku","1");
		/* Creates all the required cookies on client's browser*/
    			
    	setCookie("admin","0");
    	setCookie("rules","0");
    	setCookie("timer1","30:00");
    	setCookie("quiz","0");
    	setCookie("thanku","1");
    	
    	 $(document).ready(function()
    				{
    				  $(".navbar ul a, footer a[href='#myPage']").on('click', function(event) 
    				  {
    				
    					  if (this.hash !== "") 
    					  {
    					
    						    event.preventDefault();
    						    var hash = this.hash;
    						    $('html, body').animate(		
    						    {
    						      scrollTop: $(hash).offset().top
    						    }, 750, function()
    						    {
    						      window.location.hash = hash;
    				       		});
    			     	} 
    			   	});
    			});


    			$(window).scroll(function() 
    			{
    			 	 $(".slideanim").each(function()
    				 {
    			    	var pos = $(this).offset().top;
    					var winTop = $(window).scrollTop();
    			    	if (pos < winTop + 600)
    			    	{
    			      		$(this).addClass("slide");
    			        }
    			  	});
    			});
    	 

    </script>
    <%
	    Player player = (Player)session.getAttribute("player");
		Question question = (Question)session.getAttribute("question");
		
		session.setAttribute("player", player);
		session.setAttribute("question", question);
	
    %>
 
 <nav id="myScroll" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container" style="padding-top:5px">
        <div class="navbar-header">
            <a class="navbar-brand logo" style="font-weight:bold; font-size:50px" href="index.jsp">CZAR</a>
        
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav ">
                <li><a href="#contact"><i class="fa fa-envelope-o"></i>
        Contact</a></li><li><a href="#developers"><i class="fa fa-code"></i>
              Developer</a></li></ul>
    <ul class="nav navbar-nav navbar-right">
    <li><a style="font-weight:bold" data-toggle="modal" data-target="#ScoreModal" ><span class="glyphicon glyphicon-log-in"></span>
           View Score</a></li>
           <li><a href="jsp/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Logout</a></li> </ul>
        </div>
        </div>
    </nav>

  
  <div id="ScoreModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 style="font-weight:bold">Score</h3>
                </div>
                <div id="m_body"  class="modal-body">
                
                 <p class="logo" style="font-size: 1.5em"> 
	                 Final Score: <%=player.getScore()%> <br>
	                 Remaining Time: <%=player.getTime()%><br>
	                 Questions Attempted: <%=player.getQuestionsAttempted() %><br>
	                 Correct answered: <%=player.getCorrectlyAnswered()%> <br>
	                 Skips Remaining:  <%=player.getSkipsRemaining()%> 	    
                 </p>
       
                </div>
            </div>
        </div>
    </div>



<header class="jumbotron" style="background-color:lightgray;margin-bottom: -30px">
    
    <div id="contact" class="container-fluid" >    
    <h2 class="text-center">We value your feedback!!!</h2>
        <div class="row " style="padding-top:50px">
       
        <div class="col-xs-12 col-sm-6 "  style="line-height: 1.42857143 !important;
    letter-spacing:0.5px; font-size:1.3em">
                    
            <h4><b>Our Address</b></h4>
                       No. 44, Vidya Nagari<br>
		               Shivdarshan, Parvati,<br>
		               Pune, Maharashtra<br>
                       411009<br>    
		            <i class="fa fa-phone"></i>: +020 2422 8258<br>
		          <i class="fa fa-fax"></i>: +020 2422 6858<br>
		   
		         
        
            <div class="nav navbar-nav" style="padding-top:20px ; ">
                <a id="insta"  class="btn btn-social-icon btn-instagram" href="https://instagram.com/ascipvg" ><i class="fa fa-instagram"></i></a>
                
                <a id="fb"  class="btn btn-social-icon btn-facebook" href="https://facebook.com/ascipvg" ><i class="fa fa-facebook"></i></a>
                <a id="twit" class="btn btn-social-icon btn-twitter" href="https://twitter.com/ascipvg"><i class="fa fa-twitter"></i></a>
                        <a id="tube" class="btn btn-social-icon btn-youtube" href="https://www.youtube.com/channel/UC649l_Ah8y3f816F_2WETmA"><i class="fa fa-youtube"></i></a>
                        <a id="mail" class="btn btn-social-icon " href="mailto:support@ascipvg.org"><i  class="fa fa-envelope-o"></i></a>
                
              </div>  
            </div>
            
             <div class="col-xs-12 col-sm-6  ">
            
             <form class="form-horizontal" role="form" action="jsp/feedback.jsp">
                   
                    <div  class="form-group">
                   <h3> <label for="UI" class="col-xs-12 col-sm-1 control-label text-left">Interface:</label></h3>
	             <div class="col-xs-12  col-sm-9 stars">
            	
			      <input class="star star-5 form-control" id="uistar-5" type="radio" name="UI" value="5"/>
			      <label class="star star-5 control-label" for="uistar-5"></label>
			      <input class="star star-4 form-control" id="uistar-4" type="radio" name="UI" value="4"/>
			      <label class="star star-4 control-label" for="uistar-4"></label>
			      <input class="star star-3 form-control" id="uistar-3" type="radio" name="UI" value="3"/>
			      <label class="star star-3 control-label" for="uistar-3"></label>
			      <input class="star star-2 form-control" id="uistar-2" type="radio" name="UI" value="2"/>
			      <label class="star star-2 control-label" for="uistar-1"></label>
			      <input class="star star-1 form-control" id="uistar-1" type="radio" name="UI" value="1"/>
			      <label class="star star-1 control-label" for="uistar-1"></label>
			   
 			 
	             
        	</div>  
       
                   </div>
                   
                   
                   
                    <div  class="form-group">
                    <h3><label for="speed" class="col-xs-12 col-sm-1 control-label text-left">Responsiveness:</label></h3>
	             <div class="col-xs-12  col-sm-9 stars">
            	
			     <input class="star star-5" id="sppedstar-5" type="radio" name="speed" value="5"/>
			      <label class="star star-5" for="sppedstar-5"></label>
			      <input class="star star-4" id="sppedstar-4" type="radio" name="speed" value="4"/>
			      <label class="star star-4" for="sppedstar-4"></label>
			      <input class="star star-3" id="sppedstar-3" type="radio" name="speed" value="3"/>
			      <label class="star star-3" for="sppedstar-3"></label>
			      <input class="star star-2" id="sppedstar-2" type="radio" name="speed" value="2"/>
			      <label class="star star-2" for="sppedstar-2"></label>
			      <input class="star star-1" id="sppedstar-1" type="radio" name="speed" value="1"/>
			      <label class="star star-1" for="sppedstar-1"></label>
			   
 			 
	             
        	</div>  
       
                   </div>
                   
                   
                   
                   
                   
                    
                    <div  class="form-group">
                   <h3> <label for="difficulty" class="col-xs-12 col-sm-1 control-label text-left">Difficulty:</label></h3>
	             <div class="col-xs-12  col-sm-9 stars">
            
			   
			     <input class="star star-5" id="difficultystar-5" type="radio" name="difficulty" value="5"/>
			      <label class="star star-5" for="difficultystar-5"></label>
			      <input class="star star-4" id="difficultystar-4" type="radio" name="difficulty" value="4"/>
			      <label class="star star-4" for="difficultystar-4"></label>
			      <input class="star star-3" id="difficultystar-3" type="radio" name="difficulty" value="3"/>
			      <label class="star star-3" for="difficultystar-3"></label>
			      <input class="star star-2" id="difficultystar-2" type="radio" name="difficulty" value="2"/>
			      <label class="star star-2" for="difficultystar-2"></label>
			      <input class="star star-1" id="difficultystar-1" type="radio" name="difficulty" value="1"/>
			      <label class="star star-1" for="difficultystar-1"></label>
			   
 			
	             
        	</div>  
       
                   </div>
                   
           <div class="form-group">
                      <label for="feedback" class="col-sm-2 control-label sr-only">Feedback</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="comments" style="height:250px" placeholder="Enter Your Feedback"></textarea>
                        </div>
                 	</div>
                   
                <div class="form-group">
                        <div class=" col-sm-10">
                            <button  class="btn " name="button" value="feedback" style="color:white ; background:gray">Send Feedback</button>
                        </div>
                    </div>

                </form>
                </div>   
            
    </div>
        
    </div>
   
    </header>
    <footer id="developers" class="row-footer text-center container-fluid" style="background:lightgray ; padding:0px 40px">
  
    <div class="container"> 
	<div class="row ">
	<div class="col-md-12 col-sm-12">
     <h3 class="text-center myfont" style="padding-bottom:100px">THINKTANK</h3>
	 </div>
	 </div>
	 <div class="row text-center " style="padding-bottom:40px">
	 <div  class=" col-md-4  col-xs-12">
	 </div>
    <div  class=" col-md-4  col-xs-12">
      <div  style="background:lightgray" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px ;border:2px solid gray ; max-height:200px" src="imgs/mohit.jpg"  alt="Mohit Kunjir">
          <p><strong>Mohit Kunjir</strong></p>
        <p>I.T.</p>
        
      </div>
    </div>
	 <div  class=" col-md-4  col-xs-12">
	 </div>
</div>

   
       <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
    </div>
	
     
    </footer>
   
    
    </body>
</html>