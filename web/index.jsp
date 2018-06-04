<%-- 
    Document   : index
    Created on : 26 Nov, 2017, 11:41:50 AM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="style.css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    
    
    <body>        
     <div class="index">  
         <br/><br/><br/>
        <div class="card">
            <marquee><h1>ONLINE QUIZ </h1></marquee>
            <div class="content">
                <form action="login.jsp">
                    <center><h2>LOGIN</h2></center>
                    <br><br>
                  <center>USERNAME <input type="text" name="t1"></center>
                  <br>
                  <br>   
                  <center>PASSWORD <input type="password" name="t2"></center>
                  <br>
                  <center><input type="submit" value="LOGIN"> </center>
                </form> 
            </div>
            <div>
                <br/><br/>
                <center><h2><a href="register.html">REGISTER</a></h2></center>
            </div>
           <%
        if(request.getAttribute("Error")!=null)
        {
          out.print("<center><font size='5' color='red' m>");
	  out.print(request.getAttribute("Error"));
          out.print("</font></center>"); 
        }
        if(request.getAttribute("notlogin_msg")!=null)
        {
          out.print("<center><font size='5' color='red' m>");
	  out.print(request.getAttribute("notlogin_msg"));
          out.print("</font></center>");         
        }
        %>
        </div>
     </div>  
    </body>
</html>
