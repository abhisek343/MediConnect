/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DSAS.Server;

import DSAS.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Murthi
 */
public class MRApprove extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = request.getParameter("id");
            String pid = request.getParameter("pid");
            System.out.println("id  " + id);
            System.out.println("pid  " + pid);
            Random RANDOM = new SecureRandom();
            int kkk = 16;
            String gen = "B12JKLMNO45PKRSTUVXYEFZGHI367CD89A";
            String sk = "";
            for (int k = 0; k < kkk; k++) {
                int index = (int) (RANDOM.nextDouble() * gen.length());
                sk += gen.substring(index, index + 1);
            }
            Connection conn = SQLconnection.getconnection();
            Statement st = conn.createStatement();
            Statement sto = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from medicalrecords where pid='" + pid + "'");
            rs.next();
            String dkey = rs.getString("skey");
            try {
                int i = sto.executeUpdate("update mdatarequest set reqstatus='Approved',dkey='" + sk + "'  where id='" + id + "'");
                System.out.println("test print==" + id);
                if (i != 0) {
                    response.sendRedirect("DoctorRequest.jsp?Approved");
                } else {
                    System.out.println("failed");
                    response.sendRedirect("DoctorRequest.jsp?Failed");
                }
            } catch (IOException | SQLException ex) {
            }
        } catch (SQLException ex) {
            Logger.getLogger(MRApprove.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
