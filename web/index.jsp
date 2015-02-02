<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:setDataSource var="hol" dataSource="jdbc/holidays"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>Holidays</title>
    </head>
    <% 
           String description = request.getParameter("info"); 

           Class.forName("com.mysql.jdbc.Driver");

           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
           Statement state = con.createStatement();
           Statement state1 = con.createStatement();
           Statement state2 = con.createStatement();
           Statement state3 = con.createStatement();

           ResultSet search_query;
           search_query = state.executeQuery("select * from houses");

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
                
           List<Integer> Ids = new ArrayList<Integer>();
           List<String> Images = new ArrayList<String>();
           List<String> Descriptions = new ArrayList<String>();
                
           ResultSet rate_query;
           rate_query = state2.executeQuery("select house_id,avg(rate), houses.info from rate join houses on house_id=houses.id group by house_id order by avg(rate) desc");
           while(rate_query.next()){
                Descriptions.add(rate_query.getString("info")); 
                int id = rate_query.getInt("house_id");
                Ids.add(id);
                ResultSet image1_query;
                image1_query = state3.executeQuery("select * from house_images where house_id='" + id + "'");
                if(image1_query.next()){
                    Images.add(image1_query.getString("image"));
                }
           }
          
           
                
    %>   
    <body>
        <div id="div_input">
            <a href="AdvancedSearch.jsp"><button  type="button" class="stylebutton" style="width:160px; margin-left: 30px;">Advanced Search</button></a>
        </div>
        
        <div id="register">
            <%
               if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
            %>
            <a href="Register.jsp"><button action  type="button" class="stylebutton">Register</button></a>
            <a href="login.jsp"><button type="button" class="stylebutton">Sign in</button></a>
            <%
               } else{
            %>
            <a href="SignOut.jsp"><button action  type="button" class="stylebutton">
            <%
               out.print(session.getAttribute("username"));
            %>
            ,sign out
                </button></a>
            <a href="AddHouse.jsp"><button type="button" class="stylebutton">Add House</button></a>
            <%
               }
            %>
            
        </div>

       
        <div id="header">
            <img src="Images/logo.png"/>
        </div>
        <div id="houseimage">

        </div>
        <div id="main_div">
            <div id="main_div_right">
                <h2 class="maintitle">Popular</h2>
                <div class="main_padding">
                    <% for(int i=0; i< Ids.size(); i++ ) { %>
                    <div class="items">
                        <div class="div_item_image">
                        <img class="item_image" src="UploadedImages/<% out.print(Images.get(i)); %>">
                        </div>
                        <div class="item_description">
                            <a href="HousePage.jsp?id=<% out.print(Ids.get(i)); %>" style="text-decoration: none; color:#707070; font-size:15px;"> <div><% if(Descriptions.get(i).length() > 220) { out.print(Descriptions.get(i).substring(0, 220)+ "..."); } else { out.print(Descriptions.get(i)); } %> </div> </a>
                        </div>
                    </div>
                    <div id="border">
                        
                    </div><% } %>
                    
                </div>
            </div>
            <div id="main_div_left">
                <h2 class="maintitle">Available</h2>
               <div class="main_padding">
                <% for(int i=0; i< ids.size(); i++ ) { %>
                     <div class="items">
                         <div class="div_item_image">
                              <img class="item_image" src="UploadedImages/<% out.print(images.get(i)); %>">
                          </div>
                          <div class="item_description">
                              <a href="HousePage.jsp?id=<% out.print(ids.get(i)); %>" style="text-decoration: none; color:#707070; font-size:15px;"> <div><% if(descriptions.get(i).length() > 220) { out.print(descriptions.get(i).substring(0, 220)+ "..."); } else { out.print(descriptions.get(i)); } %> </div> </a>
                          </div>
                      </div>
                      <div id="border">

                      </div> <% } %>
               </div>
            </div>
        </div>
    </body>
</html>
