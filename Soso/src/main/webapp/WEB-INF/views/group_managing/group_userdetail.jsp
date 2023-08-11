<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/group_managing/group_userdetail.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing_user_detail.css" />
</head>
<body>
	<div class="container">
	   <nav>
	      <ul class="breadcrumb">
	         <li class="breadcrumb-item">
	            <a href="${pageContext.request.contextPath }/">메인 홈</a>
	         </li>
	         <li class="breadcrumb-item">
	            <a href="${pageContext.request.contextPath }/group_managing/user_main">가입 모임 리스트</a>
	         </li>
	  	 	 <li class="breadcrumb-item">
	  	 		 <a href="javascript:deleteConfirm()">모임 탈퇴</a>
	  	 	 </li>
	      </ul>
	   </nav>
      <div class="main_container">
          <img src="${pageContext.request.contextPath}/resources/images/${dto.imagePath}"/>   
          <div class="card mb-4">
              <div class="card-body">
                  <p class="card-title fs-3"><strong>${tmp.name}</strong></p>
                  <p class="card-text">${tmp.caption}</p>
              </div>
                   <ul class="list-group list-group-flush">
                      <li class="list-group-item"><strong>모임장  : ${tmp.manager_id}</strong></li>
                      <li class="list-group-item"><strong>모임 날짜  : ${tmp.meeting_time}</strong></li>
                      <li class="list-group-item"><strong>모임 장소  : ${tmp.meeting_loc }</strong></li>
                  </ul>
           </div>
      </div>   	         
	</div>
	<div class="container">
		<br>	
		<h2 style="text-align: center">모임 후기</h2>
		<div style="width:100%; text-align:right;">
			<a href="${pageContext.request.contextPath }/group_managing/userdetail_insertform" class="btn btn-outline-dark" tabindex="-1" role="button" aria-disabled="true">후기쓰기</a>
		</div>
		<br>
		<table class="table ">
			<thead class="table-group-divider">
				<tr>	
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th style="text-align: center">조회수</th>
					<th class="time" style="text-align: center">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>
							<a style="color: black;"  class="text-decoration-none" href="detail?num=${tmp.num }&condition=${condition}&keyword=${encodedK}">${tmp.title }</a>
						</td>
						<td style="text-align: center">${tmp.viewCount }</td>
						<td style="text-align: center">${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<!-- 검색 폼 -->
			<form action="list" method="get">
				<label for="condition">검색조건</label>	
				<select name="condition" id="condition">
					<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
					<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
					<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
	<br />
	<div class="container">
		<br />
		<h3 style="text-align: center">모임 사진첩</h3>
		<br />
		<div class="photo_container">
			<div class="img-wrapper">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMDRfMTcx%2FMDAxNjM2MDIxOTI4Mjk5.gG1CkTWtdyN3dvFvNjSShrP0RaKmaskEgEW_NcCOTxEg.iN1k2ZScXbPJfvMEjlUOruyuJyePA_To7wS-r3xLju8g.JPEG.hayeon_0529%2FSNOW%25A3%25DF20211023%25A3%25DF161405%25A3%25DF753%25A3%25DFmr1634974283678.jpg&type=a340"/>
			</div>
			<div class="img-wrapper">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA0MDJfNzQg%2FMDAxNjQ4ODU4OTAxMjg4._Tg5-vdmUxKo0UGW8jNuE8ufBTyE5Z6x7Sq2d2ryIDAg.JpNEbi3awW8eXn-uBv85dXSJF3d7dR1NeYv2psDmhIgg.JPEG.happynews24%2FIMG_20220402_092059_765.jpg&type=a340"/>
			</div>
			<div class="img-wrapper">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20160202_284%2Fsanmax0519_1454424005867eBV1d_JPEG%2F06.jpg&type=a340"/>
			</div>
			<div class="img-wrapper">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMzFfMTY2%2FMDAxNjY3MTQ5MDcxMzUz.j5Fhq7WCJt1_XWE-zaifKA3nVLnNFaVi6i6-96lxUlQg.auRKxClgKVhc0oD6HNmNQWH5ZtyDDxq8Xe0suQ_PQCYg.PNG.seong5872%2Fimage.png&type=a340"/>
			</div>
		</div>
	</div>
	<script>
		function deleteConfirm(){
			const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
			if(isDelete){
				location.href="${pageContext.request.contextPath}/group_managing/dropOut";
			}
		}
	</script>
</body>
</html>

