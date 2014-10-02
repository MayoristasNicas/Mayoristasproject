package loginRegister;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import helpers.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import user.user;

/**
 *
 * @author MayoristasNicas
 */
public class loginServlet extends HttpServlet {

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
            out.println("<title>Servlet loginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        String email, pass;
        String db_email, db_pass;
        boolean isLoggedIn = false;
        HttpSession userSession = request.getSession();
        PrintWriter out = response.getWriter();
        email = request.getParameter("email");
        pass = request.getParameter("pass");
        String message, messageDetail;
        message = "";
        messageDetail = "";
        
        String messageUrl = "/message.jsp";
        RequestDispatcher dispatchMessage =
                 request.getServletContext().getRequestDispatcher(messageUrl);
        
        try {
            
            pass = SecureSHA1.getSHA1(pass);
            out.println("email " + email + " pass " + pass);
            DB_Conn con = new DB_Conn();
            Connection c = con.getConnection();
            String sqlGetUsers = "SELECT  `email` ,  "
                    + "`pass` FROM  `user`; ";

            PreparedStatement st = c.prepareStatement(sqlGetUsers);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                db_email = rs.getString("email");
                db_pass = rs.getString("pass");

                if (email.equals(db_email)) {
                    message = "Tu correo electrónica existe en nuestra base de datos!";
                    //you exist with us
                    if (pass.equals(db_pass)) {
                        isLoggedIn = true;
                        //user exists and password is matching
                        out.print("Ya iniciaste sesión!");
                        user User = new user();
                        User.setUserEmail(email);
                        userSession.setAttribute("user", User);
                        response.sendRedirect(request.getContextPath()+"/index.jsp");
                      }
                    else {
                        isLoggedIn = false;
                        // user exsts but wrong passwotd ask to CHANGE THE PASSWORD
                        message = "Password incorrecto...!";
                        messageDetail = "Password no coincide con el de la registración... Intenta iniciar sesión nuevamente con el password correcto";
                        out.println("wrong password Change the password now <a href = 'changeMyPassword.jsp'>Change</a>");
                        break;
                    }
                }
                else {
                    //or there no such email YOu do not exist with us Create an account now!!
                    out.println(" No existe una cuenta con este correo electrónico!");
                    message = "Correo electrónico no existe";
                    messageDetail = "Por favor registrate para iniciar a comprar!";
                    isLoggedIn = false;
                }
            }
            
            if (isLoggedIn == false){
                request.setAttribute("message", message);
                request.setAttribute("messageDetail", messageDetail);
                dispatchMessage.forward(request, response);
            }
        } catch (SQLException e) {
            out.println("Problema durante la ejecución...");
            //response.sendError(404);
            message = "A ocurrido un error durante tu inicio de sesión";
            messageDetail = "Lo sentimos muchopero ha ocurrido un error durante tu inicio de sesion. Por favor intenta de nuevo más tarde.";
                   
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
        
        } catch (Exception e) {
            out.println("Problema durante la ejecución...");
            //response.sendError(404);
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
