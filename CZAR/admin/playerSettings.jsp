<%@ page language="java"%>  
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="czar.*"%>

<%
String n=request.getParameter("val");
if( n.length() > 0 )
{
	try
	{
		Connect con = new Connect();
		ResultSet rs=con.executeQuery("select status from playerdetails where emailId='"+n+"'");
		if( rs.next() == true )
		{
			String result=rs.getString(1);
			out.print(result);
		}
		con.disconnect();
	}
	catch(Exception e)
	{
			e.printStackTrace();
	}
}


%>