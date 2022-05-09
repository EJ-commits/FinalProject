package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatTestcontroller {

	
	@RequestMapping(value = "/chat/enter")
	public void test(HttpSession session) {

		
		//로그인 한 사람의 정보 가져오기 
//		String userid = (String) session.getAttribute("id");
//		User user = chatservice.getUserInfo(userid);

		//모델값으로 전달
//		session.setAttribute("testuser","testuser");
		
		
	}
	
}
