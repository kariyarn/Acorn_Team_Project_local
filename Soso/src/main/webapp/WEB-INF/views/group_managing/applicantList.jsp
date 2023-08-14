<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 가입 신청자 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing/group_managing_admin_header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing/group_managing_admin_applicant_card.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
        <jsp:param value="login" name="current"/>
    </jsp:include>
	<div class="container">
		<div id="header">
			<div class="title">Applicant</div>
		</div>
		<div id="menus">
			<div><a href="${pageContext.request.contextPath}/group_managing/applicantList?group_num=${group_num}">신청 중</a></div>
			<div><a href="${pageContext.request.contextPath}/group_managing/rejectedApplicantList?group_num=${group_num}">거절</a></div>
		</div>
		<div class="wrapper">
			<c:forEach var="tmp" items="${list}">
			<div id="card">
				<div class="card-box">
					<div class="card-left">
						<div><img class="card-image" src="https://plus.unsplash.com/premium_photo-1667251758255-514ef43844fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60"/></div>
					</div>
					<div class="card-right">
						<div id="card-title">${tmp.user_id}</div>
						<div id="card-date">가입 신청일 : ${tmp.request_dt}</div>
						<div id="card-link"><a href="${pageContext.request.contextPath}/cafe/list">회원 정보 보기</a></div>
						<div id="card-buttons">
							<div><a href="${pageContext.request.contextPath}/group_managing/joinApprove?num=${tmp.num}&group_num=${group_num}">가입 승인</a></div>
							<div><a href="${pageContext.request.contextPath}/group_managing/reject?num=${tmp.num}&group_num=${group_num}">가입 거절</a></div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>