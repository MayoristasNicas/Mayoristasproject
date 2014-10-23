/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package product;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MayoristasNicas
 */
public class addProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        //response.setContentType("text/html;charset=UTF-8");
        
        String message, messageDetails, url;
        RequestDispatcher dispacher;
        /*
        dispacher = 
                    getServletContext().getRequestDispatcher(url);
            dispacher.forward(request, response);
            */
            
        String productName, productQty, company, category, subCategory, price, discountedPrice, summary, tags;
        company = request.getParameter("company");
        productQty = request.getParameter("productQty");
        productName = request.getParameter("productName");
        category = request.getParameter("category");
        subCategory = request.getParameter("subCategory");
        price = request.getParameter("price");
        tags = request.getParameter("tags");
        //discountedPrice = request.getParameter("discountedPrice");
        summary = request.getParameter("summary");
        PrintWriter out = response.getWriter();
        out.println("productName " + productName
                + " <br>company " + company
                + " <br>category " + category
                + " <br>subCategory " + subCategory
                + " <br>price " + price
               // + " <br>discountedPrice " + discountedPrice
                + " <br>summary <br>" + summary
                +" <br>summary <br>" + tags);
        if (!productName.equals("") || !price.equals("") ){
            try {
                String insertQuery = ""
                        + "INSERT INTO  "
                        + "`mayoristasnic`.`products` "
                        + "(`product_id` ,"
                        + "`product-name` ,"
                        + "`sub-category-name` ,"
                        + "`category-name` ,"
                        + "`company-name` ,"
                        + "`price` ,"
                        + "`summary`, "
                        + "`tags`, "
                        + "`product_qty` ) "
                        + "VALUES "
                        + ""
                        + "(NULL ,  "
                        + "'"+productName+"',  "
                        + "'"+subCategory+"',  "
                        + "'"+category+"',  "
                        + "'"+company+"',  "
                        + "'"+price+"', "
                        + "'"+summary+"', "
                        + "'"+tags+"', "
                        + ""+productQty+");";
                
                DB_Conn conn = new DB_Conn();
                Connection con = conn.getConnection();
                Statement st = con.createStatement();
                
                int rows = st.executeUpdate(insertQuery);
                if (rows == 1){
                    /*out.print(company +" "+ productName+ ""
                    + " Product Inserted ");*/
                    
                    //GET THE ID OF THE Product recently inserted
                    ResultSet executeQuery = st.executeQuery("SELECT  `product_id` "
                                                         + " FROM  `products` "
                                                         + " WHERE  `product-name` =  '"+productName+"'");
                    String ProductId = "";
                    while (executeQuery.next()){
                        ProductId = executeQuery.getString("product_id");
                    
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("productName", productName);
                    session.setAttribute("productId", ProductId);
                    out.print("Producto agregado");
                    message = "Producto agregado...";
                    messageDetails = company +" "+ productName+ ""
                            + " Producto agregado exitosamente... ";
                    //"http://localhost/uploadProductFile/"
                    url ="/productInsertImages.jsp";
                    request.setAttribute("productName", productName);
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    dispacher = 
                    getServletContext().getRequestDispatcher(url);
                    dispacher.forward(request, response);
                }
                st.close();
                con.close();
            }
            catch (SQLException ex) {
                //out.println("SQL Exception "+ex);
                    message = "Producto no agregado...";
                    messageDetails = company +" "+ productName+ ""
                            + " El producto no se agregó debido a un error en la base de datos";
                    out.print("Producto no agregado "+ ex);
                    url ="/productInsertImages.jsp";
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    dispacher = 
                    getServletContext().getRequestDispatcher(url);
                    //dispacher.forward(request, response);
            
                //Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                //out.println("Class Not Found Exception "+ex);
                
                    message = "Producto no agregado...";
                    messageDetails = company +" "+ productName+ ""
                            + " Ocurrió un error al momento de agregar el producto";
                    
                    url ="/productInsertImages.jsp";
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    dispacher = 
                    getServletContext().getRequestDispatcher(url);
            //dispacher.forward(request, response);
            
                //Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else {
            //out.println("Please Enter Product-name and Price");
                    message = "Producto no agregado...";
                    messageDetails = "Por favor ingrese un nombre y precio para el nuevo producto";
                    out.print("Producto no agregado " + " "+message);
                    url ="/productInsertImages.jsp";
                    request.setAttribute("message", message);
                    request.setAttribute("messageDetails", messageDetails);
                    dispacher = 
                    getServletContext().getRequestDispatcher(url);
            dispacher.forward(request, response);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
