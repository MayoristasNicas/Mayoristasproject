
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*, database.*" %>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MayoristasNicas</title>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <link rel="stylesheet" type="text/css" href="css/lightbox.css"  />

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>

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
        <jsp:include page="includesPage/_search_navigationbar.jsp"></jsp:include>
        <jsp:include page="includesPage/_facebookJoin.jsp"></jsp:include>

        <%
            String id = request.getParameter("id");
            if (request.getParameter("id") == null) {
                response.sendRedirect("viewProducts_.jsp");
            }else {

            DB_Conn c = new DB_Conn();
            Connection con = c.getConnection();

            Statement st = con.createStatement();


            String getProductQuery = "SELECT * FROM  `products` p INNER JOIN  `images` i USING (  `product-name` ) WHERE  `product_id` ="+id+" GROUP BY  `product-name` ";
            ResultSet rs = st.executeQuery(getProductQuery);

            rs.next();
            //out.println(""+rs.getString("product-name"));

            String product_id = rs.getString("product_id");
            
            int product_hits = rs.getInt("hits");

            String product_name = rs.getString("product-name");

            String sub_category_name = rs.getString("sub-category-name");

            String category_name = rs.getString("category-name");

            String company_name = rs.getString("company-name");

            String price = rs.getString("price");

            String summary = rs.getString("summary");

            String image_name = rs.getString("image-name");
            String Quantity = rs.getString("product_qty");
            String Web = rs.getString("web_page");
                    
            

        %>


        <div class="container_16">

            <div class="grid_16" id="productStrip">
                <div class="ProductHeading">
                    <div class="grid_16">
                        <h2 class="heading"><%= product_name%>- <%=company_name%> <%= category_name%></h2>
                    </div>
                </div>

                <div class="grid_10">
                    <div class="grid_10">
                        <br/>
                        <h5>Proveedor :<a href="#"><span class="blue"><%= category_name%></span></a> > <a href="#"><span class="blue"><%= sub_category_name%></span></a></h5>
                        <div class="clear"></div>
                        <br/>
                        <h5>Precio <span class="BigRed">C$. <%= price%></span></h5>
                      
                        <br/>
                        <br/>
                        <%
                            if (session.getAttribute("admin") != null){
                            %>
                         <a href="admin_manageProduct.jsp?pid=<%= product_id %>">
                            <div class="grid_1" id="buy">
                                Editar
                            </div>
                        </a>
                        <%
                            }
                        %>
                                               
                            
                                
                            
                      
                        
                           
                        <h1>Detalle del producto</h1>
                        <div class="clear"></div>
                        <p>Detalle de <%= product_name%>

                            <%= summary%></p>
                        <h1>Breve Descripci�n</h1>
                        <div class="clear"></div>
                        <br/>
                        
                        <table class="grid_6" id="descripTable">
                            <tr class="grid_6">
                                <td>Nombre</td>
                                <td><%= product_name%></td>
                            </tr>
                            <tr class="grid_6">
                                <td>Proveedor</td>
                                <td><%= category_name%></td>
                            </tr>
                            <tr class="grid_6">
                                <td>Categor�a</td>
                                <td><%= sub_category_name%></td>
                            </tr>
                            <tr class="grid_6">
                                <td>Sub-categor�a </td>
                                <td><%= company_name%></td>
                            </tr>
                            <tr class="grid_6">
                                <td>Cantidad en existencia</td>
                                <td><%= Quantity %></td>
                                </tr>
                            
                            <tr class="grid_6">
                                <td>Cantidad a comprar </td>
                                <td><form> <input type="numeric" name="Cantidad" value="1"> </form></td>
                            </tr>
                        </table>

                       
                    <a                                
                        href="addToCart.jsp?id=<%=product_id%>">
                           <div class="grid_3" id="buy">Comprar ahora <img src="images\logo\Carrito.png">
                            </div>
                                    </a>
                    </div>
                </div>

                <div  class="grid_5">
                    <div id="productImages">
                        <!-- Images with T are thumbs Images While with Q are The actual source Images -->

                        <img class="BigProductBox" alt="<%= product_name %>" src="<%= image_name%>" />
                        
                        <div class="clear"></div>
                        
                        <p>
                          <%
                            String getImages = "SELECT  `image-name` FROM  `products` INNER JOIN  `images` USING (  `product-name` ) WHERE  `product_id` =" + product_id + "";
                            
                            rs.close();

                            rs = st.executeQuery(getImages);
                            int img_number = 1;
                            rs.next();
                            // GET THE REST OF THE PRODUCT IMAGES
                            while (rs.next()) {

                                 image_name = rs.getString("image-name");

                        %>
                          
                          
                          <a href="<%= image_name %>" rel="lightbox[product]" title="Click derecho para seguir a la siguiente">
                            <img class="SmallProductBox" alt="<%= image_name %> 1 of 8 thumb" src="<%= image_name %>" />
                          </a>
                          
                          
                          
                          <%                            
                            }
                            st.execute("UPDATE  `products` "
+" SET  `hits` =  '"+(product_hits+1)+"' "
+" WHERE  `products`.`product_id` ="+product_id+" ");
                            st.close();
                        
                        %>
  <!--
                        <a href="images/productImages/q1.jpeg" rel="lightbox[product]" title="Click on the right side of the image to move forward.">
                            <img class="SmallProductBox" alt="Assassins Creed 1 of 8 thumb" src="images/productImages/t1.jpeg" />
                        </a>
-->
                          
                        </p>
                    
                        <div class="grid_6" id="top" ">
                          <a href="http://<%= Web%>"><div id="greenBtn" align="center" class ="Btn">Ver m�s en sitio oficial</div></a>
                 
                        </div>
                    <%}%>
                    </div>

                    <div class="clear"></div>
                </div>




            </div>

                        <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_5_1.jsp"></jsp:include>
            
            
            
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
