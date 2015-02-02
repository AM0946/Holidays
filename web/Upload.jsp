<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.sql.*" %>
 
<%
        Class.forName("com.mysql.jdbc.Driver");
   
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
        Statement state = con.createStatement();
        
        int house_id;
        
        ResultSet house_query;
        house_query = state.executeQuery("select id from houses where user_id='" + session.getAttribute("user_id") + "' order by id desc limit 1");

        if(house_query.next()){
            house_id = house_query.getInt("id");
        }
        else{
            response.sendRedirect("AddHouse.jsp?error=You are not logged in.");
            return;
        }
        try
        {
            String ImageFile="";
            String itemName = "";
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (!isMultipart)
                {
                }
                else
                {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                        try
                         {
                            items = upload.parseRequest(request);
                         }
                        catch (FileUploadException e)
                         {
                            e.getMessage();
                         }

                    Iterator itr = items.iterator();
                    while (itr.hasNext())
                    {
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField())
                        {
                            String name = item.getFieldName();
                            String value = item.getString();
                            if(name.equals("ImageFile"))
                            {
                                ImageFile=value;
                            }

                        }
                        else
                        {
                            try
                             {
                                itemName = house_id + item.getName();
                                File savedFile = new File(config.getServletContext().getRealPath("/")+"UploadedImages\\"+itemName);
                                item.write(savedFile);
                             }
                            catch (Exception e)
                            {
                                out.println("Error"+e.getMessage());
                            }
                        }
                    }
                    try
                    {
                        state.executeUpdate("insert into house_images(house_id, image) values ('"+ house_id + "','" + itemName +"')");

                    }
                    catch(Exception el)
                    {
                        out.println("Inserting error"+el.getMessage());
                    }
                }
        }
        catch (Exception e){
            out.println(e.getMessage());
        }
        response.sendRedirect("HousePage.jsp?id=" + house_id);

    
    /*
   String image = request.getParameter("encoded_img");
   int house_id;
    
   Class.forName("com.mysql.jdbc.Driver");
   
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holidays", "administrator", "admin");
   Statement state = con.createStatement();
   
   ResultSet house_query;
   house_query = state.executeQuery("select id from houses where user_id='" + session.getAttribute("user_id") + "' order by id desc limit 1");
   
   if(house_query.next()){
       house_id = house_query.getInt("id");
   }
   else{
       response.sendRedirect("AddHouse.jsp?error=You are not logged in.");
       return;
   }
   
   int i = state.executeUpdate("insert into house_images(house_id, image) values ('" + house_id + "','" + image + "')");
    if (i > 0) {
        response.sendRedirect("HousePage.jsp?id=" + house_id);
        return;
    }
    else {
        response.sendRedirect("AddHouse.jsp?error=Your image is not added.");
    } */
    
    
    
%>    