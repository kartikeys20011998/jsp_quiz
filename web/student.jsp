<%-- 
    Document   : student
    Created on : 26 Nov, 2017, 12:21:46 PM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STUDENT PAGE</title>
             <style>
           body
           {
               margin:0;
               padding:0;
               background-image: url("/ONLINE_QUIZ/images/student.jpg");
            
           }
          form
          {
              margin:0 auto;
              height:50%;
              
          }
          input
          {
              margin:0 auto;
              width: 80%;
              height:100px;
              border-radius: 30%;
              
              background-color: chartreuse;
              font-size: 24px;
              font-family: cursive;
              
          }
          h1
          {
              height:80px;
              margin:0 auto; 
              background-color: #ff9900;    
              text-align: center;
          }
          .inner
          {
              margin: 0 auto;
              background-color: #99ffcc;
             width:500px;
             height:500px;
             border-radius:20%;
             opacity:0.9;
          }
          
        </style>
   
    </head>
    
     <body>

        <div class="student">
            
            <h1>WELCOME STUDENT </h1>
            <br>
            <div class="inner">
                <center><br><br>
             <div class="first">
                 <form action="quizeApplication.jsp">
                    <input type="submit" value="TAKE QUIZ">
                </form>     
             </div>
                <br><br><br>
             <div class="second">
                <form action="studres.jsp">
                    <input type="submit" value="VIEW RESULTS">     
                </form>
             </div>
                <br><br><br>
             <div>
                <form action="logout.jsp">
                    <input type="submit" value="LOGOUT">
                </form>
             </div>  
               </center>
            </div>    
         </div>
        
</body>
</html>
