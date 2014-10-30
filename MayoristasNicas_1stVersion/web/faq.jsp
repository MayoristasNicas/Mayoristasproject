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
            <div id="whiteBox" style="padding: 5px">
                <center>                <br/>
                <h8>Preguntas Frecuentes</h8>
                <hr/></center>
            </div>
        </div>

        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="padding: 0px; margin-left: 0px">
                <div name="top" class="push_1">
                <br/><br/>
            <a href="#1">1. Que es MayoristasNicas?</a>
                <br/><br/>
            <a href="#2" >&bull; </a>
                <br/><br/>
            <a href="#3" >2. ¿Que linea de productos se venden en la página? </a>
                <br/><br/>
            <a href="#4" >&bull; </a>
                <br/><br/>
            <a href="#5" >3. ¿Se necesita el registro de usuarios para comprar?</a>
                <br/><br/>
            <a href="#6" >&bull; </a>
                <br/><br/>
            <a href="#7" >4. ¿Cual es el costo del registro en la página? </a>
                <br/><br/>
            <a href="#8" >&bull; </a>
                <br/><br/>
            <a href="#9" >5. ¿A que ciudades de Nicaragua aplica el domicilio de productos? </a>
                <br/><br/>
            <a href="#10">&bull; </a>
                <br/><br/>
            <a href="#11" >5. ¿El domicilio tiene un costo adicional al precio de la compra? </a>
                <br/><br/>
            <a href="#12">&bull; </a>
            <br/><br/>
            <a href="#13" >5. ¿Cuantos dias dura el domicilio en llegar a la puerta del cliente? </a>
                <br/><br/>
            <a href="#14">&bull; </a>
                <br/><br/>
       </div> 
                <br/><br/>
            <hr/>
              <!--  <a  href="#top" name="1">&bull; Pregunta1</a>
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
            -->
                    </div>
                </div>
        <jsp:include page="includesPage/_footer.jsp"></jsp:include>
        <script type='text/javascript'>	 
(function () { var done = false;
    var script = document.createElement('script');
    script.async = true;	
    script.type = 'text/javascript'; 
    script.src = 'https://app.purechat.com/VisitorWidget/WidgetScript'; 
    document.getElementsByTagName('HEAD').item(0).appendChild(script); 
    script.onreadystatechange = script.onload = function (e) {	 if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {	 var w = new PCWidget({ c: 'e54859fd-12c5-44a3-869d-4978579d3e70', f: true });	 
            done = true;	 }	 };	 })();	 </script>
    </body>
</html>
