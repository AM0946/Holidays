<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/AddHouse.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,300' rel='stylesheet' type='text/css'>
        <title>Images</title>
        <script>
            function previewFile(){
                var preview = document.querySelector('#preview_img'); //selects the query named img
                var file    = document.querySelector('.file').files[0]; //sames as here
                var reader  = new FileReader();

                reader.onloadend = function () {
                    preview.src = reader.result;
                    convertImgToBase64();
                }

                if (file) {
                    reader.readAsDataURL(file); //reads the data as a URL
                } else {
                    preview.src = "";
                }
           }
          /* 
           function convertImgToBase64(){
                var canvas = document.createElement('CANVAS'),
                    ctx = canvas.getContext('2d'),
                    img = document.querySelector('#preview_img');
            
                    img.crossOrigin = 'Anonymous';
                
                    var dataURL;
                    canvas.height = img.clientHeight;
                    canvas.width = img.clientWidth;
                    ctx.drawImage(img, 0, 0, img.clientWidth, img.clientHeight);
                    dataURL = canvas.toDataURL("image/png");
                    canvas = null; 
                    document.querySelector('#base64').value = dataURL;
                    
               
            }
            */
        </script>
    </head>
    <body>
        <h2 id="addhouse_page_title">Upload photos of your house</h2>
        <div id="addhouse_page">
            <div id="addhouse_page_contents">
                <form action="Upload.jsp" method="POST" enctype="multipart/form-data">
                     <label class="text_label">Select Photos: </label>
                     <input onchange="previewFile()" class="file" type="file" name="file" />  
                   
                     <br/><br/>
                     <label class="text_label">Preview: </label> 
                     <img id="preview_img"/>
                     <textarea style="display: none;" id="base64" type="text" name="encoded_img"></textarea>
                      <br/><br/>
                   
            
                      <div id="button_content">
                            <div class="button">
                              <button class="rate_button" type="submit" >Add House</button>
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
