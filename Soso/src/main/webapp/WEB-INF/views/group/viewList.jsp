<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path }/resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/group_list.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="${path }/resources/js/jquery-1.12.0.min.js"></script>
    <script src="${path }/resources/js/jquery.easing.1.3.js"></script>
    <script src="${path }/resources/js/common.js"></script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>

    <main id="main-banner" class="main-banner-01">
        <div class="inner-wrap">
            <div class="title">
                <h2>북메이트 찾기</h2>
                <p>
			                    깊게 읽고 사유하는,<br>
			                    북메이트와 함께 취향의 독서를 나누세요.
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

    <section class="sub-contents mate_content">
        <div class="inner-wrap">
            <h3 class="title black" data-aos="fade-up"
            data-aos-offset="300"
            data-aos-easing="ease-in-sine">소모임 찾기</h3>
        </div>
        <div class="inner-wrap">
            <div class="mate_content_theme">
                <ul>
                    <li><a href="#">전체보기</a></li>
                    <li><a href="#">분류1</a></li>
                    <li><a href="#">분류2</a></li>
                    <li><a href="#">분류3</a></li>
                    <li><a href="#">분류4</a></li>
                </ul>
            </div>
            <div class="mate_content_theme">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/group/viewList">인기순</a></li>
                    <li><a href="${pageContext.request.contextPath}/group/list">최신순</a></li>
                </ul>
            </div>
        </div>
        <div class="inner-wrap">
        	<div class="theme_search">
            	<form action="list" method="get">
            	<input type="text" value="${keyword}" name="keyword" />
            		<select name="condition" id="condition">
            			<option value="name_caption" ${condition eq 'name_caption' ? 'selected' : '' }>모임명 +내용</option>
            			<option value="name"  ${condition eq 'name' ? 'selected' : '' }>모임명 </option>
            			<option value="writer"  ${condition eq 'manager_id' ? 'selected' : '' }>모임장</option>
            		</select>
            	<button type="submit">검색</button>
            	</form>
            </div>
        </div>
        <div class="inner-wrap">
        	<c:forEach var="tmp" items="${viewList}">
        		<div class="mate_content_list">
	               <div class="mate_contents">
	                   <a href="${pageContext.request.contextPath}/group/group_page?num=${tmp.num }">
	                       <div class="mate_content_img">
	                           <img src="${path }/resources/images/main/001.jpg" alt="테스트이미지1">
	                       </div>
	                   </a>
	                   <a href="detail?num=${tmp.num }&condition=${condition}&keyword=${encodedk}">
                       
	                   <a href="${pageContext.request.contextPath}/group/group_page?num=${tmp.num }">

	                       <div class="mate_content_text">
	                           <p class="mate_content_title">${tmp.name}</p>
	                           <p>모임장 ${tmp.manager_id}</p>
	                           <p>조회수 ${tmp.viewCount}</p>
	                           <p class="mate_content_date">${tmp.meeting_time}ㆍ금요일ㆍ${tmp.meeting_loc }</p>
	                       </div>
	                   </a>
	               </div>
	           </div>
        	</c:forEach>
        </div>
         <nav>
         <ul class="pagination">
            <%--
               startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
               &condition=${condition}&keyword=${encodedK}
             --%>
            <c:if test="${startPageNum ne 1 }">
               <li class="page-item">
                  <a class="page-link animate__animated" href="list?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
               </li>
            </c:if>
            <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
               <li class="page-item ${pageNum eq i ? 'active' : '' }">
                  <a class="page-link animate__animated" href="list?pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
               </li>
            </c:forEach>
            <%--
               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
             --%>
            <c:if test="${endPageNum lt totalPageCount }">
               <li class="page-item">
                  <a class="page-link animate__animated" href="list?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
               </li>
            </c:if>            
         </ul>
      </nav>
      <script>
         document.querySelectorAll(".pagination a").forEach(function(item){
            //item 은 a 의 참조값이다 모든 a 요소에 mouseover 이벤트가 발생했을때 실행할 함수 등록
            item.addEventListener("mouseover", function(e){
               //애니메이션 클래스를 추가해서 애니메이션이 동작하도록한다.
               e.target.classList.add("animate__swing");
            });
            //item 은 a 의 참조값이다 모든 a 요소에 animationend 이벤트가 발생했을때 실행할 함수 등록
            item.addEventListener("animationend", function(e){
               //애니메이션 클래스를 제거해서 다음번에 추가 되면 다시 애니매이션이 동작 되도록한다.
               e.target.classList.remove("animate__swing");
            });
         });
      </script>
    </section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
</body>
</html>