package com.acorn.soso.group_managing.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group_managing.dao.GroupManagingDao;
import com.acorn.soso.group_managing.dto.GroupManagingDto;

@Service
public class GroupManagingServiceImpl implements GroupManagingService{
	
	@Autowired
	GroupManagingDao dao;
	
	@Override
	public void getGroupList(String manager_id, HttpServletRequest request) {
		List<GroupDto> list = dao.getGroupList(manager_id);
		request.setAttribute("list", list);
	}
	
	@Override
	public GroupDto getGroupData(int num, HttpServletRequest request) {
		GroupDto dto = dao.getGroupData(num);
		request.setAttribute("dto", dto);
		return dto;
	}
	
	@Override
	public void updateGroupData(GroupDto dto, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImage();
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/resources/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;
	      
		try {
			//기존 파일이 존재하면 삭제
			File existingFile = new File(filePath + saveFileName);
			if(existingFile.exists()) {
				existingFile.delete();
			}
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println();   //임시 출력
		}catch(Exception e) {
	         e.printStackTrace();
		}
		dto.setImg_path("/resources/upload/" + saveFileName);
		dao.updateGroupData(dto);
	}
	
	@Override
	public void deleteGroupData(int num) {
		dao.deleteGroupData(num);
	}
	
	//소모임 가입 신청자 리스트 불러오기
	@Override
	public void getApplicantList(int group_num, HttpServletRequest request) {
		List<GroupManagingDto> list = dao.getApplicantList(group_num);
		request.setAttribute("list", list);
	}
	
	@Override
	public void getRejectedApplicantList(int group_num, HttpServletRequest request) {
		List<GroupManagingDto> list = dao.getRejectedApplicantList(group_num);
		request.setAttribute("list", list);
	}	

	@Override
	public void joinApprove(int num, int group_num) {
		dao.joinApprove(num);
		dao.addMemberCount(group_num);
	}

	@Override
	public void getMemberList(int group_num, HttpServletRequest request) {
		List<GroupManagingDto> list = dao.getMemberList(group_num);
		request.setAttribute("list", list);
	}
	
	@Override
	public void getKickedMemberList(int group_num, HttpServletRequest request) {
		List<GroupManagingDto> list = dao.getKickedMemberList(group_num);
		request.setAttribute("list", list);
		
	}

	@Override
	public void getMemberCount(int num, HttpServletRequest request) {
		int memberCount = dao.getMemberCount(num);
		request.setAttribute("memberCount", memberCount);
	}

	@Override
	public void kick(int num, int group_num) {
		dao.kick(num);
		dao.minusMemberCount(group_num);
	}

	@Override
	public void reject(int num) {
		dao.reject(num);
	}

	@Override
	public void dropOut(int num) {
		dao.dropOut(num);
	}

	@Override
	public void getGroupList2(String user_id, HttpServletRequest request) {
		List<GroupDto> list = dao.getGroupList2(user_id);
		request.setAttribute("list", list);	
	}
}
