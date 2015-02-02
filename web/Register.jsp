<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/Style.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>Register</title>
    </head>
    <body>
        <div>
            <h3 id="register_page_title">Complete the form below to become a member</h3>
        </div>
        <div id="register_page">
            <div id="register_page_contents">
                <form action="Registration.jsp" method="POST">
                    <% if(request.getParameter("error") != null){
                        out.print("error:" + request.getParameter("error"));
                    }
                    %>
                    <div>
                        <label for="name">Name:</label>
                        <input class="input_style" type="text" name="name" />
                    </div>
                    <br/>
                    <div>
                        <label for="name">Username:</label>
                        <input class="input_style" type="text" name="username" />
                    </div>
                    <br/>
                    <div>
                        <label for="mail">E-mail:</label>
                        <input class="input_style" type="email" name="mail" />
                    </div>
                    <br/>
                    <div>
                        <label for="pswd1">Password:</label>
                        <input class="input_style" type="password" name="pwd"/>
                    </div>
                    <br/>
                   
                    <div>
                        <label for"avatar">Choose Avatar: </label>
                        <div class="input_style_avatar">
                            <input checked id="image1" class="radio_avatar" type="radio" name="radio" value="option1"/>
                            <label for="image1" class="label_avatar">
                            <img src="avatars/avatar1.jpg"/>
                            </label>

                            <input  id="image2" class="radio_avatar" type="radio" name="radio" value="option2"/>
                            <label for="image2" class="label_avatar">
                            <img src="avatars/avatar2.jpg"/>
                            </label>

                            <input  id="image3" class="radio_avatar" type="radio" name="radio" value="option3"/>
                            <label for="image3" class="label_avatar">
                            <img src="avatars/avatar3.jpg"/>
                            </label>

                            <input  id="image4" class="radio_avatar" type="radio" name="radio" value="option4"/>
                            <label for="image4" class="label_avatar">
                            <img src="avatars/avatar4.jpg"/>
                            </label>

                            <br/>

                            <input  id="image5" class="radio_avatar" type="radio" name="radio" value="option5"/>
                            <label for="image5" class="label_avatar">
                            <img src="avatars/avatar5.jpg"/>
                            </label>

                            <input  id="image6" class="radio_avatar" type="radio" name="radio" value="option6"/>
                            <label for="image6" class="label_avatar">
                            <img src="avatars/avatar6.jpg"/>
                            </label>

                            <input  id="image7" class="radio_avatar" type="radio" name="radio" value="option7"/>
                            <label for="image7" class="label_avatar">
                            <img src="avatars/avatar7.jpg"/>
                            </label>

                            <input  id="image8" class="radio_avatar" type="radio" name="radio" value="option8"/>
                            <label for="image8" class="label_avatar">
                            <img src="avatars/avatar8.jpg"/>
                            </label>
                        </div>
                    </div>
                    <br/><br/>
                    <div id="button_content">
                        <div class="button">
                            <button class="register_button" type="submit">Register</button>
                        </div>                        
                    </div>
                </form>
                
                <br/><br/>
                <div >
                   <a href="index.jsp" class="menu_button_home">Return to Home</a>
                </div>
        
                
            </div>
        </div>
    </body>
</html>
