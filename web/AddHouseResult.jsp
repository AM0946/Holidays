<%@ page import ="java.sql.*" %>

<% String capacity = request.getParameter("bedroom");
   String country = request.getParameter("country");
   String city = request.getParameter("city");
   String from = request.getParameter("from");
   String to = request.getParameter("to");
   String description = request.getParameter("description");
   int user_id = -1;
   
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
   Statement state = con.createStatement();
   
   ResultSet user_query;
   user_query = state.executeQuery("select id from users where username='" + session.getAttribute("username") + "'");
   if(user_query.next()){
       user_id = user_query.getInt("id");
   }
   else{
       response.sendRedirect("AddHouse.jsp?error=You are not logged in.");
       return;
   }
   
   int i = state.executeUpdate("insert into houses(user_id, type, country, city, start_date, end_date, info) values ('" + user_id + "','" + capacity + "','" + country + "','" + city + "','" + from + "','" + to + "','" + description + "')");
    if (i > 0) {
        response.sendRedirect("AddImages.jsp");
        return;
    }
    else {
        response.sendRedirect("AddHouse.jsp?error=Your house is not added.");
        return;
    } 
   

%>