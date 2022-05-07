package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberLoginController {

	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	@Autowired MemberService memberService;
	
//	@RequestMapping(value="/member/login", method = RequestMethod.GET)
	@GetMapping("/member/login")
	public void login() {
		logger.info("/member/login [GET]");
	}
	
//	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	@PostMapping("/member/login")
	public String loginProcess(Member member, HttpSession session) {
		logger.info("/member/login [POST]");
		logger.info("{}", member);
		
		//로그인 인증
		boolean loginResult = memberService.login(member);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("id", member.getId());
			
			session.setAttribute("memberNo", memberService.getMemberNo(member));
			session.setAttribute("memberRank", memberService.getMemberRank(member));
			session.setAttribute("name", memberService.getName(member));
			session.setAttribute("nick", memberService.getNick(member));
			session.setAttribute("email", memberService.getEmail(member));
			session.setAttribute("phone", memberService.getPhone(member));
			session.setAttribute("addr1", memberService.getAddr1(member));
			session.setAttribute("addr2", memberService.getAddr2(member));
			session.setAttribute("addr3", memberService.getAddr3(member));
//			session.setAttribute("mdate", memberService.getMdate(member));
			
			return "redirect:/main";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:/member/login";
		}
		
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@GetMapping("/member/join")
	public void join() {}
	
	@PostMapping("/member/join")
	public String joinProcess(Member member) {
		logger.info("/member/join [POST]");
		logger.info("{}", member);
		
		boolean joinResult = memberService.join(member);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/main";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join";
		}
	}
	
	@RequestMapping("/member/main")
	public void main() {}
	
}
