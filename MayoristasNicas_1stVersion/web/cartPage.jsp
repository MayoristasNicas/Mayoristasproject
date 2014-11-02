<%-- 
    Document   : addToCart
    Author     : MayoristasNicas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MayoristasNicas - Carrito</title>
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
        <jsp:useBean id="cart" scope="session" class="cart.cart"/>

        <%
        if (session.getAttribute("user") == null ){// THen new user, show join now
            %>
            <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
        }
        %>

    <%@include file="includesPage/_search_navigationbar.jsp" %>

    <%@include file="includesPage/_facebookJoin.jsp" %>

    <div class="container_16">
        <div class="grid_16" id="whiteBox">
            <div class="grid_8 push_4" >
                <h1 class="push_2" style="padding:10px 00px">Productos en tu carrito</h1>
                <h3 class="push_2" >Tu carrito contiene lo siguiente...</h3>
                
              <!--  <p>
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    fgfh fgfg dgrsfd cdv dvdvdsddcd fgfh fgfg dgrsfd cdv dvdvdsddcd 
                    
                </p> -->
              

        
        <div id="CartTable" style="padding:10px 00px" class="grid_11">
                    <div class="grid_5">
                        <h2>Nombre del producto</h2> 
                    </div>
                    <div class="grid_2">
                        <h2>Precio</h2>
                    </div>
                    <div class="grid_2">
                         <h2>Cantidad</h2>
                    </div>
             <!--marina  <p>
                    <div class="grid_5">
                        Assassins Creed III
                    </div>
                    <div class="grid_2">
                        C$. 999
                    </div>
                    <div class="grid_1">
                         x1
                    </div>
                    <div class="grid_2">
                         Rs. 2098
                    </div>
            
                    <div class="grid_5">
                        Dell Monitors
                    </div>
            
                    <div class="grid_2">
                        Rs. 1024
                    </div>
                    <div class="grid_1">
                         x2
                    </div>
                    <div class="grid_2">
                         Rs. 67890
                    </div>
            
                    <div class="grid_5">
                        Sherlock holmes
                    </div>
                    <div class="grid_2">
                        Rs. 104
                    </div>
                    <div class="grid_1">
                         x1
                    </div>
                    <div class="grid_2">
                         Rs. 6789
                    </div>
                    <br/>
                </p> marina -->    
                    <div class="grid_5">
                        <strong>Precio total del carrito</strong>
                    </div>
            
                    <div class="grid_3 push_3">
                        C$ 20345
                    </div>
                    <div class="clear"></div>
                    
                    <br/>
                    <br/>
                    <a href="viewProducts_.jsp">
                    <div class="grid_3" id="greenBtn">
                        Comprar este producto
                    </div>
                    </a>
                    <a href="index.jsp">
                        <div class="grid_3" id="greenBtn">
                        Continuar comprando
                    </div>
                    </a>
                </div>
                
            </div>
            
        </div>
    </div>
    </body>
</html>