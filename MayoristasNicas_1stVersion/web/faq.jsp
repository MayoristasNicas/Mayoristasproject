<%-- 
    Document   : faq
    Author     : MayoristasNicas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MayoristasNicas FAQ</title>        
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
            <div id="whiteBox" style="padding: 10px;">
                <br/>
                <h1>Preguntas Frecuentes</h1>
                <hr/>
            </div>
        </div>

        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="padding: 10px;">
                <div name="top" class="push_1">
                <br/><br/>
            <a href="#1">&bull; Pregunta1</a>
                <br/><br/>
            <a href="#2" >&bull; </a>
                <br/><br/>
            <a href="#3" >&bull; </a>
                <br/><br/>
            <a href="#4" >&bull; </a>
                <br/><br/>
            <a href="#5" >&bull; </a>
                <br/><br/>
            <a href="#6" >&bull; </a>
                <br/><br/>
            <a href="#7" >&bull; </a>
                <br/><br/>
            <a href="#8" >&bull; </a>
                <br/><br/>
            <a href="#9" >&bull; </a>
                <br/><br/>
            <a href="#10">&bull; </a>
       </div> 
                <br/><br/>
            <hr/>
                <a  href="#top" name="1">&bull; Pregunta1</a>
                    <div>
                    <p>
                        Respuesta1
                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top"  name="2">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="3">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="4">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="5">&bull; </a>
        <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="6">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="7">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>            
            <br/><br/>
            <a  href="#top" name="8">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="9">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            <a href="#" name="10">&bull; </a>
                    <div>
                    <p>

                    </p>
                    <p>

                    </p>
                    </div>
            <br/><br/>
            
                    </div>
                </div>
        <jsp:include page="includesPage/_footer.jsp"></jsp:include>
    </body>
</html>
