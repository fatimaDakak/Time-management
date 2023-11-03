<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>NORTECH</title>
  <meta charset="UTF-8">
      <link rel="icon" type="image/x-icon" href="././images/Nortech.png" />
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="././vendors/owl-carousel/css/owl.carousel.min.css">
  <link rel="stylesheet" href="././vendors/owl-carousel/css/owl.theme.default.css">
  <link rel="stylesheet" href="././vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="././vendors/aos/css/aos.css">
  <link rel="stylesheet" href="././css/style.min.css">
</head>
<body id="body" data-spy="scroll" data-target=".navbar" data-offset="100">
  <header id="header-section">
    <nav class="navbar navbar-expand-lg pl-3 pl-sm-0" id="navbar">
    <div class="container">
      <div class="navbar-brand-wrapper d-flex w-100">
<h4><strong><a href="#header-section" style="color: #8c7be5;">NOR</strong>TECH <span class="sr-only"></span></a></h4>
        <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="mdi mdi-menu navbar-toggler-icon"></span>
        </button> 
      </div>
      <div class="collapse navbar-collapse navbar-menu-wrapper" id="navbarSupportedContent">
        <ul class="navbar-nav align-items-lg-center align-items-start ml-auto">
          <li class="d-flex align-items-center justify-content-between pl-4 pl-lg-0">
            <div class="navbar-collapse-logo">
            </div>
            <button class="navbar-toggler close-button" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="mdi mdi-close navbar-toggler-icon pl-5"></span>
            </button>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#header-section">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#features-section">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#digital-marketing-section">Blog</a>  
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#feedback-section">Testimonials</a>
          </li>
          <li class="nav-item btn-contact-us pl-4 pl-lg-0">
<li class="nav-item btn-contact-us pl-4 pl-lg-0">
    <% if (session.getAttribute("user") != null) { 
        User user = (User) session.getAttribute("user");
        String role = user.getRole();
        if (role.equals("admin")) { %>
            <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'">
                <a href="Logout" style="color: white; text-decoration: none;">Log Out</a>
            </button>
            <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'">
                <a href="Dashboard" style="color: white; text-decoration: none;">Dashboard</a>
            </button>
        <% } else if (role.equals("employee")) { %>
            <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'">
                <a href="Logout" style="color: white; text-decoration: none;">Log Out</a>
            </button>
            <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'">
                <a href="WorkHours" style="color: white; text-decoration: none;">WorkHours</a>
            </button>
        <% }
    } else { %>
        <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'">
            <a href="Login" style="color: white; text-decoration: none;">Log in</a>
        </button>
    <% } %>
</li>

</li>
        </ul>
      </div>
    </div> 
    </nav>   
  </header>
  <div class="banner" >
    <div class="container">
      <h1 class="font-weight-semibold">Goal Management &<br>To-Do Lists.</h1>
      <h6 class="font-weight-normal text-muted pb-3">GoalGrid is an intuitive application with a user-friendly design <br> that simplifies all your goal management needs.</h6>
      <div>
        <button class="btn btn-opacity-light mr-1"><a href="WorkHours">WorkHours</a></button>
      </div>
      <img src="images/Group171.svg" alt="" class="img-fluid"> 
    </div>
  </div>
  <div class="content-wrapper">
    <div class="container">
      <section class="features-overview" id="features-section" >
        <div class="content-header">
          <h2>How does it works</h2>
          <h6 class="section-subtitle text-muted">GoalGrid operates as a comprehensive toolkit, simplifying your operational tasks to meet your specific customer needs.</h6>
        </div>
        <div class="d-md-flex justify-content-between">
          <div class="grid-margin d-flex justify-content-start">
            <div class="features-width">
              <img src="./images/Group12.svg" alt="" class="img-icons">
              <h5 class="py-3">Optimisation</h5>
              <p class="text-muted">We prioritize optimization to enhance your results, ensuring that every aspect of your work is fine-tuned for success.</p>
            </div>
          </div>
          <div class="grid-margin d-flex justify-content-center">
            <div class="features-width">
              <img src="images/Group7.svg" alt="" class="img-icons">
              <h5 class="py-3">Enterprise Task  <br>Management</h5>
              <p class="text-muted">Optimize your enterprise's task management with GoalGrid, streamlining operations for improved efficiency and productivity.</p>            </div>
          </div>
          <div class="grid-margin d-flex justify-content-end">
            <div class="features-width">
              <img src="images/Group5.svg" alt="" class="img-icons">
              <h5 class="py-3">Content<br>Creation</h5>
              <p class="text-muted">Elevate your outreach and engagement through impactful content creation and dynamic marketing strategies.</p>
            </div>
          </div>
        </div>
      </section>     
      <section class="digital-marketing-service" id="digital-marketing-section">
        <div class="row align-items-center">
          <div class="col-12 col-lg-7 grid-margin grid-margin-lg-0" data-aos="fade-right">
            <h3 class="m-0">Complete Task Management Solution!</h3>
            <div class="col-lg-7 col-xl-6 p-0">
              <p class="py-4 m-0 text-muted">Discover a comprehensive task management application that streamlines your workflow and helps you efficiently manage tasks. From to-do lists to task prioritization.</p>
              <p class="font-weight-medium text-muted">We've got your task management needs covered</p>
            </div>    
          </div>
          <div class="col-12 col-lg-5 p-0 img-digital grid-margin grid-margin-lg-0" data-aos="fade-left">
            <img src="images/Group1.png" alt="" class="img-fluid">
          </div>
        </div>
        <div class="row align-items-center">
          <div class="col-12 col-lg-7 text-center flex-item grid-margin" data-aos="fade-right">
            <img src="images/Group2.png" alt="" class="img-fluid">
          </div>
          <div class="col-12 col-lg-5 flex-item grid-margin" data-aos="fade-left">
            <h3 class="m-0">Your Ultimate <br>Task Management Companion.</h3>
            <div class="col-lg-9 col-xl-8 p-0">
              <p class="py-4 m-0 text-muted">Equipped with a range of powerful features and meticulously optimized, our application is your go-to solution for effective task management.</p>
              <p class="pb-2 font-weight-medium text-muted">Its intelligent functionalities make it a standout tool for all your task-related needs.</p>
            </div>
          </div>
        </div>
      </section>     
    
      <section class="contact-us" id="contact-section">
        <div class="contact-us-bgimage grid-margin" >
          <div class="pb-4">
            <h4 class="px-3 px-md-0 m-0" data-aos="fade-down">Do you have any projects?</h4>
            <h4 class="pt-1" data-aos="fade-down">Manage your tasks</h4>
          </div>
          <div data-aos="fade-up">
            <button  class="btn btn-rounded btn-outline-danger"><a href="AddItem">Add task</a></button>
          </div>          
        </div>
      </section>
      <section class="contact-details" id="contact-details-section">
        <div class="row text-center text-md-left">
          <div class="col-12 col-md-6 col-lg-3 grid-margin">
          <h4 class="pb-2"><strong>GoalGrid</strong></h4>
            <div class="pt-2">
              <p class="text-muted m-0">contact@goalgrid.com</p>
              <p class="text-muted m-0">0607080900</p>
            </div>         
          </div>
          <div class="col-12 col-md-6 col-lg-3 grid-margin">
            <h5 class="pb-2">Get in Touch</h5>
            <p class="text-muted">Stay updated with our latest templates and extensions</p>
          </div>         
          

          <div class="col-12 col-md-6 col-lg-3 grid-margin">
            <h5 class="pb-2">Our Guidelines</h5>
            <a href="#"><p class="m-0 pb-2">Terms</p></a>   
            <a href="#" ><p class="m-0 pt-1 pb-2">Privacy policy</p></a> 
            <a href="#"><p class="m-0 pt-1 pb-2">Cookie Policy</p></a> 
            <a href="#"><p class="m-0 pt-1">Discover</p></a> 
         </div>         
          
         
          <div class="col-12 col-md-6 col-lg-3 grid-margin">
              <h5 class="pb-2">Our address</h5>
              <p class="text-muted">National School of Applied Science<br> Tetouan.</p>
              <div class="d-flex justify-content-center justify-content-md-start">
                <a href="#"><span class="mdi mdi-facebook"></span></a>
                <a href="#"><span class="mdi mdi-twitter"></span></a>
                <a href="#"><span class="mdi mdi-instagram"></span></a>
                <a href="#"><span class="mdi mdi-linkedin"></span></a>
              </div>
          </div>
        </div>  
      </section>
      <footer class="border-top">
        <p class="text-center text-muted pt-4">Copyright © 2023<a href="#" class="px-1">NORTECH.</a>All rights reserved.</p>
      </footer>
      <!-- Modal for Contact - us Button -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="exampleModalLabel">Contact Us</h4>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="Name">Name</label>
                  <input type="text" class="form-control" id="Name" placeholder="Name">
                </div>
                <div class="form-group">
                  <label for="Email">Email</label>
                  <input type="email" class="form-control" id="Email-1" placeholder="Email">
                </div>
                <div class="form-group">
                  <label for="Message">Message</label>
                  <textarea class="form-control" id="Message" placeholder="Enter your Message"></textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success">Submit</button>
            </div>
          </div>
        </div>
      </div>
    </div> 
  </div>
  <script src="././vendors/jquery/jquery.min.js"></script>
  <script src="././vendors/bootstrap/bootstrap.min.js"></script>
  <script src="././vendors/owl-carousel/js/owl.carousel.min.js"></script>
  <script src="././vendors/aos/js/aos.js"></script>
  <script src="././js/landingpage.js"></script>
</body>
</html>