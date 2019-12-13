package com.model2.mvc.service.chatting;




import java.util.List;

import com.model2.mvc.service.domain.Chatting;


public interface ChattingDao {
	
	public int addChatting(Chatting chat ) throws Exception;

	public Chatting getChatting() throws Exception;

	public List<Chatting> getListChatting() throws Exception;
}
