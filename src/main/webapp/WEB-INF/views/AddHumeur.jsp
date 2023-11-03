<%@page import="jakarta.servlet.annotation.WebServlet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="././assets/" data-template="vertical-menu-template-free">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
        <title>NORTECH</title>
      <link rel="icon" type="image/x-icon" href="././images/Nortech.png" />
        <meta name="description" content="" />
        
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="././assets/vendor/fonts/boxicons.css" />
        <link rel="stylesheet" href="././assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="././assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="././assets/css/demo.css" />
        <link rel="stylesheet" href="././assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
        <script src="././assets/vendor/js/helpers.js"></script>
        <script src="././assets/js/config.js"></script>
    </head>
    <body>
        <header id="header-section" class="text-center">
            <nav class="navbar navbar-expand-lg" id="navbar" style="margin-bottom: 50px;">
                <div class="container">
                    <div class="navbar-brand-wrapper d-flex w-100">
                    </div>
                </div>
            </nav>
            <div class="container-fluid px-md-5">
                <div class="row justify-content-between">
                    <div class="col-md-8 order-md-last">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <h3><strong><a href="./" style=" font-family: 'Poppins', sans-serif; color: #8c7be5; margin-top: 100px;">NOR</strong>TECH<span class="sr-only"></span></a></h3>
                            </div>
                            <div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex">
                        <div class="social-media">
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="layout-wrapper layout-content-navbar layout-without-menu">
            <div class="layout-container">
                <div class="layout-page">
                    <div class="content-wrapper" >
                      
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="card mb-4">
                                <center><h3 class="card-header" style="font-family: 'Poppins', sans-serif; font-weight: bold;">Daily Mood Feedback Form</h3></center>
                                <div class="card-body">
                                    <div class="row gy-3 align-items-center">
                                        <div class="col-md-6 text-center">
                                            <img src="images/form.png" alt="girl-doing-yoga-light" class="img-fluid rounded" style="max-width: 70%;" />
                                        </div>
                                        <div class="col-md-6">
                                            <form action="AddHumeur" method="post">
                                              <label for="humeur" class="fs-4"> <strong>How is your day ? </strong></label>
                                              <div class="form-check fs-5" style="margin-top: 30px;">
                                                <input class="form-check-input" type="radio" name="humeur" value="happy" id="happyRadio" >
                                                    <label class="form-check-label" for="happyRadio"> Happy <span class="emoji" id="happyEmoji"></span></label>
                                                </div>
                                                <br>
                                                <div class="form-check fs-5">
                                                    <input class="form-check-input" type="radio" name="humeur" value="sad" id="sadRadio">
                                                    <label class="form-check-label" for="sadRadio"> Sad <span class="emoji" id="sadEmoji"></span></label>
                                                </div>
                                                <br>
                                                <div class="form-check fs-5">
                                                    <input class="form-check-input" type="radio" name="humeur" value="angry" id="angryRadio">
                                                    <label class="form-check-label" for="angryRadio"> Angry <span class="emoji" id="angryEmoji"></span></label>
                                                </div>
                                                <br>
                                                <div class="form-check fs-5">
                                                    <input class="form-check-input" type="radio" name="humeur" value="calm" id="calmRadio">
                                                    <label class="form-check-label" for="calmRadio"> Calm <span class="emoji" id="calmEmoji"></span></label>
                                                </div>
                                                <textarea name="tokenn" rows="5" cols="40" hidden><%= request.getAttribute("token")%></textarea>
                                                <br >
                                                <input type="submit" value="Soumettre" class="btn btn-primary fs-5">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="content-footer footer bg-footer-theme">
                          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                              ©
                              
                              <a href="./" target="_blank" class="footer-link fw-bolder">NorTech</a>
                            </div>
                          </div>
                        </footer>
                        <div class="content-backdrop fade"></div>
                    </div>
                </div>
            </div>
        </div>
        <script src="././assets/vendor/libs/jquery/jquery.js"></script>
        <script src="././assets/vendor/libs/popper/popper.js"></script>
        <script src="././assets/vendor/js/bootstrap.js"></script>
        <script src="././assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="././assets/vendor/js/menu.js"></script>
        <script>
          function displayEmoji(mood) {
              var emojiElement = document.getElementById(mood + "Emoji");
              emojiElement.innerHTML = getEmoji(mood);
          }
    
          function clearEmoji(mood) {
              var emojiElement = document.getElementById(mood + "Emoji");
              emojiElement.innerHTML = "";
          }
    
          function getEmoji(mood) {
              switch (mood) {
                  case "happy":
                      return "😄";
                  case "sad":
                      return "😢";
                  case "angry":
                      return "😡";
                  case "calm":
                      return "😌";
                  default:
                      return "";
              }
          }
    
          document.getElementById("happyRadio").addEventListener("click", function () {
              clearEmoji("sad");
              clearEmoji("angry");
              clearEmoji("calm");
              displayEmoji("happy");
          });
    
          document.getElementById("sadRadio").addEventListener("click", function () {
              clearEmoji("happy");
              clearEmoji("angry");
              clearEmoji("calm");
              displayEmoji("sad");
          });
    
          document.getElementById("angryRadio").addEventListener("click", function () {
              clearEmoji("happy");
              clearEmoji("sad");
              clearEmoji("calm");
              displayEmoji("angry");
          });
    
          document.getElementById("calmRadio").addEventListener("click", function () {
              clearEmoji("happy");
              clearEmoji("sad");
              clearEmoji("angry");
              displayEmoji("calm");
          });
      </script>
      <!-- ... (remaining code) ... -->
    </body>
    </html>
    
      
     
      
    
  <!-- ... (remaining code) ... -->
</body>
</html>

  
 
  
