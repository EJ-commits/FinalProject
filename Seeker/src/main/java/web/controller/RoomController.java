package web.controller;

import java.util.List;

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import web.dto.ChatRoomDto;
import web.service.face.ChatService;

@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired ChatService chatService;
	
	@GetMapping(value = "/chat/rooms")
	public void rooms(Model model) {
		List<ChatRoomDto> list = chatService.findAllRooms();
		model.addAttribute("list", list);
	}
	
	@PostMapping(value = "/chat/room")
	public String create(String roomName) {
		logger.info(roomName);
		chatService.createRoom(roomName);
	
		return "redirect: /chat/rooms";
		
	}
	
	@GetMapping("/chat/room")
	public String getRoom(String roomId, Model model) {
		ChatRoomDto room = chatService.findRoomById(roomId);
		model.addAttribute("room",room);
//		logger.info("getRoom() {}" , room.toString());
		return "chat/room";
	}

}