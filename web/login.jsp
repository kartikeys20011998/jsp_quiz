<%-- 
    Document   : login
    Created on : 16 Nov, 2017, 6:41:31 PM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page language="java" import="java.sql.*" %>
        <%@ page errorPage="ask.jsp" %>
        
   <% 
       Connection con=null;
       try
       {
       String name=request.getParameter("t1");
       String pwd = request.getParameter("t2");
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_quiz","root","");
       PreparedStatement stmt=con.prepareStatement("select uname,pwd,type from login where uname=?and pwd=?;");
        stmt.setString(1,name);
        stmt.setString(2,pwd);
       ResultSet rs=stmt.executeQuery();
       boolean status=rs.next();
       if(status)
        {   
            session.setAttribute("uname",name);
            session.setAttribute("type",rs.getString(3));
            session.setAttribute("islogin","plz sign in first");
            if(rs.getString(3).equals("teacher"))
            {
                System.out.println("WELCOME TEACHER");
            %>    
            <jsp:forward page="teacher.jsp"></jsp:forward>
            <%
              }  
            else
            { 
              System.out.println("WELCOME STUDENT");
            %>    
            <jsp:forward page="student.jsp"></jsp:forward>   
            <%
             }   
        }
       else
        {
         System.out.println("LOGIN FAILED");
         out.println("<center><style text-color:aqua><h1>Username/Password not correct.<h1><style></center>");
         request.setAttribute("Error","Sorry Username/Password not correct");
         %>
         <jsp:forward page="index.jsp"></jsp:forward>
         <%
        }
       }
       catch(Exception e)
       {
        System.out.println("Login EXCEPTION OCCURRED : "+e);
       }
       finally
       {
           con.close();
       }
      %>    
    </body>
</html>
