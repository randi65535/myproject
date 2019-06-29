<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입</title>

<tf:bootstrapCDN></tf:bootstrapCDN>

</head>
<body>
	<div class="container center-block container-fluid">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>	
			<div class="jumbotron col-xs-6 col-sm-6 col-md-6  col-lg-6 center-block" style="padding-top:20px;">
				<form action="join.do" method="post">
					
				<div class="form-group">
			
					아이디 : <input type="text" class="form-control" name="id" value="${param.id }" maxlength="20">
					<c:if test="${errors.id }" ><br/>아이디를 입력하세요<br/></c:if>
					<c:if test="${errors.duplicateId }" ><br/>이미 사용 중인 아이디입니다.<br/></c:if>
					<br/>
					
					이름 : <br/> <input type="text" class="form-control" name="name" value="${param.name }" maxlength="20"> 
					<c:if test="${errors.name}" ><br/>이름을 입력하세요<br/></c:if>
					<br/>
					
					패스워드 : <br/> <input type="password" class="form-control" name="password" maxlength="20">
					<c:if test="${errors.password }" ><br/>비밀번호를 입력하세요.<br/></c:if>
					<br/>					
					확인용 패스워드 : <br/> <input type="password" class="form-control" name="confirmPassword" maxlength="20">
					<c:if test="${errors.confirmPassword }">확인용 패스워드를 입력해 주세요.<br/></c:if>
					<c:if test="${errors.notMatch }">일치하지 않습니다.<br/></c:if>
					<br/>
					<input type="submit" class="btn btn-primary" value="확인">

				</div>
				
				</form><br/>
				
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
		</div>
	</div>
</body>
</html>