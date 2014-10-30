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
                <h8> Algunos de nuestros clientes </h8>
                <hr/>
                </center></div>
        </div>
        
        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="padding: 0px; margin-left: 0px">
             
                <div class="grid_7 push_1">
                    
                    <table border="2" cellpadding="3" cellspacing="5">
<tr>
    <td>
        <img src="images\Clients\PG.gif">
    </td>
                        <td>
                            <img src="images\Clients\nestle.jpg">
                        </td>
</tr>
<tr>
    <td> 
        <img src="images\Clients\kc.jpg">
    </td>
    <td>
        <img src="images\Clients\CSSA.png">
    </td>
</tr>

<tr>
    <td> 
        <img src="images\Clients\parmalat.png">
    </td>
    <td>
        <img src="images\Clients\Coca.jpg">
    </td>
</tr>
</table>
                    
            </div>
        </div>
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
