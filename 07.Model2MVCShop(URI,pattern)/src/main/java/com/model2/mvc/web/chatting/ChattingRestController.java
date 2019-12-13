package com.model2.mvc.web.chatting;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.chatting.ChattingService;
import com.model2.mvc.service.domain.Chatting;



//==> 회원관리 Controller
@RestController
@RequestMapping("/chatting/*")
public class ChattingRestController {
	
	///Field
	@Autowired
	private ChattingService chattingService;
	//setter Method 구현 않음
		
	public ChattingRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping( value="json/addChatting", method=RequestMethod.POST)
	public void addChatting( @RequestBody Chatting chatting) throws Exception {
		
		System.out.println(chatting);
		System.out.println("/chatting/json/addChatting");
		chattingService.addChatting(chatting);
	}
	
	@RequestMapping( value="json/getChatting", method=RequestMethod.GET)
	public Chatting getChatting() throws Exception {
		
		System.out.println("/chatting/json/getChatting");
		
		return chattingService.getChatting();
	}
	
	@RequestMapping( value="json/getListChatting", method=RequestMethod.GET)
	public Map<String,Object> getListChatting() throws Exception {
		
		System.out.println("/chatting/json/getListChatting");
		
		Map<String,Object> map = new HashMap();
		map.put("list", chattingService.getListChatting());
		return map;
	}
}