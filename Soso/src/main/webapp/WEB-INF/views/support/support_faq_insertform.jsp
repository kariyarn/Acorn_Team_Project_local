<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_inquire</title>
<style>
	.faq_management{
	width: 240px;
    height: 60px;
    margin: 0 auto;
    display: block;
    border: 1px solid gray;
    border-radius: 30px;
    background-color: gray;
    color: white;
    font-size: 18px;
    text-align: center;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_inquire.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	
	<main id="content" class="cs inquire">
	<!-- 상단 배너 -->
	<div class="head">
		<h2 class="main_title">FAQ 관리</h2>
		<p class="sub_text">FAQ 질문을 등록하고 삭제 할 수 있습니다.</p>
	</div>
	<!-- 메인 메뉴바 시작 -->
	<div class="main_area">
	<ul class="menu_bar">
		<li class="menu_home">
			<a class="nav-link active" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="menu_faq">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_faq">자주하는 질문</a>
		</li>
		<li class="menu_notice">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="menu_inquire">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
		<div class="body_area">
			<div class="main_content">
				<h3>질문 등록</h3>
				<form action="" class="area_form">
					<div class="row-wrap">
						<div class="input_title">
							<h4 class="label">질문</h4>
							<select name="category" id="category" class="title_select">
								<option value selected="selected" class="inquire_select">분류</option>
								<option value="user">회원</option>
								<option value="request">모임신청</option>
								<option value="open">모임개설</option>
								<option value="etc">기타</option>
							</select>
							<input type="text" class="inquire_title" name="question" id="question" placeholder="질문을 입력해주세요" />
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_text">
							<h4 class="label">답변 *</h4>
							<textarea name="answer" id="answer" placeholder="답변내용을 입력 해 주세요."></textarea>
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_file">
							<h4 class="label">파일첨부</h4>
							<div class="file_box">
								<label for="" class="btn_upload">파일선택</label>
								<input type="text" class="upload_file" value="파일을 업로드 해주세요." disabled/>
							</div>
							<div class="file_wrap">
								<p class="tip_file">* 파일 용량은 최대
								2MB, 5개까지 등록이 가능합니다.</p>
							</div>
						</div>
					</div>
					<p class="info_message">
						이 사이트는 reCAPTCHA에 의해 보호되며 Google 개인 정보 취급 방침 및 서비스 약관이 적용됩니다.
					</p>
					<a href="${pageContext.request.contextPath }/support/support_faq_insert" class="faq_management">질문 등록</a>
				</form>
			</div>
		</div>
	</div>
	
</main>
</body>
</html>





