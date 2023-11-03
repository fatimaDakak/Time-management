<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="././assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>NORTECH</title>

    <meta name="description" content="" />

    <link rel="icon" type="image/x-icon" href="././images/Nortech.png" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="././assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="././assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="././assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="././assets/css/demo.css" />
    <link rel="stylesheet" href="././assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="././assets/vendor/css/pages/page-auth.css" />
    <script src="././assets/vendor/js/helpers.js"></script>
    <script src="././assets/js/config.js"></script>
  </head>

  <body>

    <%
    String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) {
    %>
    
     <div class="alert alert-danger alert-dismissible" role="alert">
          <%=error%>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    
    <%
    request.removeAttribute("error");
    }
    %>
    <%
    String success = (String) request.getAttribute("created");
    if (success != null && !success.isEmpty()) {
    %>
    
     <div class="alert alert-success alert-dismissible" role="alert">
          <%=success%>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    
    <%
    request.removeAttribute("created");
    }
    %>

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="./" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                      <img src="././images/Nortech.png" width="140">
                  </span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">Welcome to NorTech! 👋</h4>
              <p class="mb-4">Please sign-in to your account and start the adventure</p>

              <form id="formAuthentication" class="mb-3" action="Login" method="POST">
                <div class="mb-3">
                  <label for="email" class="form-label">Email Address</label>
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email_user"
                    placeholder="Enter your email address"
                    autofocus
                  />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">Password</label>
                    <a href="auth-forgot-password-basic.html">
                      <small>Forgot Password?</small>
                    </a>
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="mdp"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> Remember Me </label>
                  </div>
                </div>
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="submit">Sign in</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="././assets/vendor/libs/jquery/jquery.js"></script>
    <script src="././assets/vendor/libs/popper/popper.js"></script>
    <script src="././assets/vendor/js/bootstrap.js"></script>
    <script src="././assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="././assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="././assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
