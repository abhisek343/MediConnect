<%-- 
    Document   : ViewData
    Created on : Feb 1, 2024, 1:06:52 PM
    Author : Abhisek
--%>
<%@page import="java.util.Base64"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.security.Key"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="DSAS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
      <title>MEDIconnect:a secure e-Healthcare System</title>
           
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link rel="stylesheet" href="css/table.css">

    </head>

    <%
                if (request.getParameter("Success") != null) {%>
    <script>alert('Medical Data Uploaded to cloud server');</script>  
    <%}
    %>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">

                <span class="spinner-rotate"></span>

            </div>
        </section>
        <!-- MENU -->
        <section class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a href="#" class="navbar-brand"><i class="fa fa-h-square"></i>&nbsp;MEDIconnect</a> 
                </div>

                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="DoctorHome.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="ViewPatientDetails.jsp" class="smoothScroll">Patients Details</a></li>
                        <li><a href="Search.jsp" class="smoothScroll">Search Patients</a></li>
                        <li><a href="RequestedPat.jsp" class="smoothScroll">Requested Patients</a></li>
                        <li><a href="SetUnavailabe.jsp" class="smoothScroll">Share Patients</a></li>
                        <li><a href="SharedPatients.jsp" class="smoothScroll">Shared Patients</a></li>
                         <li class="appointment-btn"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>

            </div>
        </section>
        <%
            String pid = request.getParameter("pid");
            String checkkey = request.getParameter("ss");
        %>

        <%!
            public static final String ALGO = "AES";
            public static final String key = "";
            public static byte[] keyValue = key.getBytes();
        %>
        <%!
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

        %>

        <%
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("Select * from medicalrecords where pid ='" + pid + "'");
            rs.next();
            String skey = rs.getString("skey");
            System.out.println("key " + skey);

            String mdetails = rs.getString("pmedications");
            String blood = rs.getString("blood");
            String bp = rs.getString("bp");
            String btemp = rs.getString("btemp");
            String pulserate = rs.getString("pulserate");
            String uploaddate = rs.getString("uploaddate");
            keyValue = skey.getBytes();
            String mdetail = decryption(mdetails);
            String blood1 = decryption(blood);
            String bp1 = decryption(bp);
            String btemp1 = decryption(btemp);
            String pulserate1 = decryption(pulserate);
            String uploaddate1 = decryption(uploaddate);

            if (skey.equalsIgnoreCase(checkkey) == false) {
                response.sendRedirect("ViewPatientDetails.jsp?Incorrect");
            }
        %>

        <!-- NEWS DETAIL -->
        <section id="appointment" data-stellar-background-ratio="3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-6">
                        <!-- CONTACT FORM HERE -->
                        <form id="appointment-form" role="form" method="post" action="MedicaldataUpdate">

                            <!-- SECTION TITLE -->
                            <div class="section-title wow fadeInUp" data-wow-delay="0.4s">
                                <center><h2>Patient data</h2></center>
                                <p>&nbsp;&nbsp;&nbsp;Unique Patient ID:  &nbsp;<strong style="color: red"><%=pid%></strong> </p>
                            </div>
                            <input type="hidden" value="<%=pid%>" name="pid">
                            <input type="hidden" value="<%=skey%>" name="skey">
                            <div class="wow fadeInUp" data-wow-delay="0.8s">
                                <div class="col-md-6 col-sm-6">
                                    <label for="name">Blood Group</label>
                                    <input type="text" class="form-control" id="name" value="<%=blood1%>" readonly="" name="blood" placeholder="Blood Group">
                                </div>

                                <div class="col-md-6 col-sm-6">
                                    <label for="email">Blood Pressure</label>
                                    <input type="text" class="form-control" id="email" value="<%=bp1%>"  readonly="" name="bp" placeholder="Blood Pressure">
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <label for="name">Body Temperature</label>
                                    <input type="text" class="form-control" id="name" value="<%=btemp1%>"  readonly="" name="btemp" placeholder="Body Temperature">
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <label for="email">Pulse Rate</label>
                                    <input type="text" class="form-control" id="email" value="<%=pulserate1%>"  readonly="" name="prate" placeholder="Pulse Rate" >
                                </div>

                                <div class="col-md-12 col-sm-12">
                                    <label for="date">Upload Date & Time</label>
                                    <input type="text" name="uploaddate" value="<%=uploaddate1%>"  readonly="" class="form-control">
                                    <label for="Message">Medications(Read/Write)</label>
                                    <textarea class="form-control" rows="3" id="message" name="mdetails" placeholder="Medications"><%=mdetail%></textarea>

                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <button type="submit" class="form-control" id="cf-submit" name="submit">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </section>



        <!-- FOOTER -->
        <footer data-stellar-background-ratio="5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 border-top">
                        <div class="col-md-4 col-sm-6">
                            <div class="copyright-text"> 
                                <p>Copyright &copy; 2024 e-Healthcare System 
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 text-align-center">
                            <div class="angle-up-btn"> 
                                <a href="#top" class="smoothScroll wow fadeInUp" data-wow-delay="1.2s"><i class="fa fa-angle-up"></i></a>
                            </div>
                        </div>   
                    </div>

                </div>
            </div>
        </footer>


        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>

