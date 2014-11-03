<%-- 
    Document   : error_404
    Author     : MayoristasNicas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MayoristasNicas 404</title>        
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/myScript.js"></script>

    </head>
    <body>
        
        <%
            if (session.getAttribute("user") == null) {// THen new user, show join now
%>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        %>
        
        <%@include file="includesPage/_search_navigationbar.jsp" %>

        <%@include file="includesPage/_facebookJoin.jsp" %>

        <div class="container_16">
            <div class="grid_14 push_1" id="whiteBox" style="padding: 10px;">
                <br/><h1 style="padding: 10px;">Error  <span class="blue">404</span> - Página no encontrada!!
                </h1><hr/><br/>
                <p  class="grid_4" style="text-align: right; font-size: 52px;">404</p>
                <p class="grid_7">
                Al parecer la página a la que intenta acceder ha sido dañada
                Por favor revise el URL o intente más tarde!! 
                <br/> Lo sentimos por el inconveniente
                </p>
            </div>
        </div>
    </body>
</html>

