<%@ page language="java"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>

<html>
<head>
	<title>Welcome</title>
     
     <meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-social.css" rel="stylesheet" >    
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" >       
    <link href="css/index.css" rel="stylesheet" >
    
    <script src="js/jquery.min.js"></script>  
    <script src="bootstrap/js/bootstrap.min.js"></script> 
    <script src="js/cookie.js"> </script>
    <script src="js/index.js"> </script>     
   
</head>


<body onkeydown="return start1(event)" onmousedown="return disableclick(event)" oncontextmenu="false" id="myPage" data-spy="scroll" data-target="#myScroll" >

<script>
		/* Creates all the required cookies on client's browser*/
    			
    	setCookie("admin","0");
    	setCookie("rules","0");
    	setCookie("timer1","30:00");
    	setCookie("quiz","0");
    	setCookie("thanku","0");
    	
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
<nav id="myScroll" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container" style="padding-top:5px">
        <div class="navbar-header">
        <a class="navbar-brand logo" style="font-weight:bold; font-size:50px" href="#">CZAR </a>
        
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
                <li><a href="#myPage"><span class="glyphicon glyphicon-home"></span>
                    Home</a></li><li><a href="#about"><span class="glyphicon glyphicon-info-sign"></span>
            About</a></li><li><a href="#sponsors"><i class="fa fa-money"></i>
              Sponsors</a></li></ul>
    <ul class="nav navbar-nav navbar-right">
    <li><a data-toggle="modal" data-target="#loginModal" ><span class="glyphicon glyphicon-log-in"></span>
            LogIn</a></li><li><a data-toggle="modal" data-target="#registerModal"><span class="glyphicon glyphicon-registration-mark"></span>
            Register</a></li> </ul>
        </div>
        </div>
    </nav>
     <div id="registerModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>Register</h4>
                 <p id="error" style="color:red; font-weight:bold;"></p>
                </div>
                <div class="modal-body">
                
                
                 <form class="form-horizontal" role="form" name="registrationForm"  method="post" onsubmit="return std_reg()" action="jsp/checkPlayer.jsp">
                 
                    <div class="form-group">
                        <label for="playerNameF" class="col-sm-2 control-label">First Name</label>                       
						<div class="col-sm-10">
							<input required type="text" class="form-control" id="playerNameF" name="playerNameF" placeholder="Enter First Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerNameL" class="col-sm-2 control-label">Last Name</label>
                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="playerNameL" name="playerNameL" placeholder="Enter Last Name">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="playerContact" class="col-xs-12 col-sm-2 control-label">Contact No</label>                
                        <div class="col-xs-7 col-sm-6 col-md-7">
                                   <input required type="text" class="form-control" id="playerContact" name="playerContact" placeholder="Tel. number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input required type="email" class="form-control" id="playerEmail" name="playerEmail" placeholder="Email">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="playerPassword" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input required type="password" class="form-control" id="playerPassword" name="playerPassword" placeholder="Enter Password">
                        </div>
                    </div>
                    
                   
                    
                    <div class="form-group">
                        <label for="playerConfirmPassword" class="col-sm-2 control-label">Confirm Password</label>
                        <div class="col-sm-10">
                            <input required type="password" class="form-control" id="playerConfirmPassword" name="playerConfirmPassword" placeholder="Confirm Password">
                        </div>
                    </div>
                    
                    
                    
					<div class="form-group">
                        <label for="playerCollege" class="col-sm-2 control-label">College</label>
                        <div class="col-sm-10">
                            <input required type="text" class="form-control" id="playerCollege" name="playerCollege" placeholder="Enter College">
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label for="playerLevel" class="col-sm-2 control-label">Difficulty</label>
                       
                       <div class="col-sm-10">
                         <select class="form-control" required style="color: #a0b3b0" name="playerLevel" id="playerLevel">
                            <option value="" selected disabled>--Difficulty Level--</option>
                            <option value="FE">F.E.</option>
                            <option value="SE">S.E.</option>
                            <option value="TEBE">T.E.</option>
                            <option value="TEBE">B.E.</option>
                        </select>
                    </div>
                    </div>
                   
                <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" name="button" value="Ready To Rock" class="btn btn-primary">Register</button>
                        </div>
                    </div>

                </form>
                    
                </div>
            </div>
        </div>
    </div>
   
    <div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>LogIn</h4>
                &nbsp;&nbsp;
               
                </div>
                <div class="modal-body">
                <form class="form-inline" method="post" onsubmit="return std_log()" action="jsp/checkPlayer.jsp"> 
                    <div class="form-group">
                        <label class="sr-only" for="emailIdL">Email Address</label>
                        <input  type="email" class="form-control input-sm"  id="emailIdL" name="emailIdL" placeholder="Email" autocomplete="on" required>
                    </div>
                       <div class="form-group">
                           <label for="passwordL" class="sr-only">Password</label>
                        <input  type="password" class="form-control input-sm" id="passwordL" name="passwordL" placeholder="Password" required>
                    </div>
             
					<button type="submit" name="button" value="Start Game" class="btn btn-info btn-sm">Sign In</button>
                    
                    
                    </form>
                       
                    
                </div>
            </div>
        </div>
    </div>
    
<header class="jumbotron"  style="height:700px ; background-image:url(imgs/dennis.jpg); background-size:100% 100%">
    
    <div class="container" style="padding-top:100px ;  width: 1800px">
    
    <div class="row row-content">
    <div class="col-xs-12">
<div id="mycarousel" class="carousel slide text-center"
         data-ride="carousel"  data-interval="3000" style="padding-top:300px">
        <ol class="carousel-indicators">
    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
    <li data-target="#mycarousel" data-slide-to="1"></li>
    <li data-target="#mycarousel" data-slide-to="2"></li>
     <li data-target="#mycarousel" data-slide-to="3"></li>
        
        </ol>
        
<div class="carousel-inner" role="listbox" style="color:white ;  padding-bottom:50px">
    <div class="item active" >
  
        <h4>"C is quirky, flawed, and an enormous success."</h4>
     
    </div>  
    <div class="item"  >
     <h4 >" C++ and Java, say, are presumably growing faster than plain C, <br>but I bet C will still be around."</h4>

</div>
    
    <div class="item">
     <h4>"When I read commentary about suggestions for where C should go, I often think back<br> and give thanks that it wasn't developed under the advice of a worldwide crowd."</h4>
    </div>
        
        
        <div class="item">
     <h4>"C is peculiar in a lot of ways, but it, like many other successful things, <br>has a certain unity of approach that stems from development in a small group."</h4>
    
        </div>
        </div>
    
    
    <a class="left carousel-control" href="#mycarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#mycarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
    
    
        </div>
        </div>
    </div>
    </div>
    </header>

<div id="about" class="container-fluid">
   <div class="row row-content">
    <div class="col-xs-12 col-sm-4 slideanim">   
       <img src="imgs/images.png" class="img-responsive" style="max-height:350px ; opacity:0.7">
       
     </div>
       
      
           <div class="col-xs-12 col-sm-8 slideanim">
               
              <h2 >ABOUT CZAR</h2>
               <p>
                   <strong>If you think you can C, well, think again!!!<br/>Play this game to test your C skills </strong>
                
                   
            </p>
                  
      
                   
                   
               </div>
          
       </div>
    </div>
    
<footer id="sponsors" class="row-footer text-center" style="background:lightgray ; padding:40px 40px">
     <h2 class="text-center myfont" style="padding-bottom:100px">SPONSORS</h2>
    <div id="mycarousel2" class="carousel slide text-center"
         data-ride="carousel"  data-interval="2000" style="padding-top=300px">
        <ol class="carousel-indicators">
    <li data-target="#mycarousel2" data-slide-to="0" class="active"></li>
    <li data-target="#mycarousel2" data-slide-to="1"></li>
    <li data-target="#mycarousel2" data-slide-to="1"></li>
    
        
        </ol>
        
<div class="carousel-inner" role="listbox" style="color:white ;  padding-bottom:50px">
    
    <div class="item active" >
  
    <div class="row text-center slideanim" style="padding-bottom:40px">
    <div  class="col-sm-4 col-xs-12">
      <div  style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px;border:2px solid gray ; max-height:200px" src="imgs/vinamax.jpg" alt="Vinamax">
       
      </div>
    </div>
    <div  class="col-sm-4 col-xs-12">
      <div style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px;border:2px solid gray ; max-height:200px" src="imgs/hobpoint.png" alt="Hobpoint">
         
      </div>
    </div>
    <div class="col-sm-4 col-xs-12">
      <div style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px;border:2px solid gray ; max-height:200px" src="imgs/stupidsid.png" alt="StupidSid">
         
      </div>
    </div>
</div>
        
 </div>
    
    
     <div class="item " >
  
        <div class="row text-center slideanim" style="padding-bottom:40px">
    <div  class="col-sm-4 col-xs-12">
      <div  style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px ;border:2px solid gray ; max-height:200px" src="imgs/seed.png"  alt="Seed">
         
      </div>
    </div>
    <div  class="col-sm-4 col-xs-12">
      <div style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px;border:2px solid gray ; height:200px" src="imgs/kfc.png" alt="KFC">
         
      </div>
    </div>
    <div class="col-sm-4 col-xs-12">
      <div style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px ;border:2px solid gray ; max-height:200px" src="imgs/mcd.jpg" alt="McDonalds">
       
        
      </div>
    </div>
</div>
        
 </div>
 
 
 <div class="item " >
  
        <div class="row text-center slideanim" style="padding-bottom:40px">
    <div  class="col-sm-4 col-xs-12">
      <div  style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px ;border:2px solid gray ; max-height:200px" src="imgs/muffin.png"  alt="Muffin">
         
      </div>
    </div>
    <div  class="col-sm-4 col-xs-12">
      <div style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px;border:2px solid gray ; height:200px" src="imgs/kfc.png" alt="KFC">
         
      </div>
    </div>
    <div class="col-sm-4 col-xs-12">
      <div style="background:ghostwhite" class="thumbnail">
        <img class="img-responsive" style="padding:10px 10px ;border:2px solid gray ; max-height:200px" src="imgs/mcd.jpg" alt="McDonalds">
       
        
      </div>
    </div>
</div>
        
 </div>

 </div>

    
       <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
    
     </div>
    </footer>

    </body>
</html>