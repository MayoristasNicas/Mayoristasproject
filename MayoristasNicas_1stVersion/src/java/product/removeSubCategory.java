/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MayoristasNicas
 */
public class removeSubCategory extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet removeSubCategory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet removeSubCategory at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        
        String message, messageDetail;
        message = "";
        messageDetail = "";
        String messageUrl = "/message.jsp";
        RequestDispatcher dispatchMessage =
                 request.getServletContext().getRequestDispatcher(messageUrl);
        
        try {
            //processRequest(request, response);
            ArrayList<Integer> category = new ArrayList<Integer>();
            category.clear();
            
            Connection c = new DB_Conn().getConnection();
            Statement st = c.createStatement();
            
            PrintWriter out = response.getWriter();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()){
                        String[] parameterValues = request.getParameterValues(parameterNames.nextElement());
                        if (parameterValues.length > 1){
                            for (int i=0;i<parameterValues.length; i++){
                                out.println (" "+parameterValues[i]);
                                category.add(Integer.parseInt(parameterValues[i]));
                            }
                        }else {
                            out.println (" "+parameterValues[0]);
                            category.add(Integer.parseInt(parameterValues[0]));
                        }
            }
            /*DELETE FROM `sub-category` WHERE `subcategory_id` = '"+subcategory.get(i)+"'*/
            for (int i =0; i<category.size(); i++){
                category.get(i);
                out.println ("<br/><br/> "+category.get(i));
                String sqlCategory = " DELETE FROM `sub-category` WHERE `subcategory_id` = '"+category.get(i)+"' ";
                st.addBatch(sqlCategory);
            }
            st.executeBatch();
            response.sendRedirect("/MayoristasNicas_1stVersion/admin_settings.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(removeCategory.class.getName()).log(Level.SEVERE, null, ex);
            message = "Ha ocurrido un error durante el proceso de eliminación.";
            messageDetail = "Ha ocurrido un error durante el proceso de eliminación, por favor intenta más tarde";
                   
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(removeCategory.class.getName()).log(Level.SEVERE, null, ex);
            message = "Ha ocurrido un error durante el proceso de eliminación.";
            messageDetail = "Ha ocurrido un error durante el proceso de eliminación, por favor intenta más tarde";

            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
          
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
