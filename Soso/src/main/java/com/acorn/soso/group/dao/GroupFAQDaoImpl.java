package com.acorn.soso.group.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.soso.group.dto.GroupFAQDto;

@Repository
public class GroupFAQDaoImpl implements GroupFAQDao{

	@Autowired
	private SqlSession session;

	@Override
	public void insert(GroupFAQDto dto) {
		session.insert("groupFAQ.insert", dto);
	}

	@Override
	public List<GroupFAQDto> getList(GroupFAQDto dto) {
		return session.selectList("groupFAQ.getList", dto);
	}

	@Override
	public GroupFAQDto getData(int num) {
		return session.selectOne("groupFAQ.getData", num);
	}

	@Override
	public int getCount(GroupFAQDto dto) {
		return session.selectOne("groupFAQ.getCount", dto);
	}

	@Override
	public void update(GroupFAQDto dto) {
		session.update("groupFAQ.update", dto);		
	}

	@Override
	public void delete(int num) {
		session.delete("groupFAQ.delete", num);
	}
}
