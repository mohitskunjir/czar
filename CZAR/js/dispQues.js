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
	var questions = document.getElementById("questionNo").value;
	var level = document.getElementById("level").value;
	var table = document.getElementById("tableName").value;
	
   if( questions == "" || questions == undefined)
	{
	    document.getElementById("error").innerHTML = "Error: Please Enter a Question";	
		
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