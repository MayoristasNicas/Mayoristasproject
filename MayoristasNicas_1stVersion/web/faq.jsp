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
                <div name="top" class="push_1" style=" font-size: 16px">
                <br/><br/>
                <a href="#1"><strong>1. Que es MayoristasNicas?</strong></a>
                <br/><br/>
                <a href="#2" style="margin-right: 10px" >&bull; Es un sitio de comercio electrónico donde encontrarás la venta de productos varios al por mayor a un menor precio en el mercado de mayoristas</a>
                <br/><br/>
                <a href="#3" ><strong>2. ¿Que linea de productos se venden en la página?</strong> </a>
                <br/><br/>
            <a href="#4" >&bull; MayoristasNicas vende una gran variedad de productos, desde alimentos, articulos para el hogar, hasta productos de uso personal. </a>
                <br/><br/>
                <a href="#5" ><strong>3. ¿Se necesita el registro de usuarios para comprar?</strong></a>
                <br/><br/>
            <a href="#6" style="margin-right: 10px" >&bull;Si. MayoristasNicas te brinda la oportunidad de observar productos sin registrarte, pero si deseas
                realizar un pedido, es obligatorio el registro en el sitio web </a>
                <br/><br/>
                <a href="#7" ><strong>4. ¿Cual es el costo por el registro en MayoristasNicas?</strong> </a>
                <br/><br/>
            <a href="#8" >&bull; El registro en el sitio es totalmente gratis para los clientes.</a>
                <br/><br/>
                <a href="#9" ><strong>5. ¿A que ciudades de Nicaragua aplica el domicilio de productos?</strong> </a>
                <br/><br/>
            <a href="#10">&bull; El domicilio del los productos dependerá de la empresa que está vendiendo sus productos </a>
                <br/><br/>
                <a href="#11" ><strong>6. ¿El domicilio tiene un costo adicional al precio de la compra?</strong> </a>
                <br/><br/>
            <a href="#12">&bull; El domicilio es totalmente gratis. </a>
            <br/><br/>
            <a href="#13" ><strong>7. ¿Cuantos días dura el domicilio en llegar a la puerta del cliente?</strong> </a>
                <br/><br/>
            <a href="#14">&bull; Esto dependerá de la empresa a quien se le compre el producto, sin embargo la estimación de dias es alrededor de 1 a 3 dias</a>
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
