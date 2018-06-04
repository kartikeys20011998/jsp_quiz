<%-- 
    Document   : result
    Created on : 26 Nov, 2017, 2:29:28 PM
    Author     : Kartikey
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");

%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>

<%
  int score =(int)request.getAttribute("total");
  %>
  <div><font style="color: navy;"><B>Your <%= score%> questions are correct</B></font><BR/> </div>
<%  
Connection conn = null;
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String db = "online_quiz";
String user = "root";
String pass = "";
Statement st = null;
ResultSet rs = null;
String stdname=(String)session.getAttribute("uname");

try
{
    
Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);
String qry = "insert into result(stdname,marks) values('"+stdname+"','"+score+"')";
st=conn.createStatement();
int val = st.executeUpdate(qry);

if(val>0)
{
 System.out.println("RESULT UPDATED ");  
%>
<% 
}
}
catch(Exception e)
{
 out.println("EXCEPTION OCCURRED "+e);        
}   
%>    
<jsp:forward page="student.jsp"></jsp:forward>
