package auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.exception.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import util.CommandHandler;

public class LoginHandler implements CommandHandler{

	private static final String FORM_VIEW = "/view/loginForm.jsp";
	private String nextView =  null;
	
	private LoginService loginService = new LoginService();
	@Override
	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if( req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		
		Map <String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		
		
		if(id == null || id.isEmpty()) errors.put("id", Boolean.TRUE);
		if(password == null || password.isEmpty()) errors.put("password", Boolean.TRUE);
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			User user = loginService.login(id, password);
			req.getSession().setAttribute("authUser", user);

			nextView = req.getContextPath() + "/index.jsp";
			res.sendRedirect(nextView);
			return null;
			
		} catch(LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	} 
}
