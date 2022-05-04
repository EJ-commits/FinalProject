package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import web.dto.ChatDto;
import web.dto.ChatRoomDto;
import web.service.face.ChatService;

@Controller
public class StompChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(StompChatController.class);
	@Autowired SimpMessagingTemplate template;
	@Autowired ChatService chatService;
	// StompWebSocketConfig 에서 설정한 prifix가 경로에 병합됨.
	
	@MessageMapping(value = "/chat/enter")
	public void enter(ChatDto chatDto) {
		chatDto.setIsStart(1); //채팅시작
		chatService.saveMsg(chatDto);
		logger.info("chatDto {}",chatDto.toString());
		template.convertAndSend("/sub/chat/room" + chatDto.getRoomId(), chatDto);
	}
	
	@MessageMapping(value = "/chat/message")
	public void message(ChatDto chatDto) {
		template.convertAndSend("/sub/chat/room" + chatDto.getRoomId(), chatDto);
		chatService.saveMsg(chatDto);
		logger.info("chatLog {}",chatDto.toString());
	}
	
	@MessageMapping(value = "/chat/exit")
	public void exit(ChatDto chatDto) {
		template.convertAndSend("/sub/chat/room" + chatDto.getRoomId(), chatDto);
		chatDto.setIsEnd(1); // 채팅종료
		chatService.saveMsg(chatDto);
		logger.info("chatLog {}",chatDto.toString());
		
		//남은 인원이 0명이면 채팅방을 삭제하는 기능 (미구현)
	}
}
