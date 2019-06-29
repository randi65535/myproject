<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/>
	
<div class="container">	
	<div class="row ">
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">조회수</th>
				</tr>
			</thead>
		
			<tbody>
				<c:if test="${article.hasNoArticle() }">
					<tr>
						<td colspan="4">게시글이 없습니다.</td>
					</tr>
				</c:if>
			
			
				<c:forEach var="article" items="${articlePage.content }">
					<tr>
						<td>${article.number}</td>
						<td>
						<a href="read.do?articleNo=${article.number }&pageNo=${articlePage.currentPage}">
						<c:out value="${article.title }"></c:out></a>
						</td>
						<td>${article.writer.name}</td>
						<td>${article.readCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		
			<c:if test="${articlePage.hasArticle() }">
				<tr>
					<td colspan="4">
						<c:if test="${articlePage.startPage > 5}">
							<a href="list.do?pageNo=${articlePage.startPage-5}">&lt</a>
						</c:if>
						
						<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage }">
							<a href="list.do?pageNo=${pNo}">${pNo}</a>
						</c:forEach>
						
						<c:if test="${articlePage.endPage < articlePage.totalPage }">
							<a href="list.do?pageNo=${articlePage.startPage+5}">&gt</a>
						</c:if>
					</td>
				</tr>
			</c:if>
		</table>
		<a href="write.do" class="btn btn-primary pull-right">글쓰기</a>
	</div>	
</div>

</body>
</html>