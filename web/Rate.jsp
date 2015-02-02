<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/Rate.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>Rate</title>
    </head>
    <%
        int house_id = Integer.parseInt(request.getParameter("id")); 
    %>    
    <body>
        <div>
            <h3 id="rate_page_title">Tell us your opinion</h3>
        </div>

        <div id="rate_page">
            <div id="rate_page_contents">
                <form action="Comment.jsp?id=<% out.print(house_id); %>" method="POST">
                    <div id="rate_cont">
                        <label id="rate_text">Rate:</label>
                        <div id="rating">
                        <div class="input_style_avatar">
                            <input  id="image5" class="radio_avatar" type="radio" name="radio" value="5"/>
                            <label for="image5" class="label_avatar">
                            &#9733
                            </label>
                            <input  id="image4" class="radio_avatar" type="radio" name="radio" value="4"/>
                            <label for="image4" class="label_avatar">
                            &#9733
                            </label>
                            <input  id="image3" class="radio_avatar" type="radio" name="radio" value="3"/>
                            <label for="image3" class="label_avatar">
                            &#9733
                            </label>
                            <input  id="image2" class="radio_avatar" type="radio" name="radio" value="2"/>
                            <label for="image2" class="label_avatar">
                            &#9733
                            </label>
                            <input  id="image1" class="radio_avatar" type="radio" name="radio" value="1"/>
                            <label for="image1" class="label_avatar">
                            &#9733
                            </label>
                        </div>
                     </div>
                    </div>

                    <br/>
                    <div>
                        <label for="mail">Comment:</label>
                        <textarea class="textarea_style" type="comment" name="comment"></textarea>
                    </div>
                    <br/><br/>
                    <div id="button_content">
                        <div class="button">
                            <button class="rate_button" type="submit">Rate & Comment</button>
                        </div>  
                    </div> 
                </form>
                <br/><br/>
                
                 <div >
                   <a href="index.jsp" class="menu_button_home">Return to Home</a>
                 </div>
        
                <div>
                   <a href="HousePage.jsp" class="menu_button_house">Return to House Page</a>
                 </div> 
            </div>
        </div>    
    </body>
</html>
