package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {

	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception;
}
