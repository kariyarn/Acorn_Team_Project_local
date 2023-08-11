<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/group/user_main.jsp</title>
	<link rel="stylesheet" href="${path }/resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/group_list.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing_user_main.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
	<main id="main-banner" class="main-banner-02">
        <div class="inner-wrap">
            <div class="title">
                <h2>나의 북메이트</h2>
                <p>
			                   참여중인 북메이트를<br>
			                   확인하는 게시판
                </p>
                <a href="${pageContext.request.contextPath}/cafe/list">게시판</a>
            </div>
            <div class="indicator">
                <div class="home circle">
                    <a href="../../index.html" title="메인페이지가기"><img src="${path }/resources/images/sub/icon_home.svg" alt="홈버튼이미지"></a>
                </div>
                <div class="main-menu circle">MY BOOKMATE</div>
            </div>
        </div>
    </main>
	<div class="container">     
	    <div class="row">
	        <c:forEach var="tmp" items="${list}">
                <div class="col-sm-6 col-md-4 col-lg-3 p-1 mb-3">
                    <div class="card mb-4">
                        <a href="${pageContext.request.contextPath}/group_managing/userdetail?num=${tmp.num}">
                            <div class="img-wrapper">
                                <img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/main/${tmp.imagePath}"/>
                            </div>
                        </a>
                        <div class="card-body">
                            <p class="card-title fs-3"><strong>${tmp.name}</strong></p>
                            <p class="card-text">${tmp.caption}</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item card-info"><span class="info-label">모임장:</span> ${tmp.manager_id}</li>
                            <li class="list-group-item card-info"><span class="info-label">모임 날짜:</span> ${tmp.meeting_time}</li>
                            <li class="list-group-item card-info"><span class="info-label">모임 장소:</span> ${tmp.meeting_loc}</li>
                        </ul>
                    </div>
                </div>
	        </c:forEach>
	    </div>
	</div>
    <nav>
       <ul class="pagination justify-content-center">
          <c:choose>
             <c:when test="${dto.prevNum ne 0 }">
                <li class="page-item mr-3">
                     <a class="page-link" href="${pageContext.request.contextPath}">&larr; Prev</a>
                </li>
             </c:when>
         </c:choose>
         <c:choose>
            <c:when test="${dto.nextNum ne 0 }">
               <li class="page-item">
                   <a class="page-link" href="${pageContext.request.contextPath}">Next &rarr;</a>
               </li>
            </c:when>
         </c:choose>         
       </ul>
    </nav>
</body>
</html>

