<%-- 
    Document   : Search
    Created on : Feb 3, 2024, 4:02:32 PM
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
     <%
        if (request.getParameter("Sent") != null) {%>
    <script>alert('Data Request Sent');</script>  
    <%}
    %>
     <%
        if (request.getParameter("Already") != null) {%>
    <script>alert('Already you are handling the patient');</script>  
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
                        <div style="margin: auto;padding: 10px;">
                            <div class="main_div">
                            <div class="buttons" style="margin-left: 340px">
                                <a href="#" onclick="divVisibility('Div1');">Search By Name</a> | 
                                <a href="#" onclick="divVisibility('Div2');">Search By Phone</a> | 
                                <a href="#" onclick="divVisibility('Div3');">Search By Patient ID</a> | 
                            </div>
                            <br>
                            <br>
                            <div class="inner_div">

                                <div class="col-lg-6 col-8" id="Div1" style="margin-left: 300px">

                                    <form class="custom-form volunteer-form mb-5 mb-lg-0" action="sname.jsp" method="post" role="form">
                                        <center><h3 class="mb-4">Search By Name</h3></center>
                                        <br>

                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" class="form-control bg-light border-0" name="sname" required="" id="volunteer-name"  placeholder="Search Name" style="height: 55px;">
                                            </div>
                                        </div>
                                        <br>
                                        <center><div class="col-5">
                                          <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                            </div></center>
                                    </form>
                                </div>
                                <div class="col-lg-6 col-8" id="Div2"  style="margin-left: 300px;display: none;">

                                    <form class="custom-form volunteer-form mb-5 mb-lg-0" action="sphone.jsp" method="post" role="form">
                                        <center><h3 class="mb-4">Search By Phone</h3></center>
                                            <br>

                                        <div class="row">
                                            <div class="col-12">
                                               <input type="text" class="form-control bg-light border-0" name="sphone" required="" id="volunteer-name"  placeholder="Search Phone" style="height: 55px;">
                                            </div>
                                        </div>
                                        <br>
                                       <center><div class="col-5">
                                          <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                            </div></center>
                                    </form>

                                </div>
                                <div class="col-lg-6 col-8" id="Div3"  style="margin-left: 300px;display: none;">

                                    <form class="custom-form volunteer-form mb-5 mb-lg-0" action="spid.jsp" method="post" role="form">
                                        <center><h3 class="mb-4">Search By Patient ID</h3></center>
                                            <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                               <input type="text" class="form-control bg-light border-0" name="spid" required="" id="volunteer-name"  placeholder="Search Patient ID" style="height: 55px;">
                                            </div>
                                        </div>
                                        <br>
                                        <center><div class="col-5">
                                          <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                            </div></center>
                                    </form>

                                </div>
                            </div>
                        </div>
                        </div>

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
     <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
 <script>
            var divs = ["Div1", "Div2", "Div3"];
            var visibleDivId = null;
            function divVisibility(divId) {
                if (visibleDivId === divId) {
                    visibleDivId = null;
                } else {
                    visibleDivId = divId;
                }
                hideNonVisibleDivs();
            }
            function hideNonVisibleDivs() {
                var i, divId, div;
                for (i = 0; i < divs.length; i++) {
                    divId = divs[i];
                    div = document.getElementById(divId);
                    if (visibleDivId === divId) {
                        div.style.display = "block";
                    } else {
                        div.style.display = "none";
                    }
                }
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

</body>
</html>
