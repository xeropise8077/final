package com.model2.mvc.web.user;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}
	

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
		
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST)
	public void updateUser( @RequestBody User user) throws Exception{
		
		System.out.println("/user/json/updateUser : POST");
		
		System.out.println("[ user Ȯ�� ] \n"+user);
		userService.updateUser(user);
	}

	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST)
	public RedirectView addUser( @RequestBody User user, HttpServletResponse response){
			
		System.out.println("/user/json/addUser : POST");
		
		System.out.println("[ user Ȯ�� ] \n"+user);
		

		try {
			userService.addUser(user);
		} catch (DuplicateKeyException e) {
			System.out.println("���̵� �ߺ��Դϴ�");
		} finally {


			return new RedirectView("/user/login?userId="+user.getUserId()+"&password="+user.getPassword());

		}
	}
	
	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.POST)
	public void checkDuplication( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/checkDuplication : POST");
		
		System.out.println("[ userId �ߺ� Ȯ�� ] \n"+userId);
		if(userService.checkDuplication(userId)==true) {
			System.out.println("id�� �ߺ��ƴմϴ�.");
		}else {
			System.out.println("id�� �ߺ��Դϴ�.");
		}
	}
	
	@RequestMapping( value="json/getListUser", method=RequestMethod.POST)
	public Map getListUser( @RequestBody Search search) throws Exception{
		System.out.println("/user/json/getListUser ::POST");
		System.out.println(search);
		search.setPageSize(pageSize);
		
		Map map = userService.getUserList(search);
		
		return map;
	}
	
	@RequestMapping( value="json/getListUser", method=RequestMethod.GET)
	public Map getListGetUser() throws Exception{
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(3);
		System.out.println("���� search �� Ȯ�� : \n"+search);
		Map map = userService.getUserList(search);
		
		return map;
	}	
	
	@RequestMapping( value="json/test", method=RequestMethod.POST)
	public void test( @RequestBody() Search search) throws Exception{

			System.out.println(search);
		
		
		
	}
	
	@RequestMapping( value="json/getUserIdList/{userId}", method=RequestMethod.GET)
	public List<String> getUserIdList( @PathVariable String userId) throws Exception {
		
		List<String> list = userService.getUserIdList(userId);
		
		System.out.println(list);
		
		return list;
	}
	
}
