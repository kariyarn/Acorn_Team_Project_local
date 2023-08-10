package com.acorn.soso.support.faq.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.acorn.soso.cafe.dto.CafeDto;
import com.acorn.soso.support.faq.dao.FaqDao;
import com.acorn.soso.support.faq.dto.FaqDto;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;

	@Override
	public void getList(HttpServletRequest request, Model model) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}

		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
			
		//FaqDto 객체에 startRowNum 과 endRowNum 을 담는다.
		FaqDto dto=new FaqDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("category_question")){//분류 + 질문 검색인 경우
				//검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setCategory(keyword);
				dto.setQuestion(keyword);
			}else if(condition.equals("category")){ //분류 검색인 경우
				dto.setCategory(keyword);
			}else if(condition.equals("question")){ //질문 검색인 경우
				dto.setQuestion(keyword);
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		//글 목록 얻어오기 
		List<FaqDto> list=faqDao.getList(dto);
		//전체글의 갯수
		int totalRow=faqDao.getCount(dto);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 Model 에 담아준다. 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("encodedK", encodedK);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("list", list);
		model.addAttribute("totalRow", totalRow);
		
	}
	// 질문 수정에 필요한 질문 정보
	@Override
	public void getData(HttpServletRequest request) {
		//수정할 질문 번호
		int num=Integer.parseInt(request.getParameter("num"));
		// 수정할 질문의 정보를 얻어와서
		FaqDto dto=faqDao.getData(num);
		//request에 담아준다.
		request.setAttribute("dto", dto);
	}
	// 질문 등록
	@Override
	public void saveFaq(FaqDto dto) {
		faqDao.insert(dto);
	}
	// 질문 수정
	@Override
	public void updateFaq(FaqDto dto) {
		faqDao.update(dto);
	}
	// 질문 삭제
	@Override
	public void deleteFaq(int num, HttpServletRequest request) {
		faqDao.delete(num);
	}

	@Override
	public void getData(FaqDto dto) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
