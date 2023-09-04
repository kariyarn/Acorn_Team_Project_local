<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${isSuccess }">
                <p>아이디는 <strong>${id }</strong> 입니다.</p>
                <p><a href="${pageContext.request.contextPath}/users/loginform">로그인 하러 가기</a></p>
                <p><a href="${pageContext.request.contextPath}/users/pwd_findform">비밀번호 찾기</a></p>
            </c:when>
            <c:otherwise>
                <p>
                    이메일이 일치하지 않습니다.
                    <a href="${pageContext.request.contextPath}/users/id_findform">재시도</a>
                </p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>