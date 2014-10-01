/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loginRegister;

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
public class registerServlet extends HttpServlet {

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
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        message = null;
        messageDetail = null;
        String email, pass, passAgain;
        boolean isRegistered = false;

        String messageUrl = "/message.jsp";
        RequestDispatcher dispatchMessage =
                request.getServletContext().getRequestDispatcher(messageUrl);

        email = request.getParameter("emailReg");
        pass = request.getParameter("passReg");
        passAgain = request.getParameter("passAgainReg");
        EmailValidator validator = new EmailValidator();
        boolean isEmailValid = validator.validate(email);

        String ipAdd = request.getRemoteAddr();

        PrintWriter out = response.getWriter();

        HttpSession userSession = request.getSession();

        try {
            DB_Conn con = new DB_Conn();
            Connection c = con.getConnection();
            if ((request.getParameter("emailReg") != null) || (request.getParameter("emailReg") != null)){
                if (isEmailValid) {
                    if (pass.length() > 16) {//contraseña de 16 caractereres
                        if (pass.equals(passAgain)) {
                            // then the user is registered and a session is 

                            String sql = "INSERT INTO  `mayoristasnic`.`user` "
                                    + "(`user_id` ,`email` ,`pass` ,`registeredOn`) "
                                    + "VALUES (NULL ,  ?, SHA1(  ? ) , NOW( )); ";

                            PreparedStatement psmt = c.prepareStatement(sql);

                            psmt.setString(1, email);

                            psmt.setString(2, pass);

                            int i = psmt.executeUpdate();

                            if (i == 1) {
                                isRegistered = true;
                                out.println("Ya estas registrado! ");
                                user User = new user();
                                User.setUserEmail(email);
                                userSession.setAttribute("user", User);
                                response.sendRedirect(request.getContextPath());
                            } else {
                                isRegistered = false;
                                out.println("No has podido ser registrado");
                            }

                        } //Else both passwords do not match
                        else {
                            isRegistered = false;
                            message = "Passwords no son iguales";
                            messageDetail = "Por favor ingresa el password correcto en ambas casillas";
                            out.print("Registro sin éxito!  ambos passwords no coinciden!");

                        }
                    } //or the paasword length is less than 7
                    else {
                        isRegistered = false;
                        message = "La cantidad de caracteres del password debe ser al menos 16 caracteres";
                        messageDetail = "Por favor ingresa un password con una longitud mínima de 16 caracteres alfanuméricos";
                        out.print("Registro sin éxito!!! La longitud de la contraseña es menor a 16 caracteres");
                    }
                } //or email is wrong
                else {
                    isRegistered = false;
                    message = "No has ingresado tu correo electrónico";
                    messageDetail = "Por favor ingresa un correo electrónico válido";
                    out.print(" Registro sin éxito!!! correo electrónico incorrecto");
                }
            }
            else {
                isRegistered = false;
                message = "Ingresa un correo electrónico y un password para tu cuenta";
                messageDetail = "Por favor ingresa un correo electrónico. Tu cuenta aún no ha sido creada";
            }
            
            if (isRegistered == false) {
                request.setAttribute("message", message);
                request.setAttribute("messageDetail", messageDetail);
                dispatchMessage.forward(request, response);
            }

            //try ends here
        } catch (SQLIntegrityConstraintViolationException ex) {
            // user exsts but wrong passwotd ask to CHANGE THE PASSWORD
            messageDetail = ex.getMessage();
            message = "Ya había sido registradi previamente. Ingresa el password correcto nuevamente, sino intenta cambiar tu password...";
            out.print("Registro sin éxito!!!" + ex);
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
        } catch (Exception ex) {
            messageDetail = ex.getMessage();
            message = "Hubo un problema durante tu registración. Intenta registrarte más tarde...";
            out.print("Registro sin éxito!!!" + ex);
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
            response.sendError(404);
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
