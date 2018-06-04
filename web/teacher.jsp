<%-- 
    Document   : teacher
    Created on : 19 Nov, 2017, 6:06:47 AM
    Author     : Kartikey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEACHER Page</title>
     <!--  <link href="style.css"  rel="stylesheet" /> -->
        <style>
            body
            {
                margin:0 auto;
                background-image: url("/ONLINE_QUIZ/images/pencil.png") ;
            }
            
            
.teacher 
{
    width: 700px;
    height: 500px;
    margin: 0 auto;
    background-color: yellow;
    border-radius: 20%;
    opacity:0.87;
 }

h1
{
 margin: 0 auto;   
 color : GREEN;
 text-align: center;
 background-color: gold;
}
.teacheroptions
{
    text-align: center;
    height:600px;
    margin: 0 auto;
}
.teacher .teacheroptions .op
{
    margin: 0 auto;
    text-align:center;
    float:left;
    height:100px;
    background-color: #0066cc;
    width:50%; 
    border-radius:50%;
}
.fix
{ 
    margin: 0 auto;
 clear:both;
}

.teacher .teacheroptions .op2
{
    margin:0 auto;
    text-align:center;
    background-color: #33ff00;
    color: RED;
    float:left;
    height:120px;
    width:50%;
    border-radius: 50%;
} 
.teacheroptions blank
{
    margin: 0 auto;
    width:400px;
    height:1000px;
}

            
        </style>
    </head> 
   
    <body>
    <center> <h1>WELCOME QUIZMASTER</h1> </center>  
    <br><br>
          <div class="teacher">
            <div class="teacheroptions">
                <br><br>
                <div>
                    <div class="op">
                        <br><br>
                        <form action="preparequiz.html">
                            <input type="submit" value="PREPARE QUIZ">
                        </form>
                    </div>
                    
                    <div class="op">
                        <br><br>
                        <form action="teachres.jsp">
                            <input type="submit" value="SEE RESULTS">
                        </form>
                    </div>
                    
                    <div class="fix">
                        
                    </div>
               
                </div>   
                <div class="blank">
                    
                </div>
                <br/><br/><br/><br/><br/><br/>
                <div>
                <div class="op2">
                 <br/><br/><br/>
                    <form action="questions.jsp">
                         <input type="submit" value="SEE QUESTIONS"> 
                    </form>
                </div>
                
                <div class="op2">
                 <br/><br/><br/>
                    <form action="logout.jsp">
                         <input type="submit" value="LOGOUT"> 
                    </form>
                </div>
                <div class="fix">
                        
                </div>
               
            </div> 
            </div>
            
          </div>
    </body>
</html>
