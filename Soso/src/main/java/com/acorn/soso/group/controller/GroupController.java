package com.acorn.soso.group.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group.dto.GroupFAQDto;
import com.acorn.soso.group.dto.GroupReviewDto;
import com.acorn.soso.group.dto.JjimDto;
import com.acorn.soso.group.service.GroupService;
import com.acorn.soso.group_managing.service.GroupManagingService;

@Controller
public class GroupController {

	@Autowired
	private GroupService service;
	
	@Autowired
	private GroupManagingService managingService;	
	
	//소모임 FAQ의 Update
	@PostMapping("/group/faq/update")
	public String groupFaqUpdate(HttpServletRequest request, GroupFAQDto dto) {
		service.updateGroupFAQ(request, dto);
		return "group/list";
	}
	
	//소모임 FAQ의 updateform
	@GetMapping("/group/faq/updateform")
	public String groupFaqUpdateForm(HttpServletRequest request, Model model) {
		service.groupFAQGetData(request, model);
		return "group/faq/updateform";
	}
	
	//소모임 FAQ문의 delete문
	@GetMapping("/group/faq/delete")
	public String groupFaqDelete(HttpServletRequest request, int num) {
		service.deleteGroupFAQ(request, num);
		return "group/list";
	}	
	
	//소모임 FAQ문의 insert
	@PostMapping("/group/faq/insert")
	public String groupFaqInsert(HttpSession session, GroupFAQDto dto) {
		String writer=(String)session.getAttribute("id");
		//id 값만 넣어준다.
		dto.setQ_writer(writer);
		service.groupFAQInsert(dto);		
		return "group/list";
	}
	
	//소모임FAQ문의 insertform
	@GetMapping("/group/faq/insertform")
	public String groupFaqInsertForm(HttpServletRequest request, int num) {
		request.setAttribute("num", num);
		return "group/faq/insertform";
	}
	
	//소모임 FAQ 게시판 목록을 보기 위한 컨트롤러
	@GetMapping("/group/faq/list")
	public String groupFaqList(HttpServletRequest request, int num, Model model) {
		request.setAttribute("num", num);
		service.groupFAQGetList(request, model);
		return "group/faq/list";
	}
	
	//찜기능 목록 불러오기 위한 컨트롤러
	@GetMapping("/group/jjim_list")
	public String jjimList(HttpServletRequest request) {
		//찜 목록을 불러오기 위한 서비스
		service.getJjimList(request);
		//찜 리스트로 간다
		return "group/jjim_list";
	}

	//가입 신청 취소를 위한 컨트롤러
	@ResponseBody
	@GetMapping("/group/cancleJoin")
	public Map<String, Object> cancleJoin(HttpServletRequest request){
		boolean isSuccess = service.cancleJoin(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", isSuccess);
		return map;
	}
	
	//찜기능을 위한 컨트롤러
	//ajax를 위해 responseBody를 해준다.
	@ResponseBody
	@GetMapping("/group/jjim")
	public Map<String, Object> jjim(HttpServletRequest request) {
		boolean isSuccess = service.jjim(request); // 서비스 메서드의 리턴 값을 받아옴
		int jjimCount = service.jjimCount(request);//서비스 메소드의 리턴 값을 받아옴
		//responseBody가 애초에 json문자열을 돌려주겠다는 거니 그걸 통보해야한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", isSuccess);
		map.put("jjimCount", jjimCount);
		return map;
	}
		
	//리뷰 수정 요청 처리(json)
	@RequestMapping("/group/review_update")
	@ResponseBody
	public Map<String, Object> reviewUpdate(GroupReviewDto dto){
		service.updateReview(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	//소모임 가입 신청
	@PostMapping("/group/join")
	//num값을 가져오기 위한 request
	//정보를 담기 위한 model
	public String join(HttpServletRequest request) {
		service.joinGroup(request);
		//insert하면 리다일렉트->나중에 호출한 곳으로 돌아가는 로직 구상
		return "redirect:/";
	}
	
	//test페이지 불러오면서 후기글 불러오기 위한 service 호출
	@GetMapping("/group/group_page")
	public String test(HttpServletRequest request, Model model) {
		//request영역의 값으로 groupNum 가져오기 
		int num = Integer.parseInt(request.getParameter("num"));
		//groupManaging Service에서 정보 가져오기
		managingService.getGroupData(num, request);
		//소모임의 후기 글을 가져온다.
		//service.reviewList(request, model);
		
		//로그인 여부를 토대로 서비스 실행 여부를 정한다.
		String id =(String)request.getSession().getAttribute("id");
		if(id != null) {
			//소모임의 찜 여부를 가져온다.
			service.knowjjim(request);
			//소모임의 가입 신청 여부를 가져온다.
			service.knowJoin(request);		
		}
		model.addAttribute("jjimCount", service.jjimCount(request));
		return "group/group_page";
	}
	
	@GetMapping("/group/group_in")
	public String groupIn(HttpServletRequest request, int num) {
		request.setAttribute("num", num);
		return "group/group_in";
	}
	
	//리뷰 삭제
	@RequestMapping("/group/review_delete")
	@ResponseBody
	public Map<String, Object> reviewDelete(HttpServletRequest request){
		service.deleteReview(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	//댓글 더보기
	@RequestMapping("/group/ajax_review_list")
	public String reviewList(HttpServletRequest request) {
		try {
			Thread.sleep(1000);
		}catch(InterruptedException e) {
			e.printStackTrace();
		}
		service.moreReview(request);
		return "group/ajax_review_list";
	}
	//새로운 댓글 저장 요청 처리
	@RequestMapping("group/review_insert")
	public String reviewInsert(HttpServletRequest request, int ref_group) {
		service.saveReview(request);
		return "redirect:/group/detail?num="+ref_group;
	}
	
	//소모임 추가하기
	@PostMapping("/group/insert")
	public String insert(GroupDto dto, HttpServletRequest request, HttpSession session) {
		service.insert(dto, request, session);
		return "redirect:/group_managing/admin_main";
	}
	
	//delete
	@RequestMapping("/group/delete")
	public String delete(int num) {
		service.delete(num);
		return "redirect:/group/list";
	}
	//update
	@RequestMapping("/group/update")
	public String update(GroupDto dto, HttpServletRequest request) {
		service.update(dto, request);
		return "redirect:/group/list";
		
	}
	
	//updateform 이동
	@RequestMapping("/group/update_form")
	public String uploadform(HttpServletRequest request) {
		service.getData(request);
		return "group/update_form";
	}
	
	//detail 페이지
	@GetMapping("/group/detail")
	public String detail(HttpServletRequest request, Model model) {
		service.getDetail(request, model);		
		return "group/detail";

	}
	
	//사진 업로드 & DB 저장
	@RequestMapping(method = RequestMethod.POST, value = "/group/upload")
	public String upload(GroupDto dto, HttpServletRequest request) {
		service.saveImage(dto, request);
		return "redirect:/group/list";
	}
	
	//갤러리 form 페이지 이동
	@RequestMapping("/group/upload_form")
	public String upload_form() {
		return "group/upload_form";
	}
	
	//갤러리 리스트 이동
	@GetMapping("/group/list")
	public String list(HttpServletRequest request, Model model) {
		service.getList(request, model);
		return "group/list";
	}
	
	//랭킹 리스트 이동
	@RequestMapping("/ranking/list")
	public String Rankinglist(HttpServletRequest request, Model model) {
		service.getRanking(request, model );
		return "ranking/list";
	}
	
	//메인 페이지로 이동
	@RequestMapping("/")
	public String home(HttpServletRequest request, Model model) {
		service.getRanking(request, model);
		return "home";
	}
	
	//업데이트 폼 이동, 업데이트, 삭제는 일단 나중에 하기로ㅇㅇ
}
