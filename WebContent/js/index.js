 function std_log()
	{
		var flag1=false;
		
		if(document.getElementById("emailIdL").value=="" || document.getElementById("passwordL").value=="")
		{
			flag1=false;
			if(document.getElementById("emailIdL").value=="")	
			{				
				document.getElementById("error").innerHTML="Error: Enter Username.";
				return flag1;
			}
			
			if(document.getElementById("passwordL").value=="")	
			{	
				document.getElementById("error").innerHTML="Error: Enter Password.";
				return flag1;
			}
		}
		else
		{
			flag1 = true;
			return flag1;		
		}
		
		return flag1;		
	}	
function std_reg()
{	
	var firstName = document.getElementById('playerNameF').value;
	if(firstName == "")
	{
		document.getElementById("error").innerHTML="Error: Enter First Name.";
        return false;
	}
	
	firstName = firstName.toString();
	if(/[^a-z]/i.test(firstName))
	{
		document.getElementById("error").innerHTML="Error: Fisrt Name cannot contain numbers/special characters.";
		return false;
	}
	
	var lastName =  document.getElementById('playerNameL').value;
	if(lastName == "")
	{
		document.getElementById("error").innerHTML="Error: Enter Last Name.";
        return false;
	}
	
	lastName = lastName.toString();
	if(/[^a-z]/i.test(lastName))
	{
		document.getElementById("error").innerHTML="Error: Last Name cannot contain numbers/special characters.";
		return false;
	}
	
	var number =  document.getElementById('playerContact').value;
	if (isNaN(number))
    {
        document.getElementById("error").innerHTML="Error: Phone Number can only contain numbers.";
        return false;
    }
	
    number = number.toString();
    if (number.length != 10)
    {
         document.getElementById("error").innerHTML="Error: Phone Number must be 10 digits long.";
         return false;
    }
    
    var email =  document.getElementById('playerEmail').value;
    if(email == "")
    {
    	 document.getElementById("error").innerHTML="Error: Enter your Email Id.";
        return false;
    }
    
    /*var re = "/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/";
    email = email.toString();
    
    if(re.test(email))
    {
    	alert("Enter your Email Id in proper format");
        return false;
    }*/
    
    var password = document.getElementById('playerPassword').value;
    if(password == "")
    {	
    	document.getElementById("error").innerHTML="Error: Enter your Password.";
        return false;
    }
    
    var cpassword = document.getElementById('playerConfirmPassword').value;
    if(cpassword == "")
    {
    	document.getElementById("error").innerHTML="Error: Enter Password Once again.";
        return false;
    }
    
    if (password != cpassword)
    {
    	document.getElementById("error").innerHTML="Error: The passwords you entered do not match.";
    	return false;
    }
    
    var college = 	document.getElementById('playerCollege').value;
    if(college == "")
    {
    	document.getElementById("error").innerHTML="Error: Enter your College name.";
        return false;
   	}
    
    var difficulty = document.getElementById('playerLevel').value;
    if(difficulty == "")
    {
    	document.getElementById("error").innerHTML="Error: Enter your Academic year.";
        return false;
   	}
    
    return true;
}