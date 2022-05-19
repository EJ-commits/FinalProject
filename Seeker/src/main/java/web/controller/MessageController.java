package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Member;
import web.dto.Message;
import web.service.face.MessageService;

@Controller
public class MessageController {
	
	@Autowired private MessageService messageService;
	
	@ResponseBody
	@RequestMapping(value = "/message/list", method = RequestMethod.POST)
	public Map<String, Object> findMessageList(Message message, Model model) {
		List<Message> msg_result = messageService.findList(message.getReceiverName());
		Map<String, Object> result = new HashMap<>();
		result.put("result", msg_result);
		
		model.addAttribute("message", message);
		
		return result;
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/message/proc")
	public int addMessageSend(Message message, HttpSession session) {
//		switch(flag) {
//		case "insert" : 

		int result = 0;

//		System.out.println("하하하");

		message.setMemberNo((Integer) session.getAttribute("memberNo"));

		System.out.println(message);

		if (messageService.insertMessage(message) > 0) {

			result = 1;
		}
		return result;
//			break;
//		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/layout/header", method = RequestMethod.GET)
	public List<Member> searchMember() {
		
		List<Member> userList = messageService.searchMember();
		
		return userList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/layout/header2", method = RequestMethod.GET)
	public List<Member> searchMember2(Model model) {
		List<Member> userList = messageService.searchMember();

		return userList;
	}
}
