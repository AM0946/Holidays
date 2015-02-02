<%@ page import ="java.sql.*" %>

<%
  int house_id = Integer.parseInt(request.getParameter("house_id")); 
    
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
   Statement state = con.createStatement();
   
   state.executeUpdate("delete from houses where id='" + house_id + "'");
   state.executeUpdate("delete from house_images where house_id='" + house_id + "'");
   response.sendRedirect("index.jsp");
%>    