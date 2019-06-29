<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%pageContext.setAttribute("crlf", "\r\n");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<tf:bootstrapCDN />
<title>게시글 읽기</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />

<div class="container">	
	<div class="row">
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">
    					${articleData.article.number }번째 글
    				</th>
				</tr>
			</thead>
		
			<tbody>
				<tr>
					<td style="width:20%;">제목</td>
				    <td colspan="2"><c:out value='${articleData.article.title }' /></td>
				</tr> 
				<tr>
				    <td style="width:20%;">작성자</td>
				    <td colspan="2">${articleData.article.writer.name }</td>
				</tr>
				
				<tr>
				    <td colspan="3" style="min-height: 400px; text-align:left;">${fn:replace(articleData.content, crlf, "<br/>") }</td>
				</tr>
			</tbody>
		</table>

    	
		<!-- ${articleData.article.number } -->
		<table class="table">
			<tr>
					<td class="text-left">
							<!-- 파라미터로 넘어온 pageNo가 없으면 1, 있으면 대입 -->
						<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }" />
						<a href="list.do?pageNo=${pageNo }">[목록]</a>			
					</td>
						<c:if test="${authUser.id == articleData.article.writer.id }">
										
					<td class="text-right">
						<a href="modify.do?no=${articleData.article.number }" class="btn btn-info"><span>수정</span></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="delete.do?no=${articleData.article.number }" class="btn btn-danger"><span>삭제</span></a>
						
					</td>  
						</c:if>
				<tr>		
		</table>
	</div>	
</div>


</body>
</html>