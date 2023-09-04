<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-1.12.0.min.js"></script>
<script src="${path }/resources/js/jquery.easing.1.3.js"></script>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<meta charset="UTF-8">
		<title>book::list</title>
	</head>
	<body>
		<h3>네이버 오픈 API를 활용한 도서 목록</h3>		
		<table border="1">
			<c:forEach var="tmp" items="${books }">
				<tr>
					<td>${tmp.isbn }</td>
					<td><img src="${tmp.image }" alt="${tmp.title }" width="100" /></td>
					<td><a href="${tmp.link }">${tmp.title }</a></td>
					<td>
	                     <form class="addForm" action="${pageContext.request.contextPath}/test/addList">
			                <input type="text" name="title" value="${tmp.title}" hidden />
			                <input type="text" name="link" value="${tmp.link}" hidden />
			                <input type="text" name="image" value="${tmp.image}" hidden />
			                <input type="text" name="isbn" value="${tmp.isbn}" hidden />
			                <input type="text" name="description" value="${tmp.description}" hidden />
			                <button class="addBtn">추가</button>
			            </form>
	                </td>
				</tr>
			</c:forEach>
		</table>
	</body>
	<script>
	    
		const urlParams = new URLSearchParams(window.location.search);
		const num = urlParams.get('num');
	
	    $(document).ready(function() {
	        $(".addBtn").on("click", function(e) {
	        	//폼 전송을 막는다
	            e.preventDefault();
				
	        	//해당 줄의 정보를 얻어낸다.
	        	//$(this)는 클릭한 버튼의 정보를 의미한다.
	        	//.closest는 상위 요소의 tr을 알아낸다.
	        	//.find는 input요소가 name=XXX를 알아내는 것
	            const row = $(this).closest("tr");
	            const group_num = row.find("input[name='group_num']").val();
	            const title = row.find("input[name='title']").val();
	            const link = row.find("input[name='link']").val();
	            const image = row.find("input[name='image']").val();
	            const isbn = row.find("input[name='isbn']").val();
	            const description = row.find("input[name='description']").val();
				//해당 데이터를 json 형식으로 담고
	            const bookInfo = {
	                group_num: num,
	                title: title,
	                link: link,
	                image: image,
	                isbn: isbn,
	                description: description
	            };
	            // 원래 페이지로 데이터를 전송
	            window.opener.postMessage(bookInfo, "*");

	        });
	    });
	    
	   /*  //저장 버튼을 눌렀을 때 ajax로 저장되는 구조(정식으로 넣을 때는 이 코드는 삭제될 예정.)
	    $("#saveList").on("click", function(){
	        $.ajax({
	            url: "${pageContext.request.contextPath}/test/saveBook",
	            type: "POST",
	            data: JSON.stringify(booklist), // 데이터를 JSON 형태로 변환
	            contentType: "application/json", // 컨텐츠 유형을 JSON으로 설정
	            error: function(data){
	                console.log("오류입니다.");
	            },
	            success: function(data){
	                console.log("저장 성공!");
	            }
	        });
	    }); */
	</script>

</html>