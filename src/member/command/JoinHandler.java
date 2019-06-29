package member.command;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.Response;

import auth.service.LoginService;
import auth.service.User;
import member.dao.MemberDao;
import member.exception.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;
import util.CommandHandler;

public class JoinHandler implements CommandHandler{

	private static final String FORM_VIEW = "/view/joinForm.jsp";
	private String nextView = null;
	private LoginService loginService = new LoginService();
	
	@Override
	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) 
			throws Exception{
		JoinRequest joinReq = new JoinRequest();
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		joinReq.setId(id);
		joinReq.setName(name);
		joinReq.setPassword(password);
		joinReq.setConfirmPassword(req.getParameter("confirmPassword"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		JoinService joinService = new JoinService();
		try {
			joinService.join(joinReq);
			User authUser = loginService.login(id, password);
			req.getSession().setAttribute("authUser", authUser);
			res.sendRedirect(req.getContextPath()+"/index.jsp");
			nextView = "/view/joinSuccess.jsp";
			return null;
		} catch(DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

}
