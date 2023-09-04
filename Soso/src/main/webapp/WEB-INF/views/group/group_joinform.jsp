<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.name } 가입 신청 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
	<section>
		<div class="container">
			<div>${dto.name } 가입 신청 페이지</div>
			<form action="${pageContext.request.contextPath}/group/join?num=${num}" method="post">
				<pre>${dto.caption }</pre>
				<label class="control-label" for="intro">자기소개</label>			
				<textarea class="form-control mb-3" name="intro" id="" cols="30" rows="10"></textarea>
				<div class="d-flex justify-content-center">
					<button class="btn btn-primary" type="submit">가입 신청</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>