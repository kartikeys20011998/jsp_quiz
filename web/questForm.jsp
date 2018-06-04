<%-- 
    Document   : questForm
    Created on : 19 Nov, 2017, 2:48:49 PM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUESTION FORM</title>
    </head>
    <body>
 <%@page language="java" import="java.sql.*" %>

<%
    
if(request.getParameter("submit")!=null)
{
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "online_quiz";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String pass="";

try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,pass);

try{
Statement st = con.createStatement();
String quest = request.getParameter("quest").toString();
String QA = request.getParameter("QA").toString();
String QB = request.getParameter("QB").toString();
String QC = request.getParameter("QC").toString();
String QD = request.getParameter("QD").toString();
String correctAns = request.getParameter("correctAns").toString();
out.println("quest : " + quest);

String qry = "insert into questions(quest,QA,QB,QC,QD,correctAns) values('"+quest+"','"+QA+"','"+QB+"','"+QC+"','"+QD+"','"+correctAns+"')";

out.println("qry : " + qry);

int val = st.executeUpdate(qry);

con.close();
 if(val>0)
{
 response.sendRedirect("preparequiz.html");
    out.println("DATABASE UPDATED ");
}

}

catch(SQLException ex){
System.out.println("SQL statement not found");
}
}
catch(Exception e){
e.printStackTrace();
}
}

%>

    </body>
</html>
