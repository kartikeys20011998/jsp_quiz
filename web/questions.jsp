<%-- 
    Document   : questions
    Created on : 26 Nov, 2017, 10:55:07 PM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUESTIONS</title>
        <style>
            body
            {
                background-color: cadetblue;
            }
        </style>
    </head>
    
    <body>
        <%@ page import="java.sql.*" %>
        <%  
Connection conn = null;
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String db = "online_quiz";
String user = "root";
String pass = "";
PreparedStatement st = null;
ResultSet rs = null;

try
{
    
Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);
String qry = "select * from questions";
st=conn.prepareStatement(qry);
rs = st.executeQuery(qry);
%>
    
<center>
<table border="1" width="700px" bgcolor="yellow" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">


  <marquee><h1 align="center"><font color="red">Online Quiz QUESTIONS</font></h1></marquee>
 <table border="0" width="500px" cellspacing="2" cellpadding="4">
<%
 while(rs.next())
 {
       
 
     %>
 
<tr>
<td width="50%"> Question:</td>
 </tr>
<tr>
<td><%= rs.getString("quest") %></td></tr>
<tr>
<td>

1:<%= rs.getString("QA") %></td></tr> 
<tr>
<td>
2:<%= rs.getString("QB") %></td></tr>

<tr>
<td>
3:<%= rs.getString("QC") %> </td></tr>

<tr>
<td>
4:<%= rs.getString("QD") %> </td></tr>

<tr>
<td>
<center>
    <% 
    if(rs.getString("correctAns").equals("QA"))
    {
     out.println("ANSWER: "+rs.getString("QA"));
    }   
    else if(rs.getString("correctAns").equals("QB"))
    {
     out.println("ANSWER: "+rs.getString("QB"));
    }  
    else if(rs.getString("correctAns").equals("QC"))
                {
     out.println("ANSWER: "+rs.getString("QC"));
                }
     else
      {
     out.println("ANSWER: "+rs.getString("QD"));
      }%>
   </center></td></tr>
 <% } %>
</table>
 
 </td>
  </tr>
</table>
  <form action="teacher.jsp">
        <input type="submit" value="HOME">
    </form> 
</center>
     
  <%   
 
}
catch(Exception e)
{
 out.println("EXCEPTION OCCURRED "+e);        
}   
%>
        
    </body>
</html>
