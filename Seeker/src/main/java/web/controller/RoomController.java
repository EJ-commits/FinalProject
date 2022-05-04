package web.controller;

import java.util.List;
<<<<<<< HEAD

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
=======
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

>>>>>>> chat
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
<<<<<<< HEAD
import org.springframework.web.servlet.ModelAndView;

=======
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.ChatDto;
>>>>>>> chat
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
<<<<<<< HEAD
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

=======
	public String create(String roomName, HttpSession session) {
		
		logger.info(roomName);
		ChatRoomDto chatroom = chatService.createRoom(roomName);
		String userid = (String) session.getAttribute("testuser");
		String roomId = chatroom.getRoomId(); // 생성한 채팅방의 주소
		return "redirect: /chat/room?roomId="+roomId; // 생성된 방으로 리턴
			
	}
	
	@GetMapping("/chat/room")
	public String getRoom(String roomId, Model model, HttpSession session) {
		ChatRoomDto room = chatService.findRoomById(roomId);
		String userid = (String) session.getAttribute("testuser");
		model.addAttribute("room",room);
		
		//세션 목록에 접속중인 유저명 추가 
		chatService.addSession(room, userid);
		return "chat/room";
	}
	
	@ResponseBody
	@GetMapping("/chat/exit")
	public void getRoom(String roomId, HttpSession session) {
		ChatRoomDto room = chatService.findRoomById(roomId);
		String userid = (String) session.getAttribute("testuser");
		chatService.deleteSession(room, userid);
		
		ChatDto chatDto = new ChatDto();
		//채팅방 접속자 0명일시 채팅방 삭제 
		if (room.nameList.size() == 0)
			chatDto.setRoomId(roomId);
			chatDto.setIsEnd(1);
			chatDto.setChatLog("퇴장");
			chatService.saveMsg(chatDto); // 퇴장 문구 db 삽입
			
			chatService.deleteRoom(room); //채팅방 삭제
	}
	
	//접속자 리스트 가져오기 
	@ResponseBody // 요청 - 객체 변환
	@RequestMapping("/chat/participant")	
	public Set<String> nameList(String roomId){
		System.out.println("roomId"+roomId);
		ChatRoomDto room = chatService.findRoomById(roomId);
		Set<String> list = room.nameList;
		System.out.println("list"+list);
		return list;
	}
	
	
//	다운로드는 chat.jsp 내에서 비동기적으로 처리되므로
//  따로 뷰를 지정한다.
// 	jsp 대신 파일 객체를 반환하므로, resolver 설정 + view 생성 클래스 필요
	@RequestMapping("/chat/logdown")
	public String chatLogDown(String userid,  HttpServletRequest request, Model model) {
		logger.info("logdown");
		String filepath = chatService.getLog(userid); // ajax json값이 넘어옴 
		request.setAttribute("userid", userid);
		request.setAttribute("filepath",filepath);
		return "down";
	}
	
>>>>>>> chat
}