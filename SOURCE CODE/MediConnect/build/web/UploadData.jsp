<%-- 
    Document   : UploadData
    Created on : Jan 31, 2024, 9:55:25 PM
    Author : Abhisek
--%>
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

    </head>
    
            <%
        if (request.getParameter("Success") != null) {%>
    <script>alert('Medical Data Uploaded to cloud server');</script>  
    <%}
    %>
            <%
        if (request.getParameter("Already") != null) {%>
    <script>alert('Medical Data Already Uploaded');</script>  
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
                        <li><a href="PatientHome.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="UploadData.jsp" class="smoothScroll">Upload Data</a></li>
                        <li><a href="MedicalData.jsp" class="smoothScroll">Medical Data</a></li>
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
                    <div class="col-md-12 col-sm-6">
                         <!-- CONTACT FORM HERE -->
                         <form id="appointment-form" role="form" method="post" action="MedicaldataUpload">

                              <!-- SECTION TITLE -->
                              <div class="section-title wow fadeInUp" data-wow-delay="0.4s">
                                  <center><h2>Patient data</h2></center>
                                  <p>&nbsp;&nbsp;&nbsp;Unique Patient ID:  &nbsp;<strong style="color: red"><%=session.getAttribute("pid").toString()%></strong> </p>
                              </div>

                              <div class="wow fadeInUp" data-wow-delay="0.8s">
                                   <div class="col-md-6 col-sm-6">
                                        <label for="name">Blood Group</label>
                                        <input type="text" class="form-control" id="name" name="blood" placeholder="Blood Group">
                                   </div>

                                   <div class="col-md-6 col-sm-6">
                                        <label for="email">Blood Pressure</label>
                                        <input type="text" class="form-control" id="email" name="bp" placeholder="Blood Pressure">
                                   </div>
                                   <div class="col-md-6 col-sm-6">
                                        <label for="name">Body Temperature</label>
                                        <input type="text" class="form-control" id="name" name="btemp" placeholder="Body Temperature">
                                   </div>
                                   <div class="col-md-6 col-sm-6">
                                        <label for="email">Pulse Rate</label>
                                        <input type="text" class="form-control" id="email" name="prate" placeholder="Pulse Rate" >
                                   </div>

                                   <div class="col-md-12 col-sm-12">
                                       <label for="date">Upload Date & Time</label>
                                        <input type="text" name="uploaddate" value="<%=date%>" class="form-control">
                                        <label for="Message">Previous Medications</label>
                                        <textarea class="form-control" rows="3" id="message" name="mdetails" placeholder="Previous Medications">NA</textarea>
                                        
                                   </div>
                                        <div class="col-md-4 col-md-offset-4">
                                        <button type="submit" class="form-control" id="cf-submit" name="submit">Upload</button>
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