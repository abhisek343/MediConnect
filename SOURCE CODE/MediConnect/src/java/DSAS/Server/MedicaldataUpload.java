/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DSAS.Server;

import DSAS.FTPcon;
import DSAS.SQLconnection;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.security.Key;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
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
public class MedicaldataUpload extends HttpServlet {

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
            Random RANDOM = new SecureRandom();
            int kkk = 16;
            String gen = "B12JKLMNO45PKRSTUVXYEFZGHI367CD89A";
            String num = "";
            for (int k = 0; k < kkk; k++) {
                int index = (int) (RANDOM.nextDouble() * gen.length());
                num += gen.substring(index, index + 1);
            }
            String sk = num;
            keyValue = sk.getBytes();

            String pid = session.getAttribute("pid").toString();
            String spid = pid;
            String sname = session.getAttribute("pname").toString();
            String sphone = session.getAttribute("pphone").toString();
            String spmail = session.getAttribute("pmail").toString();
            String sblood = request.getParameter("blood");
            String sbp = request.getParameter("bp");
            String sprate = request.getParameter("prate");
            String sbtemp = request.getParameter("btemp");
            String suploaddate = request.getParameter("uploaddate");
            String smdetails = request.getParameter("mdetails");

            String pname = encryption(sname);
            String pphone = encryption(sphone);
            String pmail = encryption(spmail);
            String blood = encryption(sblood);
            String bp = encryption(sbp);
            String prate = encryption(sprate);
            String btemp = encryption(sbtemp);
            String uploaddate = encryption(suploaddate);
            String mdetails = encryption(smdetails);

            BufferedWriter bufferedWriter = null;

            String strContent = " Patient Id          : " + pid + "\n\n Patient Name          : " + sname + "\n\n Patient Phone          : " + sphone + ""
                    + "\n\n Blood Group          : " + sblood + "\n\n Blood Pressure          : " + sbp + "\n\n Pulse Rate          : " + sprate + "\n\n Body Temperature          : " + sbtemp + "\n\n Upload Date&Time          : " + suploaddate + ""
                    + "\n\n Medicine details          : " + smdetails + "";

            String encrypted = encryption(strContent);
            System.out.print("\nPlain Text             --------  " + strContent);
            System.out.print("\nEncrypted Text             --------  " + encrypted);

            File myFile = new File("D://" + pid + ".txt");
            // check if file exist, otherwise create the file before writing
            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            Writer writer = new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(writer);
            bufferedWriter.write(encrypted);

            if (bufferedWriter != null) {
                bufferedWriter.close();
            }


            System.out.println("pid" + pid + "blood" + blood + "sbp" + sbp + "sprate" + sprate + "sbtemp" + sbtemp + "suploaddate" + suploaddate);
            Connection conn = SQLconnection.getconnection();
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                ResultSet rs1 = st.executeQuery("select * from medicalrecords where pid='" + pid + "'");
                int count = 0;
                while (rs1.next()) {

                    count++;
                }

                if (count > 0) {
                    response.sendRedirect("UploadData.jsp?Already");
                    rs1.close();
                } else {
                    String sql = "insert into medicalrecords(pid, pname, pmail, pphone, blood, bp, btemp, pulserate, uploaddate, pmedications, skey,patientdata) values (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, pid);
                    statement.setString(2, pname);
                    statement.setString(3, pmail);
                    statement.setString(4, pphone);
                    statement.setString(5, blood);
                    statement.setString(6, bp);
                    statement.setString(7, btemp);
                    statement.setString(8, prate);
                    statement.setString(9, uploaddate);
                    statement.setString(10, mdetails);
                    statement.setString(11, sk);
                    statement.setString(12, encrypted);

                    int row = statement.executeUpdate();
                    if (row > 0) {
                        boolean status = new FTPcon().upload(myFile);
                        System.out.println("status " +status);
                        response.sendRedirect("UploadData.jsp?Success");
                    } else {
                        response.sendRedirect("UploadData.jsp?Failed");
                    }
                }

            } catch (SQLException ex) {
                System.out.println("HealthCare.Management.medicaldata.processRequest()"+ex);
            } catch (Exception ex) {
                Logger.getLogger(MedicaldataUpload.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MedicaldataUpload.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MedicaldataUpload.class.getName()).log(Level.SEVERE, null, ex);
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
}
