<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_inquire</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_inquire_register.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
        <jsp:param value="login" name="current"/>
    </jsp:include>
	<main id="content" class="cs inquire">
	<!-- 상단 배너 -->
	<div class="head">
		<h2 class="main_title">문의하기</h2>
		<p class="sub_text">BookMate에 궁금한 점이 있다면 문의해주세요.</p>
	</div>
	<!-- 메인 메뉴바 시작 -->
	<div class="main_area">
	<ul class="menu_bar">
		<li class="menu_home">
			<a class="nav-link active" href="${pageContext.request.contextPath }/suppo/support_main">고객센터</a>
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
				<ul class="inquire_navi">
					<li>
						<a href="${pageContext.request.contextPath }/support/support_inquire">1:1 문의하기</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/support/support_inquire_register">신고접수</a>
					</li>
					<li>
						<a class="my_inquire" href="${pageContext.request.contextPath }/support/support_inquire_MyInquire">나의 문의내역</a>
					</li>
				</ul>
				<h3>신고 접수</h3>
				<form action="" class="area_form">
					<div class="row-wrap">
						<div class="input_name">
							<h4 class="label">이름</h4>
							<input type="text" class="name" placeholder="이름을 입력해주세요..." />
						</div>
						<div class="input_phone">
							<h4 class="label">연락처</h4>
							<input type="tel" class="phone" placeholder="연락처를 입력해주세요..."/>
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_email">
							<h4 class="label">이메일 *</h4>
							<input type="text" class="email" placeholder="이메일을 입력해주세요" />
							<p class="tip_txt">* 답변 받을 이메일 주소를 확인해 주세요.</p>
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_register">
							<h4 class="label">신고 대상</h4>
							<input type="text" class="inquire_title" name="title" placeholder="신고할 아이디 또는 소모임 이름을 입력해 주세요..." />
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_text">
							<h4 class="label">내용 *</h4>
							<textarea name="content" placeholder="불량회원 또는 불량 소모임의 관련된 내용을 기재 해 주세요"></textarea>
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
					<div class="row-wrap">
						<div class="input_agreement">
							<h4 class="label">
								"개인정보"
								<br />
								"수집 및"
								<br />
								"이용 동의 *"
							</h4>
							<label>
							<input class="privacy_check" type="checkbox" name="privacy" value="1" />
							"작성해주신 이메일, 전화번호는 문의내용 확인 및 답변처리 용도로 쓰이며 3년간 보관 후 파기합니다."
							</label>
						</div>
					</div>
					<p class="info_message">
						이 사이트는 reCAPTCHA에 의해 보호되며 Google 개인 정보 취급 방침 및 서비스 약관이 적용됩니다.
					</p>
					<input type="submit" value="1 : 1 문의하기" class="btn_submit"/>
				</form>
			</div>
		</div>
	</div>
	
</main>
</body>
</html>





