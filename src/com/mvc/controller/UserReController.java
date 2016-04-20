package com.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.entity.User;
import com.mvc.service.UserService;

@Controller
@RequestMapping("/userRequest.do")
public class UserReController {
	protected final transient Log log = LogFactory
	.getLog(UserReController.class);
	@Autowired
	private UserService userService;
	public UserReController(){
		
	}
	
	@RequestMapping(params = "method=saveUser")
	public void regInfoSave(User userVo, HttpServletRequest request, HttpServletResponse response){
//		System.out.println("---------------777777777777----------------");
//		System.out.println(userVo.getUserName());
//		System.out.println(userVo.getPassword());
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		userVo.setUserName(userName);
		userVo.setPassword(password);
		try{
			userService.save(userVo);
			response.getWriter().print("{\"addstate\":\"true\"}");
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=logCheck")
	public void logCheck(User userVo, HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		userVo.setUserName(userName);
		userVo.setPassword(password);
		try{
			User userInfo = (User) userService.getUser(userVo);
			
			if(userInfo!=null && userInfo.getUserId()!=null && userInfo.getUserId()>0){
				session.setAttribute("userName", userName);
				response.getWriter().print("{\"selectstate\":\"true\"}");
			}
			else{
				response.getWriter().print("{\"selectstate\":\"false\"}");
			}
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}

}

