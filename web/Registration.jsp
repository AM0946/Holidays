<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>


<sql:setDataSource var="hol" dataSource="jdbc/holidays"/>

<% String name = request.getParameter("name");
   String username = request.getParameter("username");
   String email = request.getParameter("mail");
   String pass = request.getParameter("pwd");
   String avatar = request.getParameter("radio");
   
   String passfinal = pass + "merenda_light";
   MessageDigest md = MessageDigest.getInstance("MD5");
   byte[] digest = md.digest(passfinal.getBytes());
   StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    passfinal = Integer.toHexString(0xFF & digest[i]);

    if (passfinal.length() < 2) {
        passfinal = "0" + passfinal;
    }

    hexString.append(passfinal);
}
    
   String pass_salt = hexString.toString();
   
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
   Statement state = con.createStatement();

   if(username.length() == 0 || username.length() > 20 ){
       response.sendRedirect("Register.jsp?error=Username should not be empty and more that 20 characters");  
       return;
   }
   
   else{
      ResultSet r = state.executeQuery("select id from users where username='" + username +"';");
      if(r.next()){
        response.sendRedirect("Register.jsp?error=Username exists already");  
        return;
      }
   }
   
    if(name.length() == 0 || name.length() > 30 ){
       response.sendRedirect("Register.jsp?error=Name should not be empty and more that 30 characters"); 
       return;
   }
   
    if(pass.length() == 0 || pass.length() > 40 ){
       response.sendRedirect("Register.jsp?error=Passord should not be empty and more that 40 characters");  
       return;
   }
  
    if(email.length() == 0 || email.length() > 30 ){
       response.sendRedirect("Register.jsp?error=Email should not be empty and more that 30 characters"); 
       return;
   }
    
    else{
      ResultSet r = state.executeQuery("select id from users where mail='" + email +"';");
      if(r.next()){
        response.sendRedirect("Register.jsp?error=E-mail exists already");  
        return;
      }
    }
    
    int i = state.executeUpdate("insert into users(name, username, mail, password, avatar) values ('" + name + "','" + username + "','" + email + "','" + pass_salt + "','" + avatar + "')");
    if (i > 0) {
        response.sendRedirect("index.jsp");
        return;
    }
    else {
        response.sendRedirect("Register.jsp?error=Registration is not completed");
        return;
    } 
   
   



%>