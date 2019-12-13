package com.model2.mvc.service.chatting.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.chatting.ChattingDao;
import com.model2.mvc.service.domain.Chatting;


@Repository("chattingDaoImpl")
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public ChattingDaoImpl() {
		System.out.println("::"+getClass()+".chattingDaoImpl().....");
	}
	
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
		
	}
	@Override
	public int addChatting(Chatting chat) throws Exception {
		
		return sqlSession.insert("ChattingMapper.addChatting",chat);
	}

	@Override
	public Chatting getChatting() throws Exception {
		
		return sqlSession.selectOne("ChattingMapper.recentChatting");
	}


	@Override
	public List<Chatting> getListChatting() throws Exception {
	
		return sqlSession.selectList("ChattingMapper.getChatting");
	}
	


}
