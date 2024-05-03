<%-- 
    Document   : index
    Created on : Jan 28, 2024, 12:32:30 PM
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
                        <li><a href="index.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="Patients.jsp" class="smoothScroll">Patients</a></li>
                        <li><a href="Doctors.jsp" class="smoothScroll">Doctors</a></li>
                         <li class="appointment-btn"><a href="CS.jsp">Cloud Server</a></li>
                    </ul>
                </div>

            </div>
        </section>


        <!-- HOME -->
        <section id="home" class="slider" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row">

                    <div class="owl-carousel owl-theme">
                        <div class="item item-first">
                            <div class="caption">
                                <div class="col-md-offset-1 col-md-10">
                                    <h3>Let's make your life happier</h3>
                                    <h1>Healthy Living</h1>
                                    <a href="#team" class="section-btn btn btn-default smoothScroll">Meet Our Doctors</a>
                                </div>
                            </div>
                        </div>

                        <div class="item item-second">
                            <div class="caption">
                                <div class="col-md-offset-1 col-md-10">
                                      <h3>Let's make your life happier</h3>
                                    <h1>New Lifestyle</h1>
                                    <a href="#about" class="section-btn btn btn-default btn-gray smoothScroll">More About Us</a>
                                </div>
                            </div>
                        </div>

                        <div class="item item-third">
                            <div class="caption">
                                <div class="col-md-offset-1 col-md-10">
                                     <h3>Let's make your life happier</h3>
                                    <h1>Your Health Benefits</h1>
                                    <a href="#news" class="section-btn btn btn-default btn-blue smoothScroll">Read Stories</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>


        <!-- ABOUT -->
        <section id="about">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-sm-6">
                        <div class="about-info">
                            <h2 class="wow fadeInUp" data-wow-delay="0.6s">Welcome to Your <i class="fa fa-h-square"></i>ealth Center</h2>
                            <div class="wow fadeInUp" data-wow-delay="0.8s">
                            </div>
                            <figure class="profile wow fadeInUp" data-wow-delay="1s">
                                <img src="images/author-image.jpg" class="img-responsive" alt="">
                                <figcaption>
                                    <h3>Dr. Neil Jackson</h3>
                                    <p>General Principal</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>

                </div>
            </div>
        </section>


        <!-- TEAM -->
        <section id="team" data-stellar-background-ratio="1">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-sm-6">
                        <div class="about-info">
                            <h2 class="wow fadeInUp" data-wow-delay="0.1s">Our Doctors</h2>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="col-md-4 col-sm-6">
                        <div class="team-thumb wow fadeInUp" data-wow-delay="0.2s">
                            <img src="images/team-image1.jpg" class="img-responsive" alt="">

                            <div class="team-info">
                                <h3>Nate Baston</h3>
                                <p>General Principal</p>
                                <div class="team-contact-info">
                                    <p><i class="fa fa-phone"></i> 010-020-0120</p>
                                    <p><i class="fa fa-envelope-o"></i> <a href="#">general@company.com</a></p>
                                </div>
                                <ul class="social-icon">
                                    <li><a href="#" class="fa fa-linkedin-square"></a></li>
                                    <li><a href="#" class="fa fa-envelope-o"></a></li>
                                </ul>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="team-thumb wow fadeInUp" data-wow-delay="0.4s">
                            <img src="images/team-image2.jpg" class="img-responsive" alt="">

                            <div class="team-info">
                                <h3>Jason Stewart</h3>
                                <p>Pregnancy</p>
                                <div class="team-contact-info">
                                    <p><i class="fa fa-phone"></i> 010-070-0170</p>
                                    <p><i class="fa fa-envelope-o"></i> <a href="#">pregnancy@company.com</a></p>
                                </div>
                                <ul class="social-icon">
                                    <li><a href="#" class="fa fa-facebook-square"></a></li>
                                    <li><a href="#" class="fa fa-envelope-o"></a></li>
                                    <li><a href="#" class="fa fa-flickr"></a></li>
                                </ul>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="team-thumb wow fadeInUp" data-wow-delay="0.6s">
                            <img src="images/team-image3.jpg" class="img-responsive" alt="">

                            <div class="team-info">
                                <h3>Miasha Nakahara</h3>
                                <p>Cardiology</p>
                                <div class="team-contact-info">
                                    <p><i class="fa fa-phone"></i> 010-040-0140</p>
                                    <p><i class="fa fa-envelope-o"></i> <a href="#">cardio@company.com</a></p>
                                </div>
                                <ul class="social-icon">
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-envelope-o"></a></li>
                                </ul>
                            </div>

                        </div>
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
        <script src="js/wow.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>