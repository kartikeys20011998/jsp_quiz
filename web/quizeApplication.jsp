<%-- 
    Document   : quizeApplication
    Created on : 19 Nov, 2017, 3:01:55 PM
    Author     : Kartikey


<body>  
<br>
<br/>
<center>
<table border="1" width="500px" bgcolor="pink" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">

<form name="form1">

 <h2 align="center"><font color="red">Online Quiz Application</font></h2>

<b>Select Correct Answer</b>
        <table border="0" width="500px" cellspacing="2" cellpadding="4">
 <tr>

<td width="50%"> Question:</td>
<input type="hidden" name="correctAns" value="<%=ans%>" />
<tr>
<td><%= rs.getString("quest") %></td></tr>
<tr>
<td>

1: <input type="radio" name="a" value= "QA" /></td>
    <td><%= rs.getString("QA") %></td></tr> 
<tr>
<td>
2: <input type="radio" name="a" value="QB" /></td>
<td><%= rs.getString("QB") %></td></tr>

<tr>
<td>
3: <input type="radio" name="a" value="QC" /></td>
<td><%= rs.getString("QC") %> </td></tr>

<tr>
<td>
4: <input type="radio" name="a" value="QD" /> </td>
<td> <%= rs.getString("QD") %> </td></tr>

<tr>
<td>
<center>
   <input type="submit" value="Submit" name="submit"></center></td></tr>
</table>

</form>
 </td>
  </tr>
</table>
</center>
</body> 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUESTION ENTERING PAGE</title>
    </head>
         <%@ page import="java.sql.*" %>
        
    <!--
        <script type="text/javascript">
        document.body.innerHTML = "";
        </script>
    -->
<body>
<%! static int count=0; %>
<%! static int count1=0; %>
    
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
    
String ans=" ";
Connection conn = null;
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String db = "online_quiz";
String user = "root";
String pass = "";
Statement st = null;
ResultSet rs = null;


//String id=request.getParameter("id");
//System.out.println("id:"+id);

int i=1;

String s,g;
try{

Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);

if(count==0){
    
PreparedStatement ps1= conn.prepareStatement("select min(id) from questions ");
PreparedStatement ps2= conn.prepareStatement("select max(id) from questions ");
ResultSet rs1= ps1.executeQuery();
ResultSet rs2=ps2.executeQuery();

if(rs2.next()){
count1=rs2.getInt(1);
session.setAttribute("max",count1);
}
if(rs1.next()){
count=rs1.getInt(1);
session.setAttribute("min",count);

}
}

if(count>0){
PreparedStatement ps=conn.prepareStatement("select * from questions where id='"+count+"' ");
rs=ps.executeQuery();
while(rs.next()){
String question=rs.getString(2);
String option1= rs.getString(3);
String option2= rs.getString(4);
String option3= rs.getString(5);
String option4= rs.getString(6);
ans=rs.getString(7);
session.setAttribute("question",question);
session.setAttribute("option1",option1);
session.setAttribute("option2",option2);
session.setAttribute("option3",option3);
session.setAttribute("option4",option4);
session.setAttribute("answer",ans);
}
}


System.out.print(count);
count++;
session.setAttribute("count",count);
if(count>(Integer)session.getAttribute("max")){
count=0;
session.setAttribute("ans",null);
}
}
catch(Exception ex) {
System.out.println("QUESTION NOT RECIEVED,EXCEPTION OCCURRED"+ex);
}

finally {
if (rs != null) rs.close();
if (st != null) st.close();
if (conn != null) conn.close();
}
%>
<jsp:forward page="start1.jsp"></jsp:forward>
