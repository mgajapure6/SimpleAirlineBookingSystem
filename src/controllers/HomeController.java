package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeController() {
	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	HttpSession session = request.getSession();
	if (session.getAttribute("role") != null && session.getAttribute("user") != null) {
	    String role  = (String) session.getAttribute("role");
	    if(role.equals("customer")) {
		customerHome(request, response);
	    }else if(role.equals("manager")) {
		managerHome(request, response);
	    }else if(role.equals("admin")){
		adminHome(request, response);
	    }
	} else {
	    response.sendRedirect(request.getContextPath ()+"/login");
	}
    }

    public void customerHome(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	RequestDispatcher rd = request.getRequestDispatcher("views/customer/chome.jsp");
	rd.forward(request, response);
    }

    public void managerHome(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	RequestDispatcher rd = request.getRequestDispatcher("views/manager/mhome.jsp");
	rd.forward(request, response);
    }

    public void adminHome(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	RequestDispatcher rd = request.getRequestDispatcher("views/admin/dashboard.jsp");
	rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

    }

}
