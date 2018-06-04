<%-- 
    Document   : register
    Created on : 23 Nov, 2017, 4:50:32 AM
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
        <%@page import="java.sql.*"%>
        
        <%
            String name=request.getParameter("uname");
            String pwd=request.getParameter("pwd");
            String type=request.getParameter("type");
            Connection con=null;
            String db="online_quiz";
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/";
            String user = "root";
            String pass = "";
            Statement stmt;
            int val;
            try
            {
                
                Class.forName(driver);
                con=DriverManager.getConnection(url+db,user,pass);
                stmt=con.createStatement();
                String query="insert into login(uname,pwd,type) values('"+name+"','"+pwd+"','"+type+"')";
                val=stmt.executeUpdate(query);
                if(val>0)
                {
                    response.sendRedirect("register.html");
                }
            }
            catch(Exception e)
            {
                out.println("EXCEPTION OCCURRED  "+e.getMessage());
                
            }
            finally
            {
                con.close();
            }
        %>
    </body>
</html>
