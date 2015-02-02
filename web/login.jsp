<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/Style.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>SignIn</title>
    </head>
    <body>
        <div>
            <h3 id="register_page_title">Sign in to continue</h3>
        </div>
        <div id="register_page">
            <div id="register_page_contents">
                <form action="SignIn.jsp" action="POST">
                    <div>
                        <label for="name">Username:</label>
                        <input class="input_style" type="text" name="username" />
                    </div>
                    <br/>
                    <div>

                        <label for="pswd1">Password:</label>
                        <input class="input_style" type="password" name="pass"/>
                    </div>

                    <br/><br/>
                    <div id="button_content">
                        <div class="button">
                            <button class="register_button" name="login" type="submit">Sign in</button>
                        </div>                        
                    </div> 
                </form>
            </div>
        </div>
    </body>
</html>
