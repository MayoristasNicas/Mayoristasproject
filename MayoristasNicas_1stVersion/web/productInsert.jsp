<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>

<%@page import="java.sql.*, database.*" %>
<%
    DB_Conn conn = new DB_Conn();
    Connection con = conn.getConnection();
    Statement st = con.createStatement();
    String sql_getCategory = "SELECT  `category_name` FROM  `category`;";
    String sql_getSubCategory = "SELECT  `sub-category_name` FROM  `sub-category`;";
    String sql_getCompany = "SELECT  `company-name` FROM  `product-company`;";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MayoristasNicas</title>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <%@include file="includesPage/_stylesheets.jsp" %>
        <!--
                <link rel="stylesheet" type="text/css" href="css/forms/button.css"/>
        -->
        <link rel="stylesheet" type="text/css" href="css/styles.css"  />

        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/lightbox.js"></script>
        <script type="text/javascript" src="js/myScript.js"/></script>
    <script type="text/javascript" src="js/product.js"/></script>

</head>
<body>

    <%
        if (session.getAttribute("email") == null) {%> 


    <%@include file="includesPage/_joinNow.jsp" %>
    <%//@include file="includesPage/_topLogin.jsp" %>

    <%    } else {
    %>

    <%@include file="includesPage/_logout.jsp" %>

    <%        }
    %>

    <%@include file="includesPage/_search_navigationbar.jsp" %>

    <%@include file="includesPage/_facebookJoin.jsp" %>

    <div class="container_16">
        <div class="grid_16" id="productStrip">
            <div class="grid_16">
                <h1 class="bold underlined center" style="font-size:35px; margin:20px auto;" >Agregar un producto</h1>
            </div>
            <div class="grid_10 push_3">
                <form method="GET" action="addProduct">
                    <div class="grid_10">
                        <div class="grid_9">
                            <p style="font-size:15px;">Inicie ingresando la información del producto paso a paso en su base de datos</p>
                            <table class="stepTable">
                                <tr>
                                    <td colspan="2"><h1>Paso 1. Ingrese la compañía del producto</h1></td>
                                </tr>
                                <%//Retrieves The Data From product-company table%>
                                <tr>
                                    <td><h4>Seleccione una compañía</h4> <br/> <h3 class="center">ó</h3><br/></td>
                                    <td><img src= "images/icons/dropDown.png" alt="dropDown"/>
                                        <select name="company">

                                            <%
                                                ResultSet company = st.executeQuery(sql_getCompany);
                                                while (company.next()) {
                                                    String companyName = company.getString("company-name");
                                            %>

                                            <option name="<%= companyName%>"><%= companyName%></option>

                                            <%
                                                }
                                            %>


                                        </select><img src= "images/icons/dropDown.png" alt="dropDown"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td><h4>Agregue una compañía</h4></td>
                                    <td><input id="companyName" type="text" name= "companyName" tabindex="1" placeholder="ej. Cafe Soluble"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input id="addProductNameBtn" type="button" value="Ya he escrito el nombre"/>
                                    </td>
                                </tr>
                            </table>
                            <h4 id="step1Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                            <h4 id="step2Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                            <table class="stepTable">
                                <tr>
                                    <td colspan="2"><h1>Paso 2. Ingrese un proveedor</h1></td>
                                </tr>
                                <%//Retrieves The Data From category table%>
                                <tr>
                                    <td><h4>Seleccione proveedor</h4> <br/> 
                                        <h3 class="center">Or</h3><br/></td>
                                <script type="text/javascript" src="js/jquery.js"></script>
                                <script type="text/javascript">
                                    $(document).ready (function (){
                                        $('#selectMenuCategory').click(function (){
                                            var category = $(this).attr('value');
                                            //alert ("Aargh " +getCategory);
                                            $.get('getProductSubCategory', 
                                            { category: category}, 
                                            function (data){
                                                $('#selectMenuSubCategory').html(data);
                                            });
                                        });
                                    });
                                </script>

                                <td><img src= "images/icons/dropDown.png" alt="dropDown"/>
                                    <select id="selectMenuCategory" name="category">
                                        <% ResultSet rs = st.executeQuery(sql_getCategory);
                                            while (rs.next()) {
                                                String category = rs.getString("category_name");
                                        %>
                                        <option value="<%= category%>"><%= category%></option>
                                        <%
                                            }
                                        %>
                                    </select><img src= "images/icons/dropDown.png" alt="dropDown"/></td>

                                </tr>

                                <tr>
                                    <td><h4>Agregue un proveedor</h4></td>
                                    <td>
                                        <input id="categoryName" type="text" name= "categoryName" tabindex="1" placeholder="ej. Cafe Soluble"/><br/></td>
                                </tr>
                                <tr  class="needHRule">
                                    <td></td>
                                    <td><input id="addCategoryNameBtn" type="button" value="Agregar proveedor"/>
                                    </td>
                                </tr>


                                <%//Retrieves The Data From Sub-category table%>
                                <tr>
                                    <td><h4>Seleccione una categoría</h4> <br/> <h3 class="center">ó</h3><br/></td>
                                    <td>
                                        <img src= "images/icons/dropDown.png" alt="dropDown"/>
                                        <select id="selectMenuSubCategory" name="subCategory">

                                            <%

                                                ResultSet subCategory = st.executeQuery(sql_getSubCategory);

                                                while (subCategory.next()) {
                                                    String subCat = subCategory.getString("sub-category_name");
                                            %>

                                            <option value="<%= subCat%>"><%= subCat%></option>

                                            <%
                                                }
                                                st.close();

                                            %>

                                        </select><img src= "images/icons/dropDown.png" alt="dropDown"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td><h4>Agregue una categoría</h4></td>
                                    <td><input id="SubCategoryName" type="text" name= "SubCategoryName" tabindex="1" placeholder="Lácteos"/><br/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input id="addSubCategoryBtn" type="button" value="Agregar categoría"/>
                                    </td>
                                </tr>
                            </table>
                        </div>


                        <!--	<div id="productStockDetail">
                                        <h4>Product In Stock</h4>
                                        <h5>Will be delivered in 5 days</h5>
                                </div>-->
                        <div class="clear"></div>
                        <h1>Paso 3. Ingrese el precio</h1>
                        <input type="text" name= "price" tabindex="1" placeholder="ej. $25.00"/><br/>
                        <br/>
                        <h1>Paso 4. Ingrese el nombre y cantidad</h1>
                        <input id="productName" type="text" name= "productName"  placeholder="Nombre del productp"/><br/>
                        <br/>
                        <input id="productQty" type="text" name= "productQty"  placeholder="Cantidad"/><br/>
                        <br/>
                        <h1>Paso 5. Ingrese tags y la descripción</h1>
                        <input id="tags" type="text" name= "tags" placeholder="Ingrese los tags seguido por comas"/><br/>
                        <br/>  
                        <h1>Descripción del producto</h1>
                        <textarea name="summary" class="grid_9" rows="17"></textarea>

                        <input id="greenBtn" type="submit" value ="Ya he agregado la información del producto" />
                    </div>
                </form>

                <div class="clear"></div>
                <br/>

            </div>
            <%--This separates out the Image and the main Content --%>

            <div class="clear"></div>
        </div>
    </div>
</div>

<div class="container_16">
    <div class="grid_16" id="productStrip"> <a href="http:google.com">
            <div class="ProductHeading">
                <div class="grid_12">
                    <h2 class="heading">Los productos más vistos</h2>
                </div>
                <div id="viewMore" class="grid_3">
                    <h6 class="blue">Ver más</h6>
                </div>
            </div>
        </a>
        <div class="clear"></div>

    </div>
</div>



<div id = "footer">
    <div class="container_16">

        <div class="grid_16" >
            <div class="grid_3">
                <ul>
                    <li><strong>Ayuda</strong></li>
                    <li><a href="faq.html">Pagos</a></li>
                    <li><a href="faq.html">Entregas</a></li>
                    <li><a href="faq.html">Cancelación &amp; Devoluciones</a></li>
                </ul>
            </div>
            <div class="grid_3">
                <ul>
                    <li><strong>MayoristasNicas</strong></li>
                    <li><a href="contact.html">Contáctamos</a></li>
                    <li><a href="about.html">Acerca de nosotros</a></li>
                    <li><a href="faq.html">Preguntas y Respuestas</a></li>
                </ul>
            </div>
            <div class="grid_3">
                <ul>
                    <li><strong>Misc</strong></li>
                    <li><a href="index.html">Inicio</a></li>
                    <li><a href="faq.html">Preguntas y Respuestas</a></li>
                    <li><a href="http://www.facebook.html">Facebook</a></li>
                </ul>
            </div>

            <div class="grid_5">
                <br/><h2>Compras seguras e inmediatas</h2><p>
            </div>

        </div>

        <div id="clear"/>
        <div class="grid_16">	
            <p>Copyrights &copy; 2014 MayoristasNicas - Ventas al por mayor</p>
        </div>
    </div>
</div>

</body>
</html>
