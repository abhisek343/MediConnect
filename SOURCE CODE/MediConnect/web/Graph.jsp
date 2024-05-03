<%-- 
    Document   : Graph
    Created on : Feb 3, 2024, 8:45:00 PM
    Author : Abhisek
--%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
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
    <script>alert('Doctor Assigned for patient ');</script>  
    <%}
    %>
    <%
        if (request.getParameter("Approved") != null) {%>
    <script>alert('Access Approved');</script>  
    <%}
    %>
    <%
        if (request.getParameter("Rejected") != null) {%>
    <script>alert('Access Rejected');</script>  
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
                        <li><a href="CSHome.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="PatientsActivation.jsp" class="smoothScroll">Patients Activation</a></li>
                        <li><a href="DoctorsActivation.jsp" class="smoothScroll">Doctors Activation</a></li>
                        <li><a href="PatientsDetails.jsp" class="smoothScroll">Patients</a></li>
                        <li><a href="DoctorsDetails.jsp" class="smoothScroll">Doctors</a></li>
                        <li><a href="CloudFiles.jsp" class="smoothScroll">Files</a></li>
                        <li><a href="AssignDoctors.jsp" class="smoothScroll">Assign Doctors</a></li>
                        <li><a href="DoctorRequest.jsp" class="smoothScroll">Doctor Request</a></li>
                        <li><a href="Graph.jsp" class="smoothScroll">Graph</a></li>
                        <li class="appointment-btn"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>

            </div>
        </section>
        <%!
            public static final String ALGO = "AES";
           
            public static byte[] keyValue = null;
        %>

        <%
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

            String testdata = "Time Check";

            long EsTime = System.nanoTime();
          String testData1= encryption(testdata);

            long encryption_extime = (System.nanoTime() - EsTime) / 100000;

            long DsTime = System.nanoTime();
            decryption(testData1);

            long decryption_extime = (System.nanoTime() - DsTime) / 100000;


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
        <!-- NEWS DETAIL -->
        <section id="appointment" data-stellar-background-ratio="3">
            <div class="container">
                <div class="row">
                    <br> <br> <br>
                    <div id="chartContainer" style="height: 500px; width: 100%;"></div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Cryptographic Time"
                    },
                    axisY: {
                        title: "Time(ms)"
                    },
                    data: [{
                            type: "column",
                            showInLegend: true,
                            legendMarkerColor: "grey",
                            legendText: "Time Graph",
                            dataPoints: [
                                {y: <%=encryption_extime%>, label: "Encryption Time"},
                                {y: <%=decryption_extime%>, label: "Decryption Time"}
                            ]
                        }]
                });
                chart.render();

            }
        </script>


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
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
</html>


