<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="models.User" %>
  <%@ page import="java.util.*" %>
  



<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
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

    

    <meta name="description" content="" />

    <!-- Favicon -->
 <title>NORTECH</title>
  <meta charset="UTF-8">
      <link rel="icon" type="image/x-icon" href="././images/Nortech.png" />
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="././assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="././assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="././assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="././assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="././assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="././assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="././assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="././assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="./" class="app-brand-link">
              <span class="app-brand-logo demo">
               <img src="././images/Nortech.png" width="70">
              </span>
            </a>
            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>
          <div class="menu-inner-shadow"></div>
          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item ">
              <a href="Dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
              </a>
            </li>

            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">Reports</span>
            </li>
            <li class="menu-item active">
              <a href="ReportList" class="menu-link ">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Employees</div>
              </a>
            </li>
            <!-- Misc -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Account</span></li>
       <li class="menu-item">
    <a href="Logout" target="_blank" class="menu-link text-danger" style="padding-right: 10px;">
        <i class="bx bx-log-out-circle"></i>
        <div data-i18n="Support"> Log out</div>
    </a>
    </li>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                 <input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search..." onkeyup="searchTable()" id="searchInput"/>
 
                </div>
              </div>
              <!-- /Search -->

              
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->
          <%
          String successMsg = (String) session.getAttribute("successMsg");
          if (successMsg != null && !successMsg.isEmpty()) {
          %>
          <script>
          alert("<%=successMsg%>");
          </script>
          <%
          session.removeAttribute("successMsg");
          }
          %>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Report /</span>Employee List</h4>


              <hr class="my-5" />

              <!-- Hoverable Table rows -->
              <div class="card">
                <h5 class="card-header">Employee List</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover" id="employeeTable">
                    <thead>
                      <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Email</th>
                        <th>Number of working hours</th>
                      </tr>
                    </thead>
                    <%
ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");

if (users != null && !users.isEmpty()) {
    for (User user : users) {
        String role = user.getRole(); // Assuming user.getRole() returns the role
        
        if (role != null && role.equals("employee")) {
%>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= user.getNom() %></strong></td>
                        <td><%= user.getPrenom() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><a type="button" class="btn btn-dark" href="WeeklyReport?employeeId=<%= user.getId() %>&nom=<%= user.getNom() %>&prenom=<%= user.getPrenom() %>">View</a>
                        </td>
                      </tr>
                      <% 
            System.out.println("User: " + user.getNom() + " " + user.getPrenom() + " " + user.getEmail());
        }
    }
} else {
%>
    <tr>
        <td colspan="5">No Employee Found.</td>
    </tr>
<%
}
%>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Hoverable Table rows -->


            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  
                  <a href="./" target="_blank" class="footer-link fw-bolder">NorTech</a>
                </div>
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>
	<script>
	  function searchTable() {
	    // Declare variables
	    var input, filter, table, tr, td, i, txtValue;
	    input = document.getElementById("searchInput");
	    filter = input.value.toUpperCase();
	    table = document.getElementById("employeeTable");
	    tr = table.getElementsByTagName("tr");
	
	    // Loop through all table rows, and hide those who don't match the search query
	    for (i = 0; i < tr.length; i++) {
	      td = tr[i].getElementsByTagName("td");
	      for (var j = 0; j < td.length; j++) {
	        if (td[j]) {
	          txtValue = td[j].textContent || td[j].innerText;
	          if (txtValue.toUpperCase().indexOf(filter) > -1) {
	            tr[i].style.display = "";
	            break; // Break out of inner loop
	          } else {
	            tr[i].style.display = "none";
	          }
	        }
	      }
	    }
	  }
	</script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
