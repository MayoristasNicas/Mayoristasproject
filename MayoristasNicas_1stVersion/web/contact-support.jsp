<%-- 
    Document   : contact-support
    Created on : 14 Dec, 2012, 12:38:53 AM
    Author     : MayoristasNicas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MayoristasNicas</title>
        <jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

        <%@page import="java.sql.*, database.*" %>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>
        <script src="js/myScript.js"></script>
        
        <style type="text/css">
            .adminMenu {
                margin-top: 10px;
                margin-bottom: 10px;
                margin-right: 0px;
                background: #FFF;
                box-shadow: 0px 0px 10px #333;
            }
            .adminMain {
                margin-top: 10px;
                margin-bottom: 10px;
                background: #FFF;
                box-shadow: 0px -1px 10px #333;
            }
            #leftside {
                cursor: pointer;
            }
            .error {
                color:#FFF;
                background: #CC0000;
                box-shadow: 0px 0px 10px #CC0000;
            }
            
            .error:active {
                color:#FFF;
                background: #CC0000;
                box-shadow: 0px 0px 10px #CC0000;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function (){
                
                var usrname = $('#usrname');
                
                usrname.keyup(function (){
                    if (!isNaN(usrname.attr ('value'))){
                        usrname.addClass('error');
                    }else {
                        usrname.removeClass('error');
                    }
                });
                
                //usrname.addClass('error')
        });
        </script>
    </head>
    <body>
        
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
        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <div class="container_16">
            <div id="whiteBox" style="padding: 5px"><center>
                <br/>
                <h8> Misión y Visión </h8>
                <hr/>
                </center></div>
        </div>
        
        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="padding: 0px; margin-left: 0px">
             
                <div class="grid_7 push_1">
                    
                    <table border="2" cellpadding="3" cellspacing="5">
<tr>
    <td><p style="color: #000;font-size: 17px; margin-top: 70px"><strong>Misión:</strong>
                            Brindar una canal de distribución en línea a empresas productoras de alimentos como una alternativa de canal de venta. Asimismo ofrecer a clientes finales productos al por mayor a un mejor precio de compra.</p></div>
                        </td>
                        <td><img src="images\logo\Mision.png"></td>
</tr>
<tr>
    <td> <img src="images\logo\Vision.png" style=" padding-left: 100px"></td></td>
<td><p style="color: #000;font-size: 17px; margin-top: 70px"><strong>Visión:</strong>
Ser una empresa de servicios de distribución robusta con capacidad de adaptarse
a la globalización y implantar un estilo en mercado de canal de distribución de 
productos al por mayor.</p></td>
</tr>
</table>
                    <div>
                  
                    <div class="grid_5" id="whiteBox" style="margin: 10px;">
                        <div class="grid_5" style=" font-size: 15px; color: #000">
                    <div class="grid_3 ">
                        MayoristasNicas
                    </div>
                    <div class="clear ">
                    </div>
                    <div class="grid_1">
                        Email:
                    </div>
                    <div class="grid_3">
                        support@mayoristasnicas.com
                    </div>
                    <div class="grid_3">
                        Dirección:
                    </div>
                    <div class="grid_3">
                        Lomas del Valle, Av. Henares, casa #A-8
                    </div>
                    <div class="grid_3">
                        Celular:
                    </div>
                    <div class="grid_3">
                        +505-887-63345
                    </div>
                </div>
            </div>
                    
                     
                </div>
            </div>
        </div>
    </body>
</html>
