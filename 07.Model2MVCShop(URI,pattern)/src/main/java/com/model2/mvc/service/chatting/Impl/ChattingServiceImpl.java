package com.model2.mvc.service.chatting.Impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.chatting.ChattingDao;
import com.model2.mvc.service.chatting.ChattingService;
import com.model2.mvc.service.domain.Chatting;

@Service("chattingServiceImpl")
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDao chattingDao;
	
	public ChattingServiceImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setChattingDao(ChattingDao chattingDao) {
		System.out.println("::"+getClass()+".setChattingDao Call......");
		this.chattingDao=chattingDao;
	}
	@Override
	public int addChatting(Chatting chat) throws Exception {
	
		return chattingDao.addChatting(chat);
	}

	@Override
	public Chatting getChatting() throws Exception {
		
		return chattingDao.getChatting();
	}

	@Override
	public List<Chatting> getListChatting() throws Exception {
		
		return chattingDao.getListChatting();
	}
	



}
