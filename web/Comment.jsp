<%@ page import ="java.sql.*" %>

<%
   int rate = Integer.parseInt(request.getParameter("radio"));
   String comment = request.getParameter("comment");
    
   int house_id = Integer.parseInt(request.getParameter("id")); 
    
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
   Statement state = con.createStatement();
   
   int i = state.executeUpdate("insert into rate(house_id, rate, comment) values ('" + house_id + "','" + rate + "','" + comment + "')");
    if (i > 0) {
        response.sendRedirect("HousePage.jsp?id=" + house_id);
        return;
    }
    else {
        response.sendRedirect("AddHouse.jsp?error=Rating failed.");
    } 
%>    