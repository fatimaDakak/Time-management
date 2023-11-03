package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

import java.io.IOException;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        
        String uri = req.getRequestURI();
        User user = (User) session.getAttribute("user");

        if (uri.endsWith("Dashboard") && (user == null || !user.getRole().equals("admin"))) {
            res.sendRedirect("Accueil"); // Redirect to an access denied page
        } else if (uri.endsWith("WorkHours") && (user == null || !user.getRole().equals("employee"))) {
            res.sendRedirect("Accueil"); // Redirect to an access denied page
        } else if (uri.endsWith("ReportList") && (user == null)) {
                res.sendRedirect("Login"); 
        } else if (uri.endsWith("WeeklyReport") && (user == null)) {
            res.sendRedirect("Login"); 
        } 
        else {
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {}
    public void destroy() {}
}
