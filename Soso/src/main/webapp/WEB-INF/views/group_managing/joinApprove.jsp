<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 승인</title>
</head>
<body>
	<script>
		alert("가입 승인 되었습니다.");
		location.href="${pageContext.request.contextPath}/group_managing/applicantList?group_num=${group_num}";
	</script>
</body>
</html>