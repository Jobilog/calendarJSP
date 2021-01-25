<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormatSymbols"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/sytle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/calendar.js"></script>
<title>Lesson 7 Calendar</title>
</head> 
<body>
	<div class="indiv">	
		<br> <br>
<!-- layout for the input of years , month, days -->
		<form method="GET" name="myform" action="LSN07O.jsp" onsubmit="return(validation());">
			<label>Year</label> <input type="text" id="idyear" name="year"
				align="right" placeholder="Enter a Year" class="txtbox"
				autocomplete="off" ><br> <br> <label>Month</label>
			<input type="text" id="idmonth" name="month" align="right"
				placeholder="Enter a Month" autocomplete="off"
				class="txtbox solomarigin" ><br> <br> <label>Day</label>
			<input type="text" id="idday" name="day" align="right"
				placeholder="Enter a Day" autocomplete="off" class="txtbox" >
			<br> <br> <br>
			<button>Submit</button>
		</form>
	</div>

</body>
</html>