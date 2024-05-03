<%-- 
    Document   : ViewPatientDetails
    Created on : Feb 1, 2024, 10:17:27 AM
    Author : Abhisek
--%>
<%@page import="java.sql.ResultSet"%>
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
        if (request.getParameter("Incorrect") != null) {%>
    <script>alert('Incorrect Key');</script>  
    <%}
    %>
            <%
        if (request.getParameter("Updated") != null) {%>
    <script>alert('Medications Updated');</script>  
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
long millis = System.currentTimeMillis();  
      
    // creating a new object of the class Date  
    java.util.Date date = new java.util.Date(millis);      
    System.out.println(date);   
%>

     <!-- NEWS DETAIL -->
     <section id="appointment" data-stellar-background-ratio="3">
          <div class="container">
               <div class="row">
                    <center><h2>Medical Records</h2></center>
                        <br> <br> <br>
<!--                        <div style="margin: auto;padding: 10px;width: 1000px;overflow: scroll;height: auto" >-->
                        <table id="naresh" style="margin: auto;padding: 10px;">
                            <tr>
                                <th>Id</th>
                                <th>Blood Group</th>
                                <th>Blood Pressure</th>
                                <th>Body Temperature</th>
                                <th>Pulse Rate</th>
                                <th>Upload date</th>
                                <th>Medications</th>
                                <th>Secret Key</th>
                                <th>Action</th>
                            </tr>
                            <%
                                
                                String did=session.getAttribute("did").toString();
                                
                                Connection con = SQLconnection.getconnection();
                                Statement st = con.createStatement();
                                try {
                                    ResultSet rs = st.executeQuery("Select * from medicalrecords where did='"+did+"'");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("id")%></td>
                                <td><textarea class="form-control" readonly="" rows="3" id="message"><%=rs.getString("blood")%></textarea></td>
                                <td><textarea class="form-control" readonly="" rows="3" id="message"><%=rs.getString("bp")%></textarea></td>
                                <td><textarea class="form-control" readonly="" rows="3" id="message"><%=rs.getString("btemp")%></textarea></td>
                                <td><textarea class="form-control" readonly="" rows="3" id="message"><%=rs.getString("pulserate")%></textarea></td>
                                <td><textarea class="form-control" readonly="" rows="3" id="message"><%=rs.getString("uploaddate")%></textarea></td>
                                <td><textarea class="form-control" readonly="" rows="3" id="message"><%=rs.getString("pmedications")%></textarea></td>
                                <td><%=rs.getString("skey")%></td>
                                <td><a href="ReportDownload.jsp?pid=<%=rs.getString("pid")%>" class="btn btn-primary">View Report</a></td>
                            </tr>
                            <%                                        }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </table>

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
