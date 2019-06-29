<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<tf:bootstrapCDN></tf:bootstrapCDN>
</head>
<body>
<body>
	<div class="container" align="center">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
			<div class="jumbotron col-xs-6 col-sm-6 col-md-6  col-lg-6 center-block" style="padding-top:20px;">
				<form action="login.do" method="post">
				<div>
					<c:if test="${errors.idOrPwNotMatch }">아이디 또는 비밀번호가 일치하지 않습니다.<br/></c:if>
				</div>
				<p>
					아이디 : <br/> <input type="text" class="form-control" name="id" value="${param.id }" maxlength="20">
					<c:if test="${errors.id }" ><br/>아이디를 입력하세요<br/></c:if>
				</p>
				<p>
					패스워드 : <br/> <input type="password" class="form-control" name="password" maxlength="20">
					<c:if test="${errors.password }" ><br/>비밀번호를 입력하세요</c:if>
				</p>
				<input type="submit" class="btn btn-primary" value="확인">
				</form>
				
			</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
	</div>
</body>
</body>
</html>