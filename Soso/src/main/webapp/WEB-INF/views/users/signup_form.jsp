<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/users/capsLock.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
		<jsp:param value="signup" name="current" />
	</jsp:include>
	<div class="container" >
		<p class="title">회원 가입</p>
		<form action="${pageContext.request.contextPath}/users/signup" method="post" id="myForm">
			<div class="mb-4">
				<label class="control-label mb-2" for="name">이름(닉네임)</label>
				<input class="form-control" type="text" name="name" id="userName" autocomplete='off'/>
				<div><span id="result_checkUserName" style="font-size: 12px;"></span></div>
			</div>
			<div class="mb-4">
				<label class="control-label mb-2" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" autocomplete='off'/>
				<div><span id="result_checkId" style="font-size: 12px;"></span></div>
			</div>
			<div class="mb-4 abc" >
				<label class="control-label mb-2" for="pwd">비밀번호</label>
				<div class="input-group">
					<input class="form-control" type="password" name="pwd" id="pwd" onkeyup="checkCapsLock(event)"/> 
					<button class="btn btn-outline-gray bi-eye-slash" type="button" id="openpwd"></button>
					<div id="capsLockMessage" class="arrow_box">Caps Lock이 켜져 있습니다</div>
				</div> 
				<div class="invalid-feedback" id="pwd-feedback">최소 8자 이상, 20글자 이하로 문자와 숫자, 특수 문자를 각각 하나 이상 조합하세요.</div>
			</div>
			<div class="mb-4">
				<label class="control-label mb-2" for="pwd2">비밀번호 확인</label>
				<div class="input-group">
					<input class="form-control" type="password" name="pwd2" id="pwd2" onkeyup="checkCapsLock2(event)"/>
					<button class="btn btn-outline-gray bi-eye-slash" type="button" id="openpwd2"></button>
					<div id="capsLockMessage2" class="arrow_box">Caps Lock이 켜져 있습니다</div>
				</div>
				<div class="invalid-feedback" id="pwd2-feedback">비밀번호가 일치하지 않습니다.</div>
			</div>
			<script>
				const capsLockMessage = document.getElementById("capsLockMessage");
				function checkCapsLock(event)  {
		        	if (event.getModifierState("CapsLock")) {
		        		capsLockMessage.style.display = "block"; // 팝오버 표시
		           	} else {
		           		capsLockMessage.style.display = "none"; // 팝오버 숨김
		           	}
		         }
				const capsLockMessage2 = document.getElementById("capsLockMessage2");
				function checkCapsLock2(event)  {
		        	if (event.getModifierState("CapsLock")) {
		        		capsLockMessage2.style.display = "block"; // 팝오버 표시
		           	} else {
		           		capsLockMessage2.style.display = "none"; // 팝오버 숨김
		           	}
		         }
			</script>
			<div class="mb-4">
				<label class="control-label mb-2" for="email">이메일</label> <input
					class="form-control" type="text" name="email" id="email" autocomplete='off'/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<div>
				<fieldset class="fieldarea f2">
					<div class="d-flex justify-content-between align-items-center mb-2">
						<h1 class="h3 mb-3 font-weight-normal">이용약관(필수)</h1>
						<div class="d-flex col-6 justify-content-end">
							<label class="me-2" for="allAgreements">전체동의</label>
							<input class="signup_checkbox" id="allAgreements" type="checkbox" v-model="allAgreed" />
						</div>
					</div>
					<p class="agreeText">
						<textarea style="height: 100px" class="mb-4" id="text1" readonly>북메이트 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
						
본 약관은 다양한 북메이트 서비스의 이용과 관련하여 북메이트 서비스를 제공하는 북메이트 주식회사(이하 ‘북메이트’)와 이를 이용하는 북메이트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 북메이트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 
북메이트 서비스를 이용하시거나 북메이트 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 다양한 북메이트 서비스를 즐겨보세요.북메이트는 북메이트 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 북메이트 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 북메이트 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다. 북메이트는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다. 북메이트 서비스에는 기본적으로 본 약관이 적용됩니다만 북메이트가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 북메이트페이, V LIVE 등)가 있습니다. 그리고 북메이트 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다. 회원으로 가입하시면 북메이트 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 북메이트는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 북메이트 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 북메이트 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 북메이트 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 북메이트 회원가입 방법 등에서 확인해 주세요. 북메이트는 단체에 속한 여러 구성원들이 공동의 계정으로 북메이트 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다. 따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 북메이트 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다. 단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 북메이트 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다. 여러분이 제공한 콘텐츠를 소중히 다룰 것입니다. 북메이트는 여러분이 게재한 게시물이 북메이트 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 북메이트 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다. 북메이트는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다. 한편, 북메이트 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다. 게시물 게재로 여러분은 북메이트에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다. 북메이트는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 북메이트 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다. 만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다. 또한 여러분이 제공한 소중한 콘텐츠는 북메이트 서비스를 개선하고 새로운 북메이트 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 북메이트 및 북메이트 계열사에서 사용될 수 있습니다. 북메이트는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다. 북메이트는 여러분이 자신이 제공한 콘텐츠에 대한 북메이트 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 북메이트 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다. 다만, 일부 북메이트 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다. 여러분의 개인정보를 소중히 보호합니다. 북메이트는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 북메이트가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다. 북메이트는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다. 타인의 권리를 존중해 주세요.
여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 
						북메이트는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요. 한편, 북메이트 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다. 북메이트는 여러분이 북메이트 서비스를 마음껏 이용할 수 있도록 여러분께 북메이트 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 북메이트가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요. 북메이트에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.
북메이트는 여러분이 북메이트 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 
						포인트는 여러분의 일정한 북메이트 서비스 이용과 연동하여 북메이트가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 북메이트 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요. 북메이트는 북메이트 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 북메이트가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 북메이트 서비스 이용 시 유의해 주시기 바랍니다. 북메이트 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다. 북메이트는 여러분이 북메이트 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 북메이트 서비스를 보다 안전하게 이용하고 북메이트 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 북메이트 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다. 회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다. 타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다. 관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다. 자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다. 자동화된 수단을 활용하는 등 북메이트 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 북메이트 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 북메이트 서비스 이용에 불편을 초래하고 더 나아가 북메이트의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다. 북메이트의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 북메이트 서비스 회원으로 가입을 시도 또는 가입하거나, 북메이트 서비스에 로그인을 시도 또는 로그인하거나, 북메이트 서비스 상에 게시물을 게재하거나, 북메이트 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 북메이트 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 북메이트 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 북메이트 서비스의 제공 취지에 부합하지 않는 방식으로 북메이트 서비스를 이용하거나 이와 같은 북메이트 서비스에 대한 어뷰징(남용) 행위를 막기 위한 북메이트의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다. 북메이트의 동의 없이 자동화된 수단에 의해 북메이트 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 북메이트 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 북메이트 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 북메이트 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다. 북메이트는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다. 부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다. 북메이트는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 북메이트가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다. 또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 북메이트는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 북메이트 서비스 이용에 대한 주의를 당부하거나, 북메이트 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 북메이트 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다. 부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다. 북메이트의 잘못은 북메이트가 책임집니다.
북메이트는 여러분이 북메이트 서비스를 이용함에 있어 북메이트의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 북메이트가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 북메이트는 책임을 부담하지 않습니다. 그리고 북메이트가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다. 한편, 북메이트 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 북메이트는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다. 언제든지 북메이트 서비스 이용계약을 해지하실 수 있습니다. 북메이트에게는 참 안타까운 일입니다만, 회원은 언제든지 북메이트 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 북메이트는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다. 북메이트 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 북메이트가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다. 일부 북메이트 서비스에는 광고가 포함되어 있습니다. 여러분이 다양한 북메이트 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 북메이트 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다. 원하는 북메이트 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 북메이트 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 북메이트가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다. 북메이트는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다. 서비스 중단 또는 변경 시 꼭 알려드리겠습니다. 북메이트는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다. 한편, 북메이트는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다. 이 경우 북메이트는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다. 주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
북메이트는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 북메이트 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다. 북메이트는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 북메이트는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다. 여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다. 북메이트는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다. 북메이트는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다. 북메이트는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 북메이트에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 북메이트로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다. 북메이트 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다. 본 약관은 한국어를 정본으로 합니다. 본 약관 또는 북메이트 서비스와 관련된 여러분과 북메이트와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 북메이트 서비스와 관련하여 여러분과 북메이트 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.
공지 일자: 2023년 7월 28일
적용 일자: 2023년 8월 30일
북메이트 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터로 문의 주시기 바랍니다.
						</textarea>
						<div class="d-flex justify-content-end align-items-center mb-4">
							<label for="agreement1">위의 내용에 동의 합니다.</label>
							<input class="signup_checkbox ms-2" id="agreement1" type="checkbox" name="agreement1" />
						</div>
					</p>
				</fieldset>
				<fieldset class="fieldarea f3">
					<h1 class="h3 mb-3 font-weight-normal" style="width: 30rem">개인정보취급방침(필수)</h1>
					<p class="agreeText">
					<textarea style="height: 100px" class="mb-4" id="text2" readonly>개인정보보호법에 따라 북메이트에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
회원가입 시점에 북메이트가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.
- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.
- 북메이트 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다. 구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,북메이트에서 제공하는 위치기반 서비스에 대해서는 '북메이트 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다. 이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

2. 수집한 개인정보의 이용
북메이트 및 북메이트 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. 신규 서비스 요소의 발굴 및 기존 서비스 개선 등에는 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 생성·제공·추천, 상품 쇼핑 등에서의 인공지능(AI) 기술 적용이 포함됩니다.
- 법령 및 북메이트 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
- 스마트플레이스 분쟁 조정 및 고객문의 대응
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
- 북메이트 플러스 멤버십 서비스 혜택 중복 제공 방지
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
- 북메이트 엑스퍼트 재가입 신청 및 부정 이용 방지
북메이트 엑스퍼트 서비스 및 북메이트 엑스퍼트 센터 가입 등록정보&판매자 이름 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
- 전자서명 인증 업무
개인정보: 북메이트 인증서 서비스 해지 시까지 보관
인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 5년 보관
전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 북메이트는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 통신비밀보호법
로그인 기록: 3개월

참고로 북메이트는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
						</textarea>
						<div class="d-flex justify-content-end align-items-center mb-4">
							<label for="agreement2">위의 내용에 동의 합니다.</label> 
							<input class="signup_checkbox ms-2" id="agreement2" type="checkbox" name="agreement2" />
						</div>
					</p>
				</fieldset>
				<fieldset class="fieldarea f3">
					<h1 class="h3 mb-3 font-weight-normal" style="width: 30rem">마케팅 이용약관(선택)</h1>
					<p class="agreeText">
						<textarea style="height: 100px" class="mb-4" id="text3" readonly>북메이트는 개인정보 보호법 제22조 제4항과 제39조의 3에 따라 사용자의 광고성 정보 수신과 이에 따른 개인정보 처리에 대한 동의를 받고 있습니다. 약관에 동의하지 않으셔도 북메이트의 모든 서비스를 이용하실 수 있습니다. 다만 이벤트, 혜택 등의 제한이 있을 수 있습니다.

- 개인정보 수집 항목
- 이름,휴대폰 번호,이메일,성별,생년월일

- 개인정보 수집 이용 목적
- 이벤트 운영 및 광고성 정보 전송
- 서비스 관련 정보 전송

- 보유 및 이용 기간
- 동의 철회 시 또는 회원 탈퇴 시까지
						</textarea>
						<div class="d-flex justify-content-end align-items-center mb-4">
							<label for="agreement3">위의 내용에 동의 합니다.</label> 
							<input class="signup_checkbox ms-2" id="agreement3" type="checkbox" name="agreement3" />
						</div>
					</p>
				</fieldset>
			</div>
			<div class="d-flex justify-content-center">
				<button class="btn btn-join mt-3" type="submit" disabled>가입하기</button>
			</div>
		</form>
	</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="path-to-your-custom-theme.css"> <!-- 사용자 정의 테마 CSS 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/open_pwd.js"></script>
	<script>
   		let isUserNameValid=false;
   		// 아이디 입력란을 수정할 때마다 유효성 검사와 중복 검사 수행
   	    $("#userName").on("input", function() {
   	        let member_UserName = $(this).val();
   	        const reg = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
   	        if (member_UserName === '') {
   	            $("#result_checkUserName").html("이름(닉네임)을 입력하세요.").css("color", "red");
   	            $("#userName").removeClass("is-valid").addClass("is-invalid");
   	        	isUserNameValid = false; // 아이디 입력 안 함 처리
   	            checkFormState(); // 폼 상태 재검사
   	            return;
   	        }
   	        if (!reg.test(member_UserName)) {
   	            $("#result_checkUserName").html("2~16자의 영어(소문자) 또는 숫자 또는 한글만 사용가능합니다.").css("color", "red");
   	            $("#userName").removeClass("is-valid").addClass("is-invalid");
   	         	isUserNameValid = false; // 정규표현식 검사 실패
   	            checkFormState(); // 폼 상태 재검사
   	            return;
   	        }
   	        $.ajax({
   	            method: "post",
   	            url: "${pageContext.request.contextPath}/users/nameCheck",
   	            data: {"name": member_UserName},
   	            success: function(data) {
   	                console.log(data);
   	                if (data) {
   	                    $("#result_checkUserName").html("이미 사용중인 이름(닉네임)입니다.").css("color", "red");
   	                    $("#userName").removeClass("is-valid").addClass("is-invalid");
   	                	isUserNameValid = false; // 중복 닉네임 검사 실패
   	                } else {
   	                    $("#result_checkUserName").html("사용 가능한 이름(닉네임)입니다.").css("color", "green");
   	                    $("#userName").removeClass("is-invalid").addClass("is-valid");
   	                 	isUserNameValid = true; // 중복 닉네임 검사 통과
   	                }
   	                checkFormState(); // 폼 상태 재검사
   	            },
   	            error: function(error) {
   	                alert(error);
   	            }
   	        });
   	    });
   		
   		let isIdValid=false;
   		// 아이디 입력란을 수정할 때마다 유효성 검사와 중복 검사 수행
   	    $("#id").on("input", function() {
   	        let member_id = $(this).val();
   	        const reg = /^[a-z][a-z0-9]{1,14}$/;
   	        if (member_id === '') {
   	            $("#result_checkId").html("아이디를 입력하세요.").css("color", "red");
   	            $("#id").removeClass("is-valid").addClass("is-invalid");
   	            isIdValid = false; // 아이디 입력 안 함 처리
   	            checkFormState(); // 폼 상태 재검사
   	            return;
   	        }
   	        if (!reg.test(member_id)) {
   	            $("#result_checkId").html("2~15자의 영어 소문자와 숫자 조합으로 입력하세요.").css("color", "red");
   	            $("#id").removeClass("is-valid").addClass("is-invalid");
   	            isIdValid = false; // 정규표현식 검사 실패
   	            checkFormState(); // 폼 상태 재검사
   	            return;
   	        }
   	        $.ajax({
   	            method: "post",
   	            url: "${pageContext.request.contextPath}/users/idCheck",
   	            data: {"id": member_id},
   	            success: function(data) {
   	                console.log(data);
   	                if (data) {
   	                    $("#result_checkId").html("이미 사용중인 아이디입니다.").css("color", "red");
   	                    $("#id").removeClass("is-valid").addClass("is-invalid");
   	                    isIdValid = false; // 중복 아이디 검사 실패
   	                } else {
   	                    $("#result_checkId").html("사용 가능한 아이디입니다.").css("color", "green");
   	                    $("#id").removeClass("is-invalid").addClass("is-valid");
   	                    isIdValid = true; // 중복 아이디 검사 통과
   	                }
   	                checkFormState(); // 폼 상태 재검사
   	            },
   	            error: function(error) {
   	                alert(error);
   	            }
   	        });
   	    });
   
   		let isPwdValid=false;
	   	//비밀번호 입력란과 비밀번호 확인란에 입력했을때 실행할 함수 등록(다중선택)
	   	$("#pwd").on("input", () => {
		  const pwd = $("#pwd").val();
		  const reg = /^(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,20}$/;
		  isPwdValid = reg.test(pwd);
		  
		  if (pwd !== '') {
		    if (isPwdValid) {
		      $("#pwd").removeClass("is-invalid").addClass("is-valid");
		      $("#pwd-feedback").hide();
		    } else {
		      $("#pwd").removeClass("is-valid").addClass("is-invalid");
		      $("#pwd-feedback").show();
		    }
		  }
		  
		  checkFormState();
		});
	   	
	   	$("#pwd2").on("input", () => {
	   	  const pwd = $("#pwd").val();
	   	  const pwd2 = $("#pwd2").val();
	   	  
	   	  if (pwd2 !== '') {
	   	    if (pwd === pwd2) {
	   	      $("#pwd2").removeClass("is-invalid").addClass("is-valid");
	   	   	  $("#pwd2-feedback").hide();
	   	    } else {
	   	      $("#pwd2").removeClass("is-valid").addClass("is-invalid");
	   	      $("#pwd2-feedback").show();
	   	    }
	   	  }
	   	  
	   	  checkFormState();
	   	});
	   	
	   	
	   	let isEmailValid=false;
	   	$("#email").on("input", (e) => {
	   	  const inputEmail = $(e.target).val();
	   	  const reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	   	  isEmailValid = reg.test(inputEmail);
	   	  
	   	  if (inputEmail !== '') {
	   	    if (isEmailValid) {
	   	      $(e.target).removeClass("is-invalid").addClass("is-valid");
	   	      $(".invalid-feedback.email-feedback").hide();
	   	    } else {
	   	      $(e.target).removeClass("is-valid").addClass("is-invalid");
	   	      $(".invalid-feedback.email-feedback").show();
	   	    }
	   	  }
	   	  
	   	  checkFormState();
	   	});
   		
	   	$(document).ready(function() {
	   	    // 체크박스 체크여부
	   	    $("input:checkbox[name^='agreement']").click(checkedChange);

	   	    function checkedChange() {
	   	        if ($(this).prop("checked")) {
	   	            $("label[for=" + this.id + "]").text("동의되었습니다.");
	   	            $("label[for=" + this.id + "]").css("color", "blue");
	   	        } else {
	   	            $("label[for=" + this.id + "]").text("위의 내용에 동의 합니다.");
	   	            $("label[for=" + this.id + "]").css("color", "");
	   	        }

	   	        // 전체 동의 체크박스 상태 관리
	   	        const allAgreements = $("#allAgreements");
	   	        const agreementCheckboxes = $("input:checkbox[name^='agreement']");

	   	        if (agreementCheckboxes.length === agreementCheckboxes.filter(":checked").length) {
	   	            allAgreements.prop("checked", true);
	   	        } else {
	   	            allAgreements.prop("checked", false);
	   	        }

	   	        // 체크 상태에 따라 버튼 활성화 여부 관리
	   	        checkFormState();
	   	    }

	   	    // 전체 동의 체크박스 클릭 시 하위 체크박스들도 일괄 선택/해제
	   	    $("#allAgreements").click(function() {
	   	        const isChecked = $(this).prop("checked");
	   	        $("input:checkbox[name^='agreement']").prop("checked", isChecked);
	   	        agreementCheckboxesLabelUpdate();
	   	        checkFormState();
	   	    });

	   	    // 하위 체크박스들의 레이블 업데이트 함수
	   	    function agreementCheckboxesLabelUpdate() {
	   	        $("input:checkbox[name^='agreement']").each(function() {
	   	            if ($(this).prop("checked")) {
	   	                $("label[for=" + this.id + "]").text("동의되었습니다.");
	   	                $("label[for=" + this.id + "]").css("color", "blue");
	   	            } else {
	   	                $("label[for=" + this.id + "]").text("위의 내용에 동의 합니다.");
	   	                $("label[for=" + this.id + "]").css("color", "");
	   	            }
	   	        });
	   	    }

	   	    // 폼 전체의 유효성 여부를 판단해서 제출버튼의 disabled 속성을 관리하는 함수 
	   	    function checkFormState() {
	   	        // ... (이전에 작성한 코드 그대로 유지)
	   	    }

	   	    // 페이지 로딩 시 초기 전체 동의 체크박스 상태 설정
	   	    agreementCheckboxesLabelUpdate();
	   	    checkFormState();
	   	});
	   	
	 	// 마케팅 이용약관(선택) 체크박스 체크여부
	   	$("#agreement3").click(marketingAgreementChange);

	   	function marketingAgreementChange() {
	   	    if ($(this).prop("checked")) {
	   	        $("label[for=agreement3]").text("동의되었습니다.");
	   	        $("label[for=agreement3]").css("color", "blue");
	   	    } else {
	   	        $("label[for=agreement3]").text("위의 내용에 동의 합니다.");
	   	        $("label[for=agreement3]").css("color", ""); // 원래 색상으로 되돌림
	   	    }

	   	    // 체크 상태에 따라 버튼 활성화 여부 관리
	   	    checkFormState();
	   	}

	 	// 폼 전체의 유효성 여부를 판단해서 제출버튼의 disabled 속성을 관리하는 함수 
	    function checkFormState() {
	        const isAgreement1Checked = $("#agreement1").prop("checked");
	        const isAgreement2Checked = $("#agreement2").prop("checked");

	        const isAllValid = isUserNameValid && isIdValid && isEmailValid && isPwdValid && isAgreement1Checked && isAgreement2Checked;

	        $("button[type=submit]").prop("disabled", !isAllValid);
	        if(isAllValid){
	        	$("button[type=submit]").css("background-color", "rgb(65, 75, 178)");
	        }
	    }

	    document.addEventListener("DOMContentLoaded", function() {
	        const allAgreements = document.getElementById("allAgreements");
	        const agreementCheckboxes = document.querySelectorAll('input[name^="agreement"]');

	        allAgreements.addEventListener("change", function() {
	            for (const checkbox of agreementCheckboxes) {
	                checkbox.checked = this.checked;
	            }
	            checkFormState(); // 전체 동의 체크박스를 클릭할 때는 checkFormState() 호출
	        });

	        for (const checkbox of agreementCheckboxes) {
	            checkbox.addEventListener("change", function() {
	                checkFormState();
	                if (!this.checked) {
	                    allAgreements.checked = false;
	                }
	            });
	        }

	        // 기존의 checkFormState 함수 내용 호출
	        checkFormState();
	    });
	    
	    $(document).ready(function() {
	        $("#birth").datepicker({
	            dateFormat: "yy-mm-dd", // 날짜 형식을 지정할 수 있음
	            showOtherMonths: true, // 다른 달의 날짜도 표시
	            selectOtherMonths: true, // 다른 달의 날짜도 선택 가능
	        });
	    });
   </script>

</body>
</html>



















