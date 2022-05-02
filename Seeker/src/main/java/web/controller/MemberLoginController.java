package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	@Autowired 
	MemberService memberService;
	
	@GetMapping(value="/login")
	public void login() {}
	
	@PostMapping("/member/login")
	public String loginProcess(Member member, HttpSession session) {
		
		//로그인 인증
		boolean loginResult = memberService.login(member);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("memberNo", member.getUserNo());
			session.setAttribute("id", member.getUserId());
			
			return "redirect:/main";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:/login";
		}
		
	}
	
}
