<%@ page import="java.sql.*" %>

<%! static int count1=0; %>
<%! static int total=0; %>

<%

String ans=" ";    
Connection conn = null;
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String db = "online_quiz";
String user = "root";
String pass = "";
    
    
    
if(session.getAttribute("count")!=null){
//String name=(String)session.getAttribute("quizname");
ans= (String)session.getAttribute("answer");
Integer count=(Integer)session.getAttribute("count");

try
{ 
Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);
if(count1==0)
{
count1=count-1;
PreparedStatement ps=conn.prepareStatement("select correctAns from questions where id='"+count1+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next()){
String ans1=rs.getString(1);
System.out.println("ans1 on c10="+ans1);
System.out.println("ans on get1="+ans);
if(ans1.equals(ans)){
total=total+1;
System.out.println("total="+total);
}

}

conn.close();
}



else{
//count1=count-2;
count1=count-1;
System.out.print("count at get1:"+count);

Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);
PreparedStatement ps=conn.prepareStatement("select correctAns from questions where id='"+count1+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next()){
String ans1=rs.getString(1);
System.out.println("ans1="+ans1);
System.out.println("ans on get1="+ans);
if(ans1.equals(ans)){
total=total+1;
System.out.println("total="+total);
}

}
conn.close();
}

if(count>(Integer)session.getAttribute("max"))
{
Integer max=(Integer)session.getAttribute("max");
Class.forName(driver);
conn = DriverManager.getConnection(url+db,user,pass);
PreparedStatement ps=conn.prepareStatement("select correctAns from questions where id='"+max+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next()){
String ans1=rs.getString(1);
System.out.println("ans1 on c1="+ans1);
String ans2=(String) session.getAttribute("ans");
System.out.println("ans on get1="+ans2);
if(ans1.equals(ans2)){
total=total+1;
System.out.println("total="+total);
}

}

conn.close();
request.setAttribute("total",total);
total=0;

%>
<jsp:forward page="result.jsp"></jsp:forward>
<% 

 
}

}catch(Exception e){e.printStackTrace();}

}
%>
 <jsp:forward page="quizeApplication.jsp"></jsp:forward>
