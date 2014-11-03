<%-- 
    Document   : myUpload
    Author     : MayoristasNicas
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*, database.*, javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>


<!DOCTYPE html>
<html>
    <%
        String path = application.getRealPath("uploads");
    %>
    
    <jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
        <jsp:setProperty name="upBean" property="folderstore" value="<%= path%>" />
    </jsp:useBean>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir imagen</title>
    </head>
    <body>

        <%
            if ((session.getAttribute("productName") == null)) {
                // if email session is set, Dont show the message redirect to index
                //response.sendRedirect("/saikiranBookstoreApp/productInsertImages_2.jsp");
                //out.println("There are No product selected to insert an image for them...");
            }
        %>z

        <%
            if (MultipartFormDataRequest.isMultipartFormData(request)) {
                // Uses MultipartFormDataRequest to parse the HTTP request.
                MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
                String todo = null;
                if (mrequest != null) {
                    todo = mrequest.getParameter("todo");
                }
                if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
                    Hashtable files = mrequest.getFiles();
                    if ((files != null) && (!files.isEmpty())) {
                        UploadFile file = (UploadFile) files.get("uploadfile");

                        String fileName, fileType;
                        String result;
                        long fileSize;
                        fileName = file.getFileName();
                        fileType = file.getContentType();
                        fileSize = file.getFileSize();

                        double randomA = Math.random() * 1000000000;
                        int randA = (int) randomA;
                        file.setFileName(randA + fileName);
                        fileName = file.getFileName();
                        if (fileType.equals("image/jpeg") || fileType.equals("image/png")) {
                            if (fileSize <= 700000) {
                                try {
                                    upBean.store(mrequest, "uploadfile");
                                    result = "File Uploaded with no errors...";
                                    DB_Conn conn = new DB_Conn();
                                    Connection con = conn.getConnection();
                                    String insertImage = "INSERT INTO  `mayoristasnic`.`images` "
                                            + "(`image-id` ,`image-name` ,`product-name`) "
                                            + "VALUES (NULL ,  "
                                            + "'uploads/" + file.getFileName() + "',  '" + (String)session.getAttribute("productName") + "');";

                                    Statement st = con.createStatement();
                                    int rows = st.executeUpdate(insertImage);
                                    if (rows == 1) {
                                        result = "Archivo actualizado sin errores...";
                                    }
                                    st.close();
                                    con.close();
                                } catch (SQLException e) {
                                    result = "Problema con la base de datos." + e;
                                } catch (ClassNotFoundException e) {
                                    result = "Ha ocurrido un problema." + e;
                                }

                                files.clear();
                            } else {
                                result = "Ingrese un archivo con peso menor a 700 KB";
                            }
                        } else {
                            result = "Por favor ingrese archivos de tipo image/jpeg or image/png";
                        }

                        request.setAttribute("fileName", fileName);

                        request.setAttribute("fileType", fileType);

                        request.setAttribute("fileSize", fileSize);

                        request.setAttribute("result", result);
                        //if (file != null) 

                        //out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType()+"<br/> ");

                        // Uses the bean now to store specified by jsp:setProperty at the top.
                        upBean.store(mrequest, "uploadfile");
                    } else {
                        out.println("<li>No archivos actualizados");
                    }
                } else {
                    out.println("<BR> todo=" + todo);
                }
            }
        %>

        <%
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher("/productInsertImages.jsp");
            dispatcher.forward(request, response);

        %>
    </body>
</html>
