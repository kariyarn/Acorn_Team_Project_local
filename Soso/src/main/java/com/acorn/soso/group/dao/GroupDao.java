package com.acorn.soso.group.dao;

import java.util.List;

import com.acorn.soso.group.dto.GroupDto;


public interface GroupDao {
	//모 소모임의 리스트
	public List<GroupDto> getList(GroupDto dto);
	//소모임 조회수 리스트
	public List<GroupDto> getViewList(GroupDto dto);
	//랭킹 리스트
	public List<GroupDto> getRanking(GroupDto dto);	
	//모든 Row의 갯수
	public int getCount(GroupDto dto);
	//소모임 개설하기
	public void insert(GroupDto dto);
	//pk를 이용해 게시글 하나의 data 가져오기
	public GroupDto getData(int num);
	//Sting를 이용해 게시글 하나의 data 가져오기
	public GroupDto getData(String title);
	//모임 삭제
	public void delete(int num);
	//모임 수정
	public void update(GroupDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
}
