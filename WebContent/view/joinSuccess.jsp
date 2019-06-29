<%@page import="auth.service.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	HttpSession httpSession = request.getSession(false);
	if(httpSession != null && httpSession.getAttribute("authUser") != null) {
	User authUser = (User)request.getSession().getAttribute("authUser");

	request.setAttribute("authUser", authUser);
	response.sendRedirect("/index.jsp");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${param.name }님 가입 완료.
</body>
</html>