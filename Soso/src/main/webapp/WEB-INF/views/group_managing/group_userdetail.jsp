<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 커뮤니티</title>
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing_user_detail.css" />
<script src="${path }/resources/js/common.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
	<section>
		<div class="inner-wrap">
			<h2 class="title black">함께하는 북메이트 멤버들</h2>
		</div>
	    <div class="inner-wrapper">
	        <div class="user_mate_list">
	            <c:forEach items="${mateList}" var="user">
	                <c:if test="${user.isJoin == 0}"> <!-- 가입된 유저만 출력 -->
	                    <div class="user_mate">
	                        <div class="user_mate_img">
	                            <img src="${pageContext.request.contextPath}${user.profile}" alt="" />
	                        </div>
	                        <div class="user_mate_name">
	                            <p class="text">${user.user_id }</p>
	                        </div>
	                    </div>
	                </c:if>
	            </c:forEach>
	        </div>
	    </div>
	 	 <!-- <a href="javascript:deleteConfirm()">모임 탈퇴</a> -->
	 	<div class="group_content_bg">
		 	<div class="inner-wrap">
				<div class="group_content">
					<div class="group_meet_img">
						<img src="${pageContext.request.contextPath}${dto.img_path}">
					</div>
					<div class="group_meet_contents">
						<p class="text">${dto.manager_id}</p>
						<p class="text"> ${dto.meeting_time}</p>
						<p class="text"> ${dto.meeting_loc}</p>
						<p class="text"> ${dto.now_people}</p>
					</div> 
				</div>
			</div>
	 	</div>
	 	<div class="inner-wrap">
			<h2 class="title black">북메이트 커뮤니티</h2>
		</div>
	 	<div class="inner-wrap">
	 		<jsp:include page="/WEB-INF/views/cafe/list.jsp"></jsp:include>
	 	</div>
	 	<div class="inner-wrap">
	 		<ul>
	 			<h2 class="title black">모임규칙</h2>
	 			<li style="line-height: 2.5;">
	 				1. <span style="font-size: 18px;"> 책은 모임 전에 꼭 읽고 만나요.</span>
	 			</li>
	 			<li style="line-height: 2.5;">
	 				<span style="font-size: 18px;"> 2. 모임에 지각 하시면 다른 회원들이 기다리니까 시간 잘 지켜주세요!</span>
	 			</li>	 			
	 		</ul>
	 	</div>
	 	<div class="inner-wrap">
	 		<ul>
	 			<h2 class="title black">공지사항</h2>
	 			<li style="line-height: 2.5;">
	 				<span style="font-size: 18px;"> 1. 한번 가입했다가 탈퇴 하신 회원님은 다시 가입 불가능 합니다.</span>
	 			</li>
	 			<li style="line-height: 2.5;">
	 				<span style="font-size: 18px;"> 2. 저희 모임에 불순한 의도를 갖고 오시는 분은 법적 대응 들어갑니다.</span>
	 			</li>
	 			<li style="line-height: 2.5;">
	 				<span style="font-size: 18px;"> 3. 모임 2일 전에 문자로 안내 드립니다.</span>
	 			</li>
	 		</ul>	 	
	 	</div>
	</section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>	
	<script>
    function deleteConfirm() {
        const isDelete = confirm("${id} 님 탈퇴 하시겠습니까?");
        if (isDelete) {
            location.href = "${pageContext.request.contextPath}/group_managing/group_userdropOut?group_num=${dto.num}";
        }
    }
	</script>
</body>
</html>

