package com.acorn.soso.group.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.soso.group.dto.GroupDto;

@Repository
public class GroupDaoImpl implements GroupDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<GroupDto> getList(GroupDto dto) {
		return session.selectList("group.getList", dto);
	}
	//랭킹 리스트
	@Override
	public List<GroupDto> getRanking(GroupDto dto) {
		return session.selectList("group.getRanking", dto);
	}


	@Override
	public void insert(GroupDto dto) {
		session.insert("group.insert", dto);
		
	}

	@Override
	public GroupDto getData(int num) {
		return session.selectOne("group.getData", num);
	}

	@Override
	public void delete(int num) {
		session.delete("group.delete", num);
	}

	@Override
	public void update(GroupDto dto) {
		session.update("group.update", dto);
	}

	@Override
	public GroupDto getData(String title) {
		return session.selectOne("group.getData2", title);
	}

	@Override
	public int getCount(GroupDto dto) {
		return session.selectOne("group.getCount", dto);
	}
}
