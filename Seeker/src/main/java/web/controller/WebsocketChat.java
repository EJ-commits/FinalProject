package web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import web.service.face.ChatService;

@Controller
public class WebsocketChat {
	
	private static final Logger logger = LoggerFactory.getLogger(WebsocketChat.class);	

	@Autowired ChatService chatService;
	
	@RequestMapping("/chat/chat")
	public void getChat(HttpSession session, Model model) {
		logger.info("/chat/chat[get]");
	}
	


	
}