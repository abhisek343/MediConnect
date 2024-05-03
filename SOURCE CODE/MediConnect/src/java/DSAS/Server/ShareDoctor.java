/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DSAS.Server;

import DSAS.SQLconnection;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.security.Key;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Murthi
 */
public class ShareDoctor extends HttpServlet {
public static final String ALGO = "AES";
    public static byte[] keyValue = null;

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
            HttpSession session = request.getSession(true);
            String pid = request.getParameter("pid");
            String did = request.getParameter("did");
            System.out.println("pid " + pid);
            System.out.println("pid " + did);
            String sdid = (String) session.getAttribute("did");
            String srname = (String) session.getAttribute("dname");
            Connection conn = SQLconnection.getconnection();
            Statement st = conn.createStatement();
            Statement sto = conn.createStatement();
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("current Date " + time);
            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 16;
            String letters = "378AIJKLM5CD4NOP126EFGHB9";
            String val = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                val += letters.substring(index, index + 1);
            }
            try {
                ResultSet rs = st.executeQuery("select * from doctors where id='" + did + "'");
                rs.next();
                String rname = rs.getString("name");
                String rmail = rs.getString("email");

                ResultSet rs1 = sto.executeQuery("select * from medicalrecords where pid='" + pid + "'");
                rs1.next();
                
                String upfile = rs1.getString("patientdata");
                String enkey = rs1.getString("skey");

                keyValue = val.getBytes();
                String reenc = encryption(upfile);

                String sql = "insert into patientshare(did, dname, sdid, sdname, sdmail, pid, reencfile, dkey, rkey, time) values (?, ?, ?, ?, ?, ?,?,?,?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, sdid);
                statement.setString(2, srname);
                statement.setString(3, did);
                statement.setString(4, rname);
                statement.setString(5, rmail);
                statement.setString(6, pid);
                statement.setString(7, reenc);
                statement.setString(8, enkey);
                statement.setString(9, val);
                statement.setString(10, time);
                int row = statement.executeUpdate();
                if (row > 0) {
                    rs.close();
                    rs1.close();
                    System.out.println("success");
                    response.sendRedirect("DoctorHome.jsp?Shared");
                } else {
                    System.out.println("failed");
                    response.sendRedirect("DoctorHome.jsp?Failed");
                }

            } catch (IOException | SQLException e) {
                System.out.println("ProxyRE_Encryption.Server.FileShare.processRequest()" + e);
            } catch (Exception ex) {
                Logger.getLogger(ShareDoctor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShareDoctor.class.getName()).log(Level.SEVERE, null, ex);
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

    public static String encryption(String data) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encVal);
    }

    public static String decryption(String encryptedData) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.DECRYPT_MODE, key);
        byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
        byte[] decValue = c.doFinal(decordedValue);
        return new String(decValue);
    }

    public static Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, ALGO);
    }

    static void readWrite(RandomAccessFile raf, BufferedOutputStream bw, long numBytes) throws IOException {
        byte[] buf = new byte[(int) numBytes];
        int val = raf.read(buf);
        if (val != -1) {
            bw.write(buf);
        }
    }
}
