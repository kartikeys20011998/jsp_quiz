<%-- 
    Document   : teachres
    Created on : 26 Nov, 2017, 10:38:44 PM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW RESULT</title>
         <style>
         body
         {
             margin:0 auto;
             background-color: black;
         }
         h1
         {
             margin:0 auto;
             color: #33ff00;
         }
            table
         {
             margin:0 auto;
             height:200px;
             width:600px;
         }
         tbody
         {     margin:0 auto;
             
         }
         
         thead{ 
             
             margin:0 auto;}
            
         td
         {
             height: 18px;
             
          border:4px solid AQUA ;
          color: #ff9900;
         }
         th
         {
                  margin:0 auto;
          border:4px solid AQUA ;
          color: #ff9900;
         }
        .res
        {
                 margin:0 auto;
        }
        form
        {
            padding-left:1200px;
        }
         </style>
        
    </head>
    <%@page import="java.sql.*" %>
    <body>
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
Connection conn = null;
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String db = "online_quiz";
String user = "root";
String pass = "";
Statement st = null;
ResultSet rs = null;


try{

Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);
String qry="select * from result";
PreparedStatement stmt=conn.prepareStatement(qry);
rs=stmt.executeQuery();
%>
<div class="res">
    
    <center><h1> RESULTS </h1></center>
    <form action="teacher.jsp">
        <input type="submit" value="HOME">
    </form>   
    <center>
         <table>
            <thead>
             <tr>
                 <th>NAME </th>
                 <th>Marks</th>    
             </tr>    
            </thead>
    <%
                while(rs.next())
{   
          out.println("<tbody>");
          out.println("<tr>");
          out.println("<td>"+rs.getString(2)+"</td>");   
          out.println("<td>"+rs.getString(3)+"</td>");     
          out.println("</tr>");
          out.println("</tbody>");
          //out.println("<br><br>");
          
}%>
 
   </table>    </center>
</div>

<%
}
catch(Exception e)
{
    System.out.println("EXCEPTION OCCURRED : "+e);
}
finally
{
conn.close();


}

%>

</body>   

</html>
