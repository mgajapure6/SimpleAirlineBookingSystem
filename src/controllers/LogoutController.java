package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	HttpSession session = request.getSession();
	session.invalidate();
//	session.setAttribute("role", null);
//	session.setAttribute("user", null);request.
	response.sendRedirect(request.getContextPath ()+"/login");
	//RequestDispatcher rd = request.getRequestDispatcher("/login");
	//rd.forward(request, response);
    }

}
