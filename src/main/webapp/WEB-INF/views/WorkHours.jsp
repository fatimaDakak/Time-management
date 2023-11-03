<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.Temps" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Calendar" %>

<%@ page import="models.User" %> <!-- Import the User class --> 


<%
User user = (User) session.getAttribute("user"); // Retrieve user object from session
String formattedName = user.getNom().toUpperCase(); // Convert name to uppercase
String formattedSurname = user.getPrenom().toLowerCase(); // Convert surname to lowercase
%>

  <%
// Get the current date in "YYYY-MM-DD" format
java.time.LocalDate currentDate = java.time.LocalDate.now();
String currentDateStr = currentDate.toString();
%>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <link rel="icon" type="image/x-icon" href="././images/Nortech.png" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.10.2/lottie.min.js" integrity="sha512-fTTVSuY9tLP+l/6c6vWz7uAQqd1rq3Q/GyKBN2jOZvJSLC5RjggSdboIFL1ox09/Ezx/AKwcv/xnDeYN9+iDDA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="stylesheet" href="././vendors/owl-carousel/css/owl.carousel.min.css">
  <link rel="stylesheet" href="././vendors/owl-carousel/css/owl.theme.default.css">
  <link rel="stylesheet" href="././vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="././vendors/aos/css/aos.css">
  <link rel="stylesheet" href="././css/style.min.css">
    <script type="text/javascript" src="./././js/start_end_buttons.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.10.2/lottie.min.js"></script>
    <style>
    #lottie-animation {
        width: 230px; /* Adjust width as needed */
        height: auto; /* Maintain aspect ratio */
        margin: 0 auto; /* Center the animation */
    }
     #lottie-animation {
        position: fixed;
        bottom: 10px; /* Adjust the distance from the bottom as needed */
        right: 10px; /* Adjust the distance from the right as needed */
        z-index: 1000; /* Adjust the z-index if needed to ensure it's above other elements */
    }
</style>
    
   
    <title>NORTECH | WorkHours</title>
</head>
<body>
<header id="header-section">
    <nav class="navbar navbar-expand-lg p-4" id="navbar"> <!-- Reduced padding (p-2) -->
        <div class="container">
            <div class="navbar-brand-wrapper d-flex w-100">
                <center><h4><strong><a href="#header-section" style="color: #8c7be5;">NOR</strong>TECH <span class="sr-only"></span></a></h4></center>
                <img src="" alt="">
                <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="mdi mdi-menu navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menu-wrapper" id="navbarSupportedContent">
                <ul class="navbar-nav align-items-lg-center align-items-start ml-auto">
                    <li class="d-flex align-items-center justify-content-between pl-4 pl-lg-0">
                        <div class="navbar-collapse-logo">
                            <img src="" alt="">
                        </div>
                        <button class="navbar-toggler close-button" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="mdi mdi-close navbar-toggler-icon pl-5"></span>
                        </button>
                    </li>
                    <li class="nav-item btn-contact-us pl-4 pl-lg-0">
                        <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'"><a href="./" style="color: white; text-decoration: none;">Home</a></button>
                        <button class="btn btn-info" style="background-color: #8c7be5; border: none;" onmouseover="this.style.backgroundColor='#402978'" onmouseout="this.style.backgroundColor='#8c7be5'"><a href="Logout" style="color: white; text-decoration: none;">Log Out</a></button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

      <!--fin navbar-->
      
  
      <!--liste Item-->
<div class="container mt-5 d-flex flex-column">



<c:if test="${not empty sessionScope['user']}">
    <center>
        <div class="text-center mt-3">
            <p style="font-size: larger;">Hey <strong><%= formattedName %></strong> <%= formattedSurname %> 👋</p>
        </div>
    </center>
</c:if>
<%
Calendar calendar = Calendar.getInstance();
int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
boolean isWeekend = (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY);
%>

<% if (isWeekend) { %>
        <div class="text-center mt-3">
            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="alert alert-danger" role="alert"> Sorry, you cannot perform actions on weekends</div>
          </div>            
        </div>
<% } else { %>
</div>

           <div style="text-align: center; display: flex; align-items: center; justify-content: center;">
    <hr style="border-top: 1px solid #8c7be5; width: 10%; margin: 0;">
    <h6 style="margin: 0 10px;color: #8c7be5">Work <i class="fas fa-briefcase"></i>

    </h6>
    <hr style="border-top: 1px solid black; width: 10%; margin: 0;">
</div><br>
   <%
java.sql.Time startTime = (java.sql.Time) request.getAttribute("heure_debut");
String started = (startTime != null) ? startTime.toString() : null;
String message = (String) request.getAttribute("started");
if (started != null && !started.isEmpty()) {
%>

 <!--    --------------------------    End Work  -------------------------- -->


   <div class="text-center mt-3">
            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="alert alert-primary " role="alert"><%= message %></div>
          </div>            
        </div>
    <div class="d-flex justify-content-center">
    <form action="WorkHours" method="post">
    <input type="hidden" id="start-time" name="end-time">
    <input type="hidden"  name="hidden" value="end">
    <input type="hidden" name="id_user" value="<%= user.getId() %>">
      <input id="end-button" class="btn btn-danger" type="submit" value="End Work" ${requestScope['heure_fin'] != null ? 'hidden' : ''}>
   </form>
   </div>
<%
}
%>


<%
java.sql.Time endTime = (java.sql.Time) request.getAttribute("heure_fin");
String ended = (endTime != null) ? endTime.toString() : null;
String message_end = (String) request.getAttribute("ended");
if (ended != null && !ended.isEmpty()) {
%>

        <div class="text-center mt-3">
            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="alert alert-primary" role="alert"><%= message_end %></div>
          </div>            
        </div>
    
  <%
}
%>
 
  <!--    --------------------------    Start Work  -------------------------- -->
    <div class="d-flex justify-content-center">
     <form action="WorkHours" method="post">
         <input type="hidden" id="start-time" name="start-time">
           <input type="hidden"  name="hidden" value="start">
           <input type="hidden" id="start-date" name="start-date">
          <input type="hidden" name="id_user" value="<%= user.getId() %>">
     <input id="start-button" class="btn btn-primary" type="submit"   value="Start Work" ${requestScope['heure_debut'] != null ? 'hidden' : ''} >
     </form>
    </div>
    
    <br>
    <div style="text-align: center; display: flex; align-items: center; justify-content: center;">
    <hr style="border-top: 1px solid #42762C; width: 10%; margin: 0;">
    <h6 style="margin: 0 10px; color:#42762C">Break <i class="fas fa-coffee"></i>

    </h6>
    <hr style="border-top: 1px solid black; width: 10%; margin: 0;">
</div>
<br>
    
 <!--    --------------------------    Start Pause  -------------------------- -->

     <%
java.sql.Time startPause = (java.sql.Time) request.getAttribute("pause_debut");
String startedPause = (startPause != null) ? startPause.toString() : null;
String message_pause = (String) request.getAttribute("startedPause");
if (startedPause != null && !startedPause.isEmpty()) {
%>




    <div class="text-center mt-3">
            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="alert alert-success" role="alert"><%= message_pause %></div>
          </div>            
        </div>
<%
}
%>
<div class="d-flex justify-content-center">
    <form action="WorkHours" method="post">
    <input type="hidden" id="start-pause" name="start-pause">
    <input type="hidden"  name="hidden" value="startps">
    <input type="hidden" name="id_user" value="<%= user.getId() %>">
    <input id="start-pause-button" class="btn btn-primary" type="submit" value="Start Break" ${requestScope['heure_debut'] != null ? ' ' : 'hidden'} ${requestScope['heure_fin'] != null ? 'hidden' : ''} ${requestScope['pause_debut'] != null ? 'hidden' : ' '}>  
   </form>
   </div>
 <!--    --------------------------    End Pause  -------------------------- -->
<%
java.sql.Time endPause = (java.sql.Time) request.getAttribute("pause_fin");
String endedPause = (endPause != null) ? endPause.toString() : null;
String message_end_pause = (String) request.getAttribute("endedPause");
if (endedPause != null && !endedPause.isEmpty()) {
%>
    <div class="text-center mt-3">
            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="alert alert-success" role="alert"><%= message_end_pause %></div>
          </div>            
        </div>

<%
}
%>
<% } %>
        <div class="d-flex justify-content-center">
    <form action="WorkHours" method="post">
    <br>
    <input type="hidden" id="end-pause" name="end-pause">
    <input type="hidden"  name="hidden" value="endps">
    <input type="hidden" name="id_user" value="<%= user.getId() %>">
        <input id="end-pause-button" class="btn btn-danger" type="submit" value="End Break" ${requestScope['pause_debut'] != null ? ' ' : 'hidden'} ${requestScope['heure_fin'] != null ? 'hidden' : ''} ${requestScope['pause_fin'] != null ? 'hidden' : ' '}>  
   </form>
   </div>
   <div id="lottie-animation"></div>
   
 <footer class="border fixed-bottom" style="background-color: #8c7be5;">
    <p class="text-center text-white pt-4">© 2023<a href="#" class="px-1" style="color:#ffffff;">NORTECH.</a></p>
</footer>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var animationContainer = document.getElementById('lottie-animation');
        var animationData = {
            container: animationContainer,
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: '././js/gif.json' // Replace with the actual path to your Lottie JSON file
        };
        var anim = bodymovin.loadAnimation(animationData);
    });
</script>

    <script>
    

    function setCurrentTimeAndDate() {
        var now = new Date();
        var startTime = formatTime(now.getHours(), now.getMinutes());
        var startPause = formatTime(now.getHours(), now.getMinutes());
        var endPause = formatTime(now.getHours(), now.getMinutes());
        var startDate = formatDate(now);
        var endTime = formatTime(now.getHours(), now.getMinutes());

        // Store the current time and date in hidden input fields
        document.getElementById("start-time").value = startTime;
        document.getElementById("start-pause").value = startPause;
        document.getElementById("end-pause").value = endPause;
        document.getElementById("start-date").value = startDate;
        

    }
    window.onload = setCurrentTimeAndDate;
    
    function formatTime(hours, minutes) {
        return (hours < 10 ? "0" : "") + hours + ":" + (minutes < 10 ? "0" : "") + minutes;
    }

    function formatDate(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1; // Month is zero-based
        var day = date.getDate();

        return year + "-" + (month < 10 ? "0" : "") + month + "-" + (day < 10 ? "0" : "") + day;
    }
</script>

</body>
</html>
