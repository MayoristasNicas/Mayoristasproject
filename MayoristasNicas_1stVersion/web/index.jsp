<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MayoristasNicas</title>
        <!-- Default Stylesheets -->
        <%@include file="includesPage/_stylesheets.jsp" %>
        
        <link rel="stylesheet" href="css/slider.css"  />
        <link href="css/main.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        
        <script type="text/javascript" src="js/slider.js"></script>


<script type="text/javascript" >

    // This is the script for the banner slider

    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 7000
        });
    });
</script>


<script type="text/javascript" src="js/myScript.js"></script>

</head>
<body>
    <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

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

    <div id = "banner">
        <div class="container_16">
            <div class="grid_16" style="padding-left: 20px; " id="slider">	
                <ul id="sliderContent">		
                    <!-- Duplicate this code for each image -->				

                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b1.jpg" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Kimberly Clark</strong>	

                            <br>Aprovechá las promociones que Kimberly Clark te trae en toda su linea de productos de higiene 
                            
                            MayoristasNicas.

                        </span>

                    </li>  
                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/CocaZeroWP.jpg" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Coca Cola Zero</strong>				

                            <br>Descubre el sabor de la coca cola ZERO calorias, aprovechá las promociones que FEMSA te trae, coca cola zero al precio mas bajo
                            del mercado
                           

                        </span>

                    </li>  



                    <li class="sliderImage" style="display: none; ">

                       <img src="images/banner/Pringles.jpg" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Pringles</strong>				

                            <br>Con la linea mï¿½s completa de productos lácteos, Parmalat está presente en MayoristasNicas
                            
                            para brindarte un precio mejor que en cualquier otro lugar del país

                        </span>

                    </li>  

                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b7.jpg" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>NESTLE</strong>				

                            <br>Nestlï¿½ te trae precio de ganga en la compra al por mayor de los siguientes productos

                        </span>

                    </li>   



                    <li class="sliderImage" style="display: none; ">

                        <img src="images/banner/b6.jpg" width="900" height="300" /> 

                        <span class="top" style="display: none; ">

                            <strong>Agricorp</strong>				

                            <br>Con la mï¿½s amplia variedad de productos bï¿½sicos para el hogar. Tendremos ofertas por la 
                            
                            compra de un paquete de Agricorp recibes un 10% de descuento en tu prï¿½xima compra superior 
                            
                            a C$ 50,000.

                        </span>

                    </li>   

                    <div class="clear sliderImage"></div>  

                </ul>
            </div>
        </div>
    </div>



    <div class="container_16">
        <div id = "contents">
            <!-- LeftSide -->


<%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
            <div id="leftside" class="grid_3">
                <div>
                    <ul id="leftsideNav">
                        <li><a href="viewProducts_.jsp"><strong><center>Productos de Proveedores</center></strong></a></li>
                         
                        
                        
                        <%--<%
                        while (rs.next()){
                            String category = rs.getString ("category_name");
                            %>
                            <li><a href="viewProducts_.jsp" class="strong-white"><%= category %></a></li>
                        <%
                        }
                        %> --%>
                      
                    </ul>
                </div>
                <div class="adv">

                    <h2><br/>Anuncios publicitarios</h2>
                    <p>Tu negocio puede anunciarse aqui,contï¿½ctanos </p>

                    <h2><br/>Atento !</h2>
                    <p>Se acerca la Navidad! Grandes descuentos solo en MayoristasNicas </p>

                </div>
            </div>


        </div>

        <!-- Middle -->
        <div id="middle"class="grid_13">
           <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include> 
        </div>
        <!--The Middle Content Div Closing -->
    </div>
    <!--The Center Content Div Closing -->

    <jsp:include page="includesPage/_footer.jsp"></jsp:include>


    



</body>
</html>



