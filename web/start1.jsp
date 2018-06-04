<%-- 
    Document   : start1
    Created on : 26 Nov, 2017, 1:29:01 PM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>
    <body>
        <body bgcolor="LIGHTGREEN">  
            <form action="student.jsp">
                <input type="submit" value="HOME"> 
            </form>
           
<center>   
<table   border="1" width="500px" bgcolor="blue" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
<h2 align="center"><font color="yellow">Online Quiz Application</font></h2>
<b>Select Correct Answer</b>


<center>
<form name="form1" action="ans_check.jsp">
        <table border="0" width="600px" cellspacing="2" cellpadding="4">

<% 
		String question=(String)session.getAttribute("question");
		String option1= (String)session.getAttribute("option1");
		String option2= (String)session.getAttribute("option2");
		String option3= (String)session.getAttribute("option3");
		String option4= (String)session.getAttribute("option4");
                String ans =(String)session.getAttribute("answer");
//		out.print(question);
 %>

 <tr>

<td width="50%">Question:</td>
<input type="hidden" name="correctAns" value="<%=ans%>" />
<tr>
<td><%= question %></td></tr>
<tr>
<td>

1: <input type="radio" name="a" value= "QA" /></td>
    <td><%= option1 %></td></tr> 
<tr>
<td>
2: <input type="radio" name="a" value="QB" /></td>
<td><%= option2 %></td></tr>

<tr>
<td>
3: <input type="radio" name="a" value="QC" /></td>
<td><%= option3 %> </td></tr>

<tr>
<td>
4: <input type="radio" name="a" value="QD" /> </td>
<td> <%= option4 %> </td></tr>

<tr>
<td>
<center>
   <input type="submit" value="Submit" name="submit" id="sub"></center></td></tr>
</table>

</form>
</center>
  
 </td>
  </tr>
</table>
</center>
    </body>
</html>
