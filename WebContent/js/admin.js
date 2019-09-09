function validForm()
{
	var oldEmail = document.getElementById("oldEmail").value;
	var oldPass = document.getElementById("oldPass").value;
	var newPass = document.getElementById("newPass").value;
	var cPass = document.getElementById("cPass").value;
	
	if(oldEmail == "" || oldEmail == undefined)
	{
		 document.getElementById("error").innerHTML = "Enter old EmailId";
		return false;
	}
	if(oldPass == "" || oldPass == undefined)
	{
		 document.getElementById("error").innerHTML = "Enter old Password";
		return false;
	}
	if(newPass == "" || newPass == undefined)
	{
		 document.getElementById("error").innerHTML = "Enter new Password";
		return false;
	}
	if(cPass == "" || cPass == undefined)
	{
		 document.getElementById("error").innerHTML = "Enter confirm Password";
		return false;
	}
	if(cPass != newPass)
	{
		document.getElementById("error").innerHTML = "New Passwords do not match";
		return false;
	}
	return true;
}