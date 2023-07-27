<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임을 등록할 페이지</title>
</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath }/soso/insert?num=">
			<label for="title">소모임 이름</label>
			<input type="text" id="title" name="title" placeholder="소모임 이름 입력" />

			<label for="locate">위치</label>
			<input type="text" id="locate" name="locate" placeholder="지역" />
			
			<label for="limit">기한</label>
			<input type="text" id="limit" name="limit" placeholder="기한" />
			
			<label for="main_image">메인 이미지</label>
			<input type="file" id="main_image" name="main_image" placeholder="주최자"/>
			
			<label for="writer">주최자</label>
			<input type="text" id="writer" name="writer" placeholder="주최자" />
			
			<label for="note">모임소개</label>
			<textarea name="note" id="note" cols="30" rows="10">모임소개</textarea>

			<button type="button">모임 작성</button>							
		</form>
	</div>
</body>
</html>