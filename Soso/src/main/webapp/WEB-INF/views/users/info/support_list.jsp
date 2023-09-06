<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped">
		<thead class="table-dark">
			<tr>
				<th>등록일</th>
				<th>문의 제목</th>
				<th>답변 여부</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.regdate}</td>
					<td>
						<a href="${pageContext.request.contextPath}/support/support_inquire_MyInquire">${tmp.title}</a>
					</td>
					<td>
						<c:if test="${empty tmp.answer}">
							답변대기
						</c:if>
						<c:if test="${not empty tmp.answer}">
							답변완료
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav class="d-flex justify-content-center">
		<ul class="pagination">
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link animate__animated" href="list?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li class="page-item ${pageNum eq i ? 'active' : '' }">
					<a class="page-link animate__animated" href="list?pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li class="page-item">
					<a class="page-link animate__animated" href="list?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
				</li>
			</c:if>				
		</ul>
	</nav>
</body>
</html>