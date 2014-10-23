/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import database.*;



/**
 *
 * @author MayoristasNicas
 */
public class addCompany extends HttpServlet {

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
            out.println("<title>Servlet addCompany</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCompany at " + request.getContextPath() + "</h1>");
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
        String companyName = request.getParameter("companyName");
        //String productName = request.getParameter("productName");
        PrintWriter out = response.getWriter();
        //out.print(companyName +" "+productName);
        if (companyName.equals("")){
            out.println("Ingresa todos los valores");
        }
        else {
            try {
                //out.println("Done!!");
                Connection con;
                DB_Conn conn = new DB_Conn();
                con = conn.getConnection();
                String sqlInsertCompany = "INSERT INTO  `mayoristasnic`.`product-company` (`company-id` ,`company-name`)VALUES (NULL ,  '"+companyName+"');";  
                Statement st = con.createStatement();
                int rows = st.executeUpdate(sqlInsertCompany);
                
                if (rows != 1){
                    out.println("Compañia no agregada");
                }else {
                    out.println(companyName+" Compañía agregada");
                }
                st.close();
                con.close();
                
            } 
            
            catch (SQLSyntaxErrorException ex){
                out.println("Por favor ingrese un nombre sin caracteres especiales");
            }
            catch (SQLIntegrityConstraintViolationException ex){
                out.println("Ya existe una compañia con este nombre");
            }
            
            catch (SQLException ex) {
                out.println("Hubo un error en la conexión a la base de datos <br/> Ha ocurrido una excepción "+ex);
            } catch (ClassNotFoundException ex) {
                out.println("La aplicación no encuentra la clase <br/> Ha ocurrido una excepción "+ex);
            }
        }
        
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
