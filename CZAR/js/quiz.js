
function timer2() 
{
    var s=document.getElementById("timer1").value;
	var arr=s.split(":",s.length);
	var sec=parseInt(arr[1]);
	var min=parseInt(arr[0]);
	
    if(sec!=0)
	{
            sec--;
	}
        
	else if(min!=0)
        {
            sec=59;
            min--;
	}
        
	else
	{
		document.cookie = "thanku=1;path=/CZAR";
            window.location="thanku2.jsp";
	}
        
        if(min<=10)
        {
            document.getElementById("timerDiv").setAttribute("style","background-color:orange");   
            
        }     
        
        if(min<=1)
        {
            document.getElementById("timerDiv").setAttribute("style","background-color:red"); 
           
        }
              
        if (min >= 10 && sec >= 10)
		s=min+":"+sec;
	else if (min < 10 && sec >= 10)
		s="0"+min+":"+sec;
	else if (min >= 10 && sec < 10)
		s=min+":0"+sec;
	else
		s="0"+min+":0"+sec;
	
        document.cookie = "timer1="+s;
        
        document.getElementById("timer1").setAttribute("value", s);
	setTimeout("timer2()",1000);
}



function std_ans() 
{
    var flag1=false,flag2=false,mainFlag=false;
    
    if(document.getElementById('opt1').checked)
    {
        
        flag1=true;
    }
    
     else if(document.getElementById('opt2').checked)
    {
        
        flag1=true;
    }
    
     else if(document.getElementById('opt3').checked)
    {
       
        flag1=true;
    }
     else if(document.getElementById('opt4').checked)
    {
        
        flag1=true;
    }
    else
    {
      /*  alert("Please Choose an Option");*/
    	document.getElementById("error").innerHTML = "* Please Choose an Option *";
        flag1=false;
    } 
    
    
    if(document.getElementById('lt20').checked)
    {
        
        flag2=true;
    }
    
     else if(document.getElementById('et50').checked)
    {
       
        flag2=true;
    }
    
     else if(document.getElementById('gt80').checked)
    {
        
        flag2=true;
    }
    else
    {
       /* alert("Please Choose your Confidence Level");*/
    	document.getElementById("error").innerHTML = "Please Choose your Confidence Level";
    	
        flag2=false;
    } 
    
    if(flag1==false || flag2==false)
    {
        mainFlag=false;
    }
    else
    {
        mainFlag=true;
    }
    return mainFlag;
}

function getCookie(cname)
{
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}