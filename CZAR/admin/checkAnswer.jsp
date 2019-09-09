<%@ page language="java"%>
    
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>
   
<html>

<head>

	<meta charset="utf-8">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Loading Next Question</title>
	
	<script src='../js/cookie.js'></script>
	
</head>
<body>

Loading Next Question ...

<%

	Player player=(Player)session.getAttribute("player");
	Question question=(Question)session.getAttribute("question");
	
	String buttonClicked = null;
	String time = null;
	String ans  = null;
	String opSelected = null;
	
	int curentQuestionNo;
	int score;
	int questionsAttempted;
	int correctlyAnswered;
	int confidence;
	int skip;
	
	try
	{
		
		
		buttonClicked=request.getParameter("button");
		
		time = request.getParameter("timer1");
		
	 	score = Integer.parseInt(request.getParameter("scoreNumber"));
		
		questionsAttempted = player.getQuestionsAttempted();
		
		correctlyAnswered = player.getCorrectlyAnswered();
		
		skip = player.getSkipsRemaining();
		
		curentQuestionNo=question.getQuestionNo();
		
		player.setTime(time);
		
			if(buttonClicked.equals("Next"))
			{
			    opSelected = request.getParameter("optradio");
				confidence = Integer.parseInt(request.getParameter("confidence"));
				ans = question.generateAnswer();
				
				if( ans != null )
				{
					if(ans.equalsIgnoreCase(opSelected))
					{
						if(confidence==20)
						{
							score+=1;
						}
						else if(confidence==50)
						{
							score+=2;
						}
						if(confidence==80)
						{
							score+=3;
						}
						correctlyAnswered+=1;		
					}
					else
					{
						if(confidence==20)
						{
							score-=1;
						}
						else if(confidence==50)
						{
							score-=2;
						}
						if(confidence==80)
						{
							score-=3;
						}
					}
					
					questionsAttempted+=1;	
					
					curentQuestionNo+=1;
					question.setQuestionNo(curentQuestionNo);
					
					player.setTime(time);			
					player.setQuestionsAttempted(questionsAttempted);
					player.setCorrectlyAnswered(correctlyAnswered);
					player.setScore(score);
					player.setSkipsRemaining(skip);
					
					session.setAttribute("player", player);
					session.setAttribute("question",question);
					
					Connect con = new Connect();
					con.updatePlayerInfo(player, question);
					con.disconnect();
					
					if(curentQuestionNo < question.testQuestions)
					{
						%>
							<script>
								setCookie("quiz","1");
								window.location.replace("dispQues.jsp");
							</script>
						<%
					}
					else
					{
						%>
							<script>
								setCookie("quiz","0");
							 	setCookie("thanku","1");
								window.location.replace("dispQues.jsp");
							</script>
						<%
					}
				}
				else
				{
					%>
					<script>
						setCookie("quiz","1");
						window.location.replace("dispQues.jsp");
					</script>
				<%
				}
			}
		
			else if(buttonClicked.equalsIgnoreCase("Skip"))
			{	
				if(player.getSkipsRemaining() > 0)
				{						
					skip--;
					
					curentQuestionNo+=1;
					question.setQuestionNo(curentQuestionNo);				
					
					player.setTime(time);			
					player.setQuestionsAttempted(questionsAttempted);
					player.setCorrectlyAnswered(correctlyAnswered);
					player.setScore(score);
					player.setSkipsRemaining(skip);
					
					session.setAttribute("player", player);
					session.setAttribute("question",question);
					
					Connect con = new Connect();
					con.updatePlayerInfo(player, question);
					con.disconnect();
					
					if(curentQuestionNo < question.testQuestions)
					{
						%>
							<script>
								setCookie("quiz","1");
								window.location.replace("dispQues.jsp");
							</script>
						<%
					}
					else
					{
						%>
							<script>
								setCookie("quiz","0");
								setCookie("thanku","1");
								window.location.replace("dispQues.jsp");
							</script>
						<%
					}
				}
				else
				{
					%>
						<script>
							setCookie("quiz","1");
							window.location.replace("dispQues.jsp");
						</script>
					<%
				}
			}
			else if(buttonClicked.equalsIgnoreCase("End Game"))
			{
				player.setScore(score);
				player.setTime(time);
				player.setQuestionsAttempted(questionsAttempted);
				player.setCorrectlyAnswered(correctlyAnswered);
				player.setSkipsRemaining(skip);
				
				session.setAttribute("player", player);
				session.setAttribute("question",question);
				
				Connect con = new Connect();
				con.updatePlayerInfo(player, question);
				con.disconnect();
			
				%>
				<script>
					setCookie("quiz","0");
					setCookie("thanku","1");
					window.location.replace("dispQues.jsp");
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
			   window.location.replace("dispQues.jsp?msg=Check Answer: Database Not found");
			</script>
			<%
		}
		
		else if(e.getErrorCode()==1045) // occurs when database credentials are illegal.... check properties
		{
			%>
			<script>				
			   window.location.replace("dispQues.jsp?msg=Check Answer: Access Denied");
			</script>
			<%
		}


		else if(e.getErrorCode()==1406) //  occurs when size too long (Won't Occur)
		{	
			%>
			<script>				
			   window.location.replace("dispQues.jsp?msg=Check Answer: Data too long"); 
			</script>
			<%	
		}
		
		else if( e.getMessage().equals("1") ) // programmer defined occurs when question does not exist
		{
			%>
			<script>				
			   window.location.replace("dispQues.jsp?msg=Check Answer: Question Does not exist"); 
			</script>
			<%	
		}
		
		else if(e.getErrorCode() == 1062 ) // occurs when specified username already exists in the database  (Won't Occur)
		{
			%>
			<script>				
			   window.location.replace("dispQues.jsp?msg=Check Answer: User already exist");
			</script>
			<%
		}
		else
		{
			%>
			<script>				
				window.location.replace("dispQues.jsp?msg=Check Answer: Unknown Database Error"); 
			</script>
			<%
		}
	}
	catch(ClassNotFoundException e)
	{
			%>
			<script>				
			   window.location.replace("checkAnswer.jsp"); 
			</script>
			<%
		
	}
	catch(NullPointerException e)
	{
		%>
		<script>				
		   window.location.replace("dispQues.jsp?msg=Check Answer: Unknown Null Error");
		</script>
		<%
	}
	catch(ArrayIndexOutOfBoundsException e)
	{
		%>
		<script>				
		   window.location.replace("dispQues.jsp?msg=Check Answer: Question Does not exist Array"); 
		</script>
		<%	
	}

	catch(Exception e)
	{
		%>
		<script>				
		   window.location.replace("dispQues.jsp?msg=Check Answer: Unknown Error");
		</script>
		<%
	}
%>

</body>

</html>