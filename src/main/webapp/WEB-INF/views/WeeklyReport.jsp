<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Temps" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.temporal.WeekFields" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.sql.Time" %>


 <%
    int weekNumber = (Integer) request.getAttribute("currentWeekNumber");
%>
 
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
        </aside>        <!-- / Menu -->

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

          <%
          LocalDate currentDate = LocalDate.now();
          LocalTime currentTime = LocalTime.now();
          Integer EmployeeId = (Integer) request.getAttribute("employeeId");   
          String EmployeeNom = (String) request.getAttribute("employeeNom");   
          String EmployeePrenom = (String) request.getAttribute("employeePrenom");

          System.out.println(EmployeeId);
          System.out.println(EmployeeNom);
          System.out.println(EmployeePrenom);

          // Check if the current day is not Friday or the time is earlier than 9pm
          if (currentDate.getDayOfWeek() != DayOfWeek.FRIDAY ) {
          %>
                <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Weekly Report of  /</span><%=EmployeeNom%> <%=EmployeePrenom%> </h4>
              <a href="ReportList" class="btn btn-dark">
			    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAATFJREFUSEvtlqtOxUAURdcGvgk0DsU7CJ7hewj/wMNwBSB4aAQCiSU4UDg8kE0macnQ3FJ6Z2gRd2STc9bs3fMY0dNRT1zG4M6cb2217R3gTtJDyi1bgW1vAMfAEzAj6WVU+K/BtreAQ/gqyBVJZ38KLpQeAROAgXVJJ6NCQ1yjYturwKCAfgCbqdBGcAENyiaBd2BN0nmK0jK2VrHteSD8wxK6KOkqB7RWcQE9BaaAN2ApJ3Qo2PYCEKBBaTh7wHUGpfeSXodabXsOuCiUZmB9SzEr6eZ/gcNtKkUVPu0Dlxnk11tdJu+luCrwbtspgoep1e0AqcC7HZkRPKzDbpdEBN8GDqLFspwytxu3U9xG0UPgGZju5CEQKd8FbiU9pvR2K8UpoGrsGJzTzR9z9Wb1JzHHdB9MJ/hwAAAAAElFTkSuQmCC" style="width: 18px; height: 18px;"/>
			    Back to employees
			    </a>
			  <hr class="my-5" />

              <!-- Hoverable Table rows -->
                <div class="alert alert-danger" role="alert">Weekly Report is Not available yet</div>
                    
            </div>
          </div>
             
          <%
          } else {
          %>
           
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Weekly Report of  /</span><%=EmployeeNom%> <%=EmployeePrenom%> / <%=currentDate%> - Week <%= weekNumber %></h4>
              <a href="ReportList" class="btn btn-dark">
    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAATFJREFUSEvtlqtOxUAURdcGvgk0DsU7CJ7hewj/wMNwBSB4aAQCiSU4UDg8kE0macnQ3FJ6Z2gRd2STc9bs3fMY0dNRT1zG4M6cb2217R3gTtJDyi1bgW1vAMfAEzAj6WVU+K/BtreAQ/gqyBVJZ38KLpQeAROAgXVJJ6NCQ1yjYturwKCAfgCbqdBGcAENyiaBd2BN0nmK0jK2VrHteSD8wxK6KOkqB7RWcQE9BaaAN2ApJ3Qo2PYCEKBBaTh7wHUGpfeSXodabXsOuCiUZmB9SzEr6eZ/gcNtKkUVPu0Dlxnk11tdJu+luCrwbtspgoep1e0AqcC7HZkRPKzDbpdEBN8GDqLFspwytxu3U9xG0UPgGZju5CEQKd8FbiU9pvR2K8UpoGrsGJzTzR9z9Wb1JzHHdB9MJ/hwAAAAAElFTkSuQmCC" style="width: 18px; height: 18px;"/>
    Back to employees
</a>

              <button type="button" class="btn btn-primary" onclick="downloadReport()">Download Report</button>
              <input type="hidden" id="employeeNom" value="<%= EmployeeNom %>" />
            <input type="hidden" id="employeePrenom" value="<%= EmployeePrenom %>" />
            <input type="hidden" id="currentDate" value="<%= currentDate %>" />

            <script>
              function downloadReport() {
                  var table = document.querySelector('table');
                  var rows = Array.from(table.querySelectorAll('tr'));
              
                  var csvContent = rows.map(function(row) {
                      var columns = Array.from(row.querySelectorAll('th,td'));
                      return columns.map(function(column) {
                          return column.innerText;
                      }).join(';');
                  }).join('\n');
              
                  var employeeNom = document.getElementById('employeeNom').value;
                  var employeePrenom = document.getElementById('employeePrenom').value;
                  var date_csv = document.getElementById('currentDate').value;
              
                  var blob = new Blob([csvContent], { type: 'text/csv' });
                  var link = document.createElement('a');
                  link.href = window.URL.createObjectURL(blob);
                  link.download = employeeNom + '_' + employeePrenom +'_'+ date_csv +'.csv';
                  link.style.display = 'none';
                  document.body.appendChild(link);
                  link.click();
                  document.body.removeChild(link);
              }
              
              </script>

              <hr class="my-5" />

              <!-- Hoverable Table rows -->
              <div class="card">
                <h5 class="card-header">Week <%= weekNumber %></h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover" id="employeeTable">
                    <thead>
                      <tr>
                        <th> Day of week </th>
                        <th> Start Time </th>
                        <th> End Time </th>
                        <th> Pause Start </th>
                        <th> Pause End </th>
                        <th> Total working Hours </th>
                        <th> Total Supplementary Hours </th>
                      </tr>
                    </thead>
                    <%
                    List<models.Temps> weeklyReport = (List<models.Temps>) request.getAttribute("weeklyReport");
                    if (weeklyReport != null && !weeklyReport.isEmpty()) {
                      
                      double totalWorkingHours = 0;
                      double totalSupplementaryHours = 0;
                      String currentDay = null;
                        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                        
                        for (models.Temps time : weeklyReport) {
                          
                            // Get the date from date_j
                        Date date_j = time.getDate_j();
                          // Convert java.util.Date to java.time.LocalDateTime
                  Time startTime = time.getHeure_debut();
                  Time endTime = time.getHeure_fin();
                  Time pauseStartTime = time.getPause_debut();
                  Time pauseEndTime = time.getPause_fin();
                  

        
                  long workingHoursInMillis = endTime.getTime() - startTime.getTime() - (pauseEndTime.getTime() - pauseStartTime.getTime());
        
                  // Convert milliseconds to hours
                  double workingHoursInHours = workingHoursInMillis / (60.0 * 60 * 1000);
        
                  // Calculate supplementary hours
                  double supplementaryHours = Math.max(0, workingHoursInHours - 8);
                            // Update total working hours and total supplementary hours
                             totalWorkingHours += workingHoursInHours;
                            totalSupplementaryHours += supplementaryHours;
                            
                            // Convert hours and minutes to the desired format
                            int workingHours = (int) workingHoursInHours;
                            int workingMinutes = (int) ((workingHoursInHours - workingHours) * 60);
        
                            int supplementaryHoursInt = (int) supplementaryHours;
                            int supplementaryMinutes = (int) ((supplementaryHours - supplementaryHoursInt) * 60);         
                            
               %>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= new SimpleDateFormat("EEEE", Locale.US).format(time.getDate_j()) %></strong></td>
                        <td><%= timeFormat.format(time.getHeure_debut()) %></td>
                        <td><%= timeFormat.format(time.getHeure_fin()) %></td>
                        <td><%= timeFormat.format(time.getPause_debut()) %></td>
                        <td><%= timeFormat.format(time.getPause_fin()) %></td>
                        <td><%= workingHours %>h<%= workingMinutes %>min</td>
                        <td><%= supplementaryHoursInt %>h<%= supplementaryMinutes %>min</td>
                      </tr>
                      <%
                    }
                }
            %>

                    </tbody>
                  </table>
                  <%
                }
                %>
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
