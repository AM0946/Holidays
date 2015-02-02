<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>

<%
   String capacity = request.getParameter("bedroom");
   String country = request.getParameter("country");
   String from = request.getParameter("from");
   String to = request.getParameter("to"); 
   String description = request.getParameter("info"); 
   
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
   Statement state = con.createStatement();
   Statement state1 = con.createStatement();
   
   ResultSet search_query;
   search_query = state.executeQuery("select * from houses where type='" + capacity + "' and country='" + country + "' and start_date<='" + from + "' and end_date>='" + to + "'" );
   
   List<Integer> ids = new ArrayList<Integer>();
   List<String> images = new ArrayList<String>();
   List<String> descriptions = new ArrayList<String>();
   
        while(search_query.next()){
            descriptions.add(search_query.getString("info")); 
            int id = search_query.getInt("id");
            ids.add(id);
            ResultSet image_query;
            image_query = state1.executeQuery("select * from house_images where house_id='" + id + "'");
            if(image_query.next()){
                images.add(image_query.getString("image"));
            }
        
        }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/Search.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>Advanced Search</title>
    </head>
    <body>
        
        <h2 id="addhouse_page_title">Search results</h2>
        
        <div id="addhouse_page">
               <div class="main_padding">
                   <% for(int i=0; i< ids.size(); i++ ) { %>
               <div class="items">
                   <div class="div_item_image">
                        <img class="item_image" src="UploadedImages/<% out.print(images.get(i)); %>">
                    </div>
                    <div class="item_description">
                        <a href="HousePage.jsp?id=<% out.print(ids.get(i)); %>" style="text-decoration: none; color:#707070; font-size:15px;"> <div><% out.print(descriptions.get(i)); %> </div> </a>
                    </div>
                </div>
                <div id="border">

                </div><% } %>
               </div> 
               
            </div>
   
                
    </body>
</html>