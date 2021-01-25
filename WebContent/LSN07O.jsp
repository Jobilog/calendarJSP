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
<title>Lesson 7 Output Calendar</title>
</head>
<%
	//get the value of the input value from the previous page
	int getYear = Integer.parseInt(request.getParameter("year"));
	int getMonth = Integer.parseInt(request.getParameter("month"));
	int getDay = Integer.parseInt(request.getParameter("day"));
%>
<%
	//declaration of the variables that will be used for the output of the calendar.
	Locale usersLocale = Locale.getDefault();
	DateFormatSymbols dfs = new DateFormatSymbols(usersLocale);
	Calendar cal = Calendar.getInstance();
	Date now = cal.getTime();
	String[] months = dfs.getMonths();
	String[] days = dfs.getShortWeekdays();
	int date = 1;
	cal.set(getYear, getMonth - 1, date);
	int today = getDay;
	int offset = cal.get(Calendar.DAY_OF_WEEK);
	int maxDays = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<body>
	<div class="caldiv">
		<!-- this will be the output for month and year-->
		<h2>
			<%
				out.print(getYear);
			%>
		</h2>
		<h2>
			<%
				out.print(months[getMonth - 1]);
			%>
		</h2>
		<table border=1 width=60%>
			<tr>
				<%
					//for displaying name of week
					for (int h = 1; h < days.length; h++) {
						//if the name of week is sunday the text color will change into color red if saturday color blue else is black
						if (h == 1) {
				%>
				<th class="col redtext">
					<%
						out.print(days[h]);
					%>
				</th>
				<%
					} else if (h == 7) {
				%>
				<th class="col bluetext">
					<%
						out.print(days[h]);
					%>
				</th>
				<%
					} else {
				%>
				<th class="col ">
					<%
						out.print(days[h]);
					%>
				</th>
				<%
					}
					}
				%>
			</tr>
			<tr>
				<%
					//condition that will display the days in a month of the calendar
					for (int x = 0; x < 6; x++) {
						for (int z = 1; z <= 7; z++) {
							if (z < offset && x == 0) {
				%>
				<td class="col">
					<%
						out.print(" ");
					%>
				</td>
				<%
					} else if (date <= maxDays) {
								if (z == 1) {
									if (date == today) {
				%>
				<td class="col redtext wkend"><strong>
						<%
							out.print(date++);
						%>
				</strong></td>
				<%
					} else {
				%><td class="col redtext">
					<%
						out.print(date++);
										}
									} else if (z == 7) {
					%>
				</td>
				<%
					if (date == today) {
				%>
				<td class="col bluetext wkend"><strong>
						<%
							out.print(date++);
											} else {
						%>
				</strong></td>

				<td class="col bluetext">
					<%
						out.print(date++);
										}
									} else {
					%>
				</td>
				<%
					cal.setTime(now);
				%>
				<%
					if (date == today) {
				%>
				<td class="col datetoday">
					<%
						out.print(date++);
					%>
				</td>
				<%
					} else {
				%>
				<td class="col">
					<%
						out.print(date++);
					%>
				</td>
				<%
					}
								}
							} else if (x == 4) {
				%>
				<td class="col">
					<%
						out.print(" ");
								} else {
					%>
				</td>

				<%
					}
						}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	
</body>
</html>