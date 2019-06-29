<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<tf:bootstrapCDN />
<title>Insert title here</title>
</head>

<jsp:include page="top.jsp" flush="false" /> 
<body>
	<div class="container" align="center">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
			<div class="jumbotron col-xs-6 col-sm-6 col-md-6  col-lg-6 center-block" style="padding-top:20px;">
				<form action="changePwd.do" method="post">
				<div>
					<c:if test="${errors.idOrPwNotMatch }">아이디 또는 비밀번호가 일치하지 않습니다.<br/></c:if>
				</div>
				<p>
					현재 암호 : <br/> <input type="password" class="form-control" name="curPwd" maxlength="20">
					<c:if test="${errors.curPwd }">현재 암호를 입력해 주세요.</c:if> 
				</p>
				<p>
					새 암호 : <br/> <input type="password" class="form-control" name="newPwd" maxlength="20">
					<c:if test="${errors.newPwd }">바꿀 암호를 입력해 주세요.</c:if>
					<c:if test="${errors.badCurPwd }">현재 암호를 정확히 입력해주세요.</c:if>
				</p>
				<input type="submit" class="btn btn-primary" value="변경">
				</form>
				
			</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
	</div>
</body>
</html>