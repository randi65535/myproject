package auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.CommandHandler;

public class LogoutHandler implements CommandHandler{

	@Override
	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		
		res.sendRedirect(req.getContextPath()+"/index.jsp");
		return null;
	}

}
