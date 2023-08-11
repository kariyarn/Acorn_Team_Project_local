package com.acorn.soso.group.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group.dto.GroupFAQDto;
import com.acorn.soso.group.dto.GroupReviewDto;


public interface GroupService {
	//list가져오기
	public void getList(HttpServletRequest request, Model model);
	//getViewList 가져오기
	public void getViewList(HttpServletRequest request, Model model);	
	//ranking list 가져오기
	public void getRanking(HttpServletRequest request, Model model);
	//사진 upload*DB 저장하기
	public void saveImage(GroupDto dto, HttpServletRequest request);
	//detail 페이지에 필요한 data를 ModelAndView에 저장
	public void getDetail(HttpServletRequest request, Model model);
	//모임 개설하기
	public void insert(GroupDto dto, HttpServletRequest request, HttpSession session);
	//모임 업데이트(request로 수정사항을 받아서 dto에 저장한 다음에 전송)
	public void update(GroupDto dto, HttpServletRequest request);
	//모임 삭제-> 번호를 매개로 해서 삭제
	public void delete(int num);
	
	//리뷰에 관련한 기능
	//리뷰 저장
	public void saveReview(HttpServletRequest request);
	//리뷰 삭제
	public void deleteReview(HttpServletRequest request);
	//리뷰 수정
	public void updateReview(GroupReviewDto dto);
	//ajax 리스트 출력
	public void moreReview(HttpServletRequest request);
	//평점 평균
	public void avgRate(String title);
	//detail 페이지에 리뷰 보이게 하기 위한 리뷰 리스트 호출
	public void reviewList(HttpServletRequest request, Model model);
	
	//소모임 가입에 관련한 기능
	public void joinGroup(HttpServletRequest request);
	//가입 신청 여부를 확인한다.
	public void knowJoin(HttpServletRequest request);
	//소모임 가입 신청 취소
	public boolean cancleJoin(HttpServletRequest request);
	
	//소모임 faq에 관련한 기능
	//소모임 게시판에 글쓰기
	public void groupFAQInsert(GroupFAQDto dto);
	//소모임 문의 게시판 목록 불러오기, request로 값을 얻어오고 model에 담는다.
	public void groupFAQGetList(HttpServletRequest request, Model model);
	//소모임의 getData. request로 값을 얻어오고 model에 담는다.
	public void groupFAQGetData(HttpServletRequest request, Model model);
	//소모임 문의글 수정.request로 필요한 정보를 얻고 dto로 수정한다.
	public void updateGroupFAQ(HttpServletRequest request, GroupFAQDto dto);
	//소모임 문의글삭제.request로 필요한 정보를 얻고 num으로 수정한다.
	public void deleteGroupFAQ(HttpServletRequest request, int num);
	
	//ajax처리로 찜하기&찜취소 기능 구현
	public boolean jjim(HttpServletRequest request);
	//찜 여부 확인
	public void knowjjim(HttpServletRequest request);
	//찜 총 카운트
	public int jjimCount(HttpServletRequest request);
	//찜 리스트 출력
	public void getJjimList(HttpServletRequest request);
	
	public void getData(HttpServletRequest request);
	
}
