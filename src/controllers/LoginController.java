package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.LoginDao;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	RequestDispatcher rd = request.getRequestDispatcher("views/login/login.jsp");
	rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String role = request.getParameter("role");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	System.out.println("role:" + role);
	System.out.println("username:" + username);
	System.out.println("password:" + password);
	LoginDao loginDao = new LoginDao();
	JsonObject respObj = new JsonObject();
	Map<String, Object> resultMap = loginDao.processLogin(role, username, password);
	if ((boolean) resultMap.get("found")) {
	    HttpSession session = request.getSession();
	    session.setAttribute("role", role);
	    session.setAttribute("user", resultMap.get("data"));
	    respObj.addProperty("status", "success");
	    respObj.addProperty("path", role.toLowerCase());
	} else {
	    respObj.addProperty("status", "failed");
	}
	Gson gson = new Gson();
	String json = gson.toJson(respObj);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	response.getWriter().write(json);
    }

}
