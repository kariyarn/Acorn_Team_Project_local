package com.acorn.soso.group_managing.dao;

import java.util.List;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group_managing.dto.GroupManagingDto;

public interface GroupManagingDao {
	//개설한 소모임 리스트 불러오기
	public List<GroupDto> getGroupList(String manager_id);
	//가입한 소모임 리스트 불러오기
	public List<GroupDto> getGroupList2(String user_id);
	//개설한 소모임 정보 불러오기
	public GroupDto getGroupData(int num);
	//개설한 소모임 정보 수정하기
	public void updateGroupData(GroupDto dto);
	//개설한 소모임 해산하기
	public void deleteGroupData(int num);
	//소모임 가입 멤버 목록 불러오기
	public List<GroupManagingDto> getMemberList(int group_num);
	//소모임 추방 멤버 목록 불러오기
	public List<GroupManagingDto> getKickedMemberList(int group_num);
	//소모임 가입 신청자 목록 불러오기
	public List<GroupManagingDto> getApplicantList(int group_num);
	//소모임 가입 거절 신청자 목록 불러오기
	public List<GroupManagingDto> getRejectedApplicantList(int group_num);
	//소모임 가입 승인하기
	public void joinApprove(int num);
	//소모임 가입자 수 증가(갱신)하기
	public void addMemberCount(int group_num);
	//소모임 가입자 수 증가(갱신)하기
	public void minusMemberCount(int group_num);
	//소모임 가입자 숫자 불러오기
	public int getMemberCount(int num);
	//소모임 가입자 추방하기
	public void kick(int num);
	//소모임 가입 신청자 거절하기
	public void reject(int num);
	//소모임 탈퇴하기
	public void dropOut(int num);
}
