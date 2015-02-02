<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>

<%
    String username = request.getParameter("username");
    String pass = request.getParameter("pass");
    
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
    ResultSet rs;
    rs = state.executeQuery("select * from users where username='" + username + "' and password='" + pass_salt + "'");
    if (rs.next()) {
        session.setAttribute("username", username);
        session.setAttribute("user_id", rs.getInt("id"));
        response.sendRedirect("index.jsp");
        return; 
    } 
    
    else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
    
%>