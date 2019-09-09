function addTableNames() 
{
	var optionsAsString = "<option value selected disabled>--Select Table--</option>";
	var productArray = ["","",""];
	
    var x = document.getElementById("level").value;
    
    if(x=="FE")
    {
    	productArray = ["table1", "table2", "table3"];	
    }
    else if(x=="SE") 
    {
    	productArray = ["table4", "table5", "table6"];	
    }
    else if(x=="TE" || x=="BE") 
    {
    	productArray = ["table7", "table8", "table9"];	
    }
    for(var i = 0; i < productArray.length; i++)
	{
	 		optionsAsString += "<option value='" + productArray[i] + "'>" + productArray[i] + "</option>";
	}
	$( 'select[name="tableName"]' ).find('option').remove().end().append( optionsAsString );
}

function validForm()
{
	var questions = document.getElementById("questionTextArea").value;
	var op1 = document.getElementById("option1").value;
	var op2 = document.getElementById("option2").value;
	var op3 = document.getElementById("option3").value;
	var op4 = document.getElementById("option4").value;
	var ans = document.getElementById("answer").value;
	var level = document.getElementById("level").value;
	var table = document.getElementById("tableName").value;
	
   if( questions == "" || questions == undefined)
	{
	    document.getElementById("error").innerHTML = "Error: Please Enter a Question";	
		
		 return false;
	}
   if(  op1 == "" || op1 == undefined ) 
   {
	   document.getElementById("error").innerHTML = "Error: Please Enter a Option A";	
	   
	   return false;
   }
   if(  op2 == "" || op2 == undefined ) 
   {
	   document.getElementById("error").innerHTML = "Error: Please Enter a Option B";	
	   
	   return false;
   }
   if( op3 == "" || op3 == undefined ) 
   {
	   document.getElementById("error").innerHTML = "Error: Please Enter a Option C";	
	  
	   return false;
   }
   if( op4 == "" || op4 == undefined ) 
   {
	   document.getElementById("error").innerHTML = "Error: Please Enter a Option D";	
	  
	   return false;
   }
   if( ans == "" || ans == undefined ) 
   {
	   document.getElementById("error").innerHTML = "Error: Please Select Answer";	
	  
	   return false;
   }
   if( level == "" || level == undefined ) 
   {
	   document.getElementById("error").innerHTML = "Error: Please Select Difficulty Level";	
	   
	   return false;
   }
   if( table == "" || table == undefined )
   {
	   document.getElementById("error").innerHTML = "Error: Please Select Table Name";	
	   
	   return false;
   }
   return true;
}