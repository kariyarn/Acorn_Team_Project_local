<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
<style>
/* 관리버튼 css */
.admin_menu{
	width: 100%;
	display: flex;
	justify-content: center;
	}
.admin_button{
	width: 130px;
    height: 48px;
    display: inline-block;
    border-radius: 0;
    border: 1px solid #d8d8d8;
    background-color: #f7f7f7;
    text-align: center;
    line-height: 48px;
    font-size: 14px;
    color: #333;
}
.admin_button:hover{
	color: rgb(157 128 63);
	font-weight: 600;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_faq.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
    <main id="main-banner" class="main-banner-06">
        <div class="inner-wrap">
            <div class="title">
                <h2>고객센터</h2>
                <p>
			                    서비스 이용 중 불편 했던 점이나 궁금한 점을 <br />
			                    빠르고 친절하게 안내해 드리겠습니다.
                </p>
            </div>
            <div class="indicator">
                <div class="home circle">
                    <a href="#" title="메인페이지가기"><img src="${path }/resources/images/sub/icon_home.svg" alt="홈버튼이미지"></a>
                </div>
                <div class="main-menu circle">BOOKMATE</div>

            </div>
        </div>
    </main>
	<!-- 메인 메뉴바 시작 -->
	<ul class="menu_bar">
		<li class="menu_home">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="menu_faq">
			<a class="nav-link active" href="${pageContext.request.contextPath }/support/support_faq?">자주하는 질문</a>
		</li>
		<li class="menu_notice">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="menu_inquire">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
	<!-- 메인 메뉴바 끝 -->
	<!-- 검색 창 시작 -->
	<div class="search">
		<form action="" class="search_form" method="get">
			<input type="text" value="${keyword}"name="keyword" class="search_main" placeholder="예) 회원가입, 로그인, 결제 등" />
			<input type="submit" class="search_cs"/>
		</form>
	</div>
	<!-- 검색 창 끝 -->
	<!-- FAQ 메뉴바 -->
		<div class="main_content">
			<div class="tab_section">
			<ul class="tab_menu">
				<li>
					<a class="active" href="${pageContext.request.contextPath }/support/support_faq?">전체(${totalRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_user?category=1">회원(${categoryOneRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_request?category=2">모임신청(${categoryTwoRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_open?category=3">모임개설(${categoryThreeRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_etc?category=0">기타(${categoryZeroRow })</a>
				</li>
			</ul>
			<h3 class="faq">전체(${totalRow})</h3>
			<div class="tab_content">
			<ul>
				<c:forEach var="tmp" items="${list }">
					<li class="dropbox">
					<button type="button" class="btn_more">답변</button>
						<div class="title_area">
							<div class="category">
								<c:choose>
									<c:when test="${tmp.category == 1}">회원</c:when>
									<c:when test="${tmp.category == 2}">모임신청</c:when>
									<c:when test="${tmp.category == 3}">모임개설</c:when>
									<c:when test="${tmp.category == 0}">기타</c:when>
								</c:choose>
							</div>
							<h5 class="detail">${tmp.question }</h5>
						</div>
						<div class="detail_content">
							<span style="line-height: 24px;">
								<pre>${tmp.answer }</pre>
							</span>
						</div>
					</li>
				</c:forEach>
			</ul>
			</div>
			<!-- admin 관리 메뉴 -->
			<div class="admin_menu">
				<c:choose>
				    <c:when test="${isAdmin}">
				        <a href="${pageContext.request.contextPath }/support/support_faq_insertform" class="admin_button">FAQ 등록</a>
				    </c:when>
				    <c:otherwise>
				        <!-- 해당 부분은 admin이 아닐 때의 처리 -->
				    </c:otherwise>
				</c:choose>
				<c:if test="${isAdmin }">
					<button type="submit" data-num="${tmp.faq_num}" class="admin_button" id="delete-btn">삭제</button>
				</c:if>
			</div>
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$(document).ready(function(){
			
				$(".btn_more").click(function(e){
					e.preventDefault();
					$(this).closest(".dropbox").find(".detail_content").toggle();
				});
				// 처음에는 숨겨두기
				$(".detail_content").hide();
			});
			document.querySelectorAll("#delete-btn").forEach((item)=>{
				item.addEventListener("click", (e)=>{
					e.preventDefault();
					const isTrue = confirm("질문을 삭제하시겠습니까?")
					if(isTrue){
						const faqNum=e.target.getAttribute("data-num");
						location.href="${pageContext.request.contextPath}/support/support_faq_delete?faq_num=" + faqNum;
					}
				});
			});
	</script>

		<nav style="display:flex; justify-content:center; margin-bottom:30px;">
			<ul class="pagination" style="display:flex; justify-content:space-around; width:30%">
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link animate__animated" href="support_faq?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link animate__animated" href="support_faq?pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link animate__animated" href="support_faq?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
					</li>
				</c:if>				
			</ul>
		</nav>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





