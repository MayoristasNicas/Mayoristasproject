

<div id = "topSearch">
    <div class="container_16">
        <div class="grid_16">
            <div class="grid_9">


                <input type="text" id="search" class="searchBox" placeholder="B�squeda por art�culos ..." autofocus="true"/>

            </div>
            <div class="grid_6" id="topNav">
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="viewProducts_.jsp">Productos</a></li>
                    <li><a href="contact-support.jsp">Contactanos</a></li>
                    <li><a href="faq.jsp">Preguntas</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id = "topThird">
    <div class="container_16">
        <div class="grid_16">
            <div class="grid_9">
               <p><span>Misi�n</span> Brindar una canal de distribuci�n en l�nea a empresas productoras de alimentos como una alternativa de canal de venta. Asimismo ofrecer a clientes finales productos al por mayor a un mejor precio de compra.</p>
               <p><span>Visi�n</span> Ser una empresa de servicios de distribuci�n robusta con capacidad de adaptarse a la globalizaci�n y implantar un estilo en mercado de canal de distribuci�n de productos al por mayor.</p>
               
           
            <!-- <p><span>Mahavir Paints</span> is the one of the most best places in Mira Bhyyandar to find <span>First Class Paints</span></p>
            -->
            </div>
            <div class="grid_6" id="top">
                <a href="http://www.facebook.com"> <div id="greenBtn" align="center" class ="Btn">S� miembro de nuestra comunidad en Facebook!!</div></a>
            </div>
        </div>
    </div>
</div>

<%
    if (session.getAttribute("admin") != null){
        %>
        <script type="text/javascript">
    $(document).ready(function (){
        //alert ("fdvgf");
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){
                //$('#loadSearches').load('findProductLoad.jsp', {searchbar:searchbar});
                            
                $('#loadSearches').css('display');
                $.get('findProductLoad.jsp', {searchbar:searchbar}, function (data){
                    //alert (data);
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
<%
    } else {
        %>
<script type="text/javascript">
    $(document).ready(function (){
        //alert ("fdvgf");
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){
                //$('#loadSearches').load('findProductLoad.jsp', {searchbar:searchbar});
                            
                $('#loadSearches').css('display');
                $.get('findProductLoad_1.jsp', {searchbar:searchbar}, function (data){
                    //alert (data);
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
<%
    }
%>

<div class="container_16" id="loadSearches" ></div>
