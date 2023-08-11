<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 문의 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
			<br>	
			<h2 style="text-align: center">소모임 FAQ 게시판</h2>
			<div style="width:100%; text-align:right;">
			<a href="${pageContext.request.contextPath }/group/faq/insertform?num=${num}" class="btn btn-outline-dark" tabindex="-1" role="small-button" aria-disabled="true" >글 쓰기</a>
			</div>
			<br>
			<table class="table">
				<thead class="table-group-divider" style="border-bottom: 1px;">
					<tr>	
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th class="time" style="text-align: center">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td>${tmp.q_writer }</td>
							<td>
								<a style="color: black;" class="text-decoration-none"  href="${pageContext.request.contextPath}/group/faq/detail?num=${tmp.num}">${tmp.q_title }</a>
							</td>
							<td>${tmp.q_content }
								<a href="${pageContext.request.contextPath}/group/faq/updateform?num=${tmp.num}">수정</a>
								<a href="${pageContext.request.contextPath}/group/faq/delete?num=${tmp.num}">삭제</a>
							</td>
							<td style="text-align: center">${tmp.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br />
				<ul class="pagination" style="justify-content: center;">
					<%--
						startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
						&condition=${condition}&keyword=${encodedK}
					 --%>
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
					<%--
						마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
					 --%>
					<c:if test="${endPageNum lt totalPageCount }">
						<li class="page-item">
							<a class="page-link animate__animated" href="list?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
						</li>
					</c:if>				
				</ul>
		<br />
		<script>
			document.querySelectorAll(".pagination a").forEach(function(item){
				//item 은 a 의 참조값이다 모든 a 요소에 mouseover 이벤트가 발생했을때 실행할 함수 등록
				item.addEventListener("mouseover", function(e){
					//애니메이션 클래스를 추가해서 애니메이션이 동작하도록한다.
					e.target.classList.add("animate__swing");
				});
				//item 은 a 의 참조값이다 모든 a 요소에 animationend 이벤트가 발생했을때 실행할 함수 등록
				item.addEventListener("animationend", function(e){
					//애니메이션 클래스를 제거해서 다음번에 추가 되면 다시 애니매이션이 동작 되도록한다.
					e.target.classList.remove("animate__swing");
				});
			});
		</script>
	</div>
</body>
</html>