<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String pwd2 = request.getParameter("password");
    String email2 = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    
    
   try{
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root", "hafsa#");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into Customer(id,fname,lname,email,password)values(null,'"+fname+"','"+lname+"','"+email2+"','"+pwd2+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("Success.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("SignIn.jsp");
    }
    
   }catch (Exception e)
   {
       %>
       <script>
    alert("Account Already Exist With the Same Email!!.");
     window.location.href = "SignIn.jsp";
</script>
   <%    
       
   }
%>
    </body>
</html>