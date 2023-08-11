package com.acorn.soso.group_managing.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group_managing.dto.GroupManagingDto;

public interface GroupManagingService {
	public void getGroupList(String manager_id, HttpServletRequest request);
	public void getGroupList2(String user_id, HttpServletRequest request);
	public GroupDto getGroupData(int num, HttpServletRequest request);
	public void updateGroupData(GroupDto dto, HttpServletRequest request);
	public void deleteGroupData(int num);
	public void getMemberList(int group_num, HttpServletRequest request);
	public void getKickedMemberList(int group_num, HttpServletRequest request);
	public void getApplicantList(int group_num, HttpServletRequest request);
	public void getRejectedApplicantList(int group_num, HttpServletRequest request);
	public void joinApprove(int num, int group_num);
	public void getMemberCount(int num, HttpServletRequest request);
	public void kick(int num, int group_num);
	public void reject(int num);
	public void dropOut(int num);
}
