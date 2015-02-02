<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/HousePage.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>House</title>
    </head>
    <%
       int house_id = Integer.parseInt(request.getParameter("id")); 
       Class.forName("com.mysql.jdbc.Driver");
   
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
        Statement state = con.createStatement();
        Statement state1 = con.createStatement();
        Statement state2 = con.createStatement();
        Statement state3 = con.createStatement();
        
        

        ResultSet house_query;
        house_query = state.executeQuery("select * from houses where id='" + house_id + "'");
        
        String capacity;
        String description;
        String city;
        String country;
        int user_id;
        if(house_query.next()){
            capacity = house_query.getString("type");
            description = house_query.getString("info");
            country = house_query.getString("country");
            city = house_query.getString("city");
            user_id = house_query.getInt("user_id");
        }
        else{
            response.sendRedirect("AddHouse.jsp?error=You are not logged in.");
            return;
        }
        
        ResultSet contact_query;
        contact_query = state3.executeQuery("select * from users where id='" + user_id + "'");
        String mail = "";
        if(contact_query.next()){
            mail = contact_query.getString("mail");
        }
        
        
        ResultSet image_query;
        image_query = state.executeQuery("select * from house_images where house_id='" + house_id + "'");
        
        List<String> image = new ArrayList<String>();
        while(image_query.next()){
            image.add(image_query.getString("image"));
        }
        
        ResultSet comment_query;
        comment_query = state.executeQuery("select * from rate where house_id='" + house_id + "'");
        
        int rate;
        int rate_sum = 0;
        List<String> comments = new ArrayList<String>();
        while(comment_query.next()){
            rate = comment_query.getInt("rate");
            comments.add(comment_query.getString("comment"));
            rate_sum += rate;
        }
        
        int rate_average;
        
        if(comments.size() >0){
            rate_average = rate_sum/comments.size();
        }
        else
            rate_average = 0;
        
        List<Integer> Ids = new ArrayList<Integer>();
        List<String> Images = new ArrayList<String>();
        List<String> Descriptions = new ArrayList<String>();
        
        ResultSet similar_query;
        similar_query = state1.executeQuery("select * from houses where country like '" + country + "'");
        while(similar_query.next()){
            Descriptions.add(similar_query.getString("info")); 
            int id = similar_query.getInt("id");
            Ids.add(id);
            ResultSet image1_query;
            image1_query = state2.executeQuery("select * from house_images where house_id='" + id + "'");
            if(image1_query.next()){
                Images.add(image1_query.getString("image"));
            }
        }
        
        
       
     %>
    <body>
        <div id="house_header">
            <a href="index.jsp"><button type="button" class="stylebutton" style="width:150px; font-size: 15px; margin-left: 40px;"><img src="icons/home.png"/> Return to Home</button></a>
            <div id="housepage_buttons">
                <% if(session.getAttribute("username") != null && user_id == Integer.parseInt(session.getAttribute("user_id").toString()))
                { %>
                <a href="MoreImages.jsp?house_id=<% out.print(house_id); %>"><button type="button" class="stylebutton" style="width:200px;">Add Images</button></a>
                <a href="DeleteHouse.jsp?house_id=<% out.print(house_id); %>"><button type="button" class="stylebutton">Delete</button></a>
                
                
                <% } else { %>
                <a href="Rate.jsp?id=<% out.print(house_id); %>"><button type="button" class="stylebutton">Rate</button></a>
                <a href="mailto:<% out.print(mail); %>" ><button type="button" class="stylebutton">Book</button></a>
               
                <% } %>
            </div>
        </div>
        <div id="main_housepage">          
            <div id="main_housepage_left">
                <div id="left_contents">
                    <div id="content_photo">
                        <img src="UploadedImages/<% out.print(image.get(0)); %>"/>
                         <div id="more_photos">
                             <% if(image.size() >= 1) {
                                 for(Iterator<String> i = image.iterator(); i.hasNext(); ) {
                                    String item = i.next(); %>
                                    <a href="UploadedImages/<% out.print(item); %>" target="_blank"><img src="UploadedImages/<% out.print(item); %>"/></a>
                                <% }} %>     
                         </div>
                    </div>
                </div>
            </div>
            
            <div id="main_housepage_right">
                <div id="right_contents">
                    <h2 id="house_title"><% out.print(capacity + " , " + city + " , " + country); %></h2>
                    <div id="rating_stars">
                        <% for(int i=1; i<= 5; i++ )
                        {
                            if(rate_average>=i)
                            {
                        %>
                        <div id="active_stars"> 
                            &#9733 
                        </div>
                        <% }  else {%>
                        <div id="inactive_stars"> 
                            &#9733
                        </div>
                     <%   } 
                        }%>
                    </div>
                    <div id="house_description">
                        <% out.print(description); %>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div id="main_housepage">          
            <div id="main_housepage_left">
                <div id="similar_left">
                    <h3 style="text-align: center;">Similar</h3>
                    <div id="rating">
                        <% for(int i=0; i< Ids.size(); i++ ) { %>
                        <div class="comments">
                            
                            <div class="div_user_image">
                                <img src="UploadedImages/<% out.print(Images.get(i)); %>"/>
                            </div>
                             <div class="similar_description">
                               <a href="HousePage.jsp?id=<% out.print(Ids.get(i)); %>" style="text-decoration: none; color:#707070; font-size:15px;"> <div><% if(Descriptions.get(i).length() > 120) { out.print(Descriptions.get(i).substring(0, 120)+ "..."); } else { out.print(Descriptions.get(i)); } %> </div> </a>
                            </div>
                        </div>
                        <div id="border">

                        </div> <% } %>
                    </div>
                </div>
            </div>
            
            <div id="main_housepage_right">
                <div id="comments_right">
                    <h3 style="text-align: center;">Comments</h3>
                    <div id="rating">
                        <% for(Iterator<String> i = comments.iterator(); i.hasNext(); ) {
                            String item = i.next();
                         %>               
                        <div class="comments">
                             <div class="comment_description">
                                 <div> <% out.print(item); %> </div>
                            </div>
                        </div>
                        <div id="border">

                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
