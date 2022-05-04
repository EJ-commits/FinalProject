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
<<<<<<< HEAD
=======
import web.ws.ChatHandler;
>>>>>>> chat

@Controller
public class WebsocketChat {
	
	private static final Logger logger = LoggerFactory.getLogger(WebsocketChat.class);	
	
/*	
	public void WebsocketChat() { //생성자
		System.out.println("서버 웹소켓 객체 생성");
	}
	
	//메시지 전달 
	private void sendMessage(Session self, String sender, String message) {
		for(Session session : WebsocketChat.sessionList) {
			//메세지 보낸 사람과 현재 로그인한 사람이 같은지 확인
			if(self.getId().equals(session.getId())){
				try {
					System.out.println("sendMessage"+sender+message);
					session.getBasicRemote().sendText(sender+":"+message);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		final Basic basic = session.getBasicRemote(); //세션의 엔드포인트
		try {
			basic.sendText("연결");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@OnMessage
	public void onMessage(String messages, Session session) {
		System.out.println(messages);
		String sender = messages.split(",")[1];
		messages = messages.split(",")[0];
		
		final Basic basic = session.getBasicRemote(); //세션의 엔드포인트
		try {
			basic.sendText("[나]"+messages);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMessage(session, sender, messages);
	}
	
	@OnClose
	public void onClose(Session session) {
		sessionList.remove(session);
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		sessionList.remove(session);
}

*/
	 ///	---------- 상단 사용 안함 ------------
	
<<<<<<< HEAD
//	@Autowired ChatHandler chatHandler;
=======
	@Autowired ChatHandler chatHandler;
>>>>>>> chat
	@Autowired ChatService chatService;
	
	@RequestMapping("/chat/chat")
	public void getChat(HttpSession session, Model model) {
		logger.info("/chat/chat[get]");
			
		//로그인 한 사람의 정보 가져오기 
		System.out.println("session[get]"+session.getAttribute("testuser"));
		
	}
	

	//접속자 리스트 가져오기 
/*	@RequestMapping("/chat/participant")	
	public @ResponseBody Map<String, Object> participant(HttpServletResponse res) {
//	public @ResponseBody List<String> participant(HttpServletResponse res) {
	
	//웹소켓 세션 리스트 불러오기 
	List<WebSocketSession> partList = chatHandler.getPartList();
//	logger.info("partList {} "+ partList);
	//불러온 정보 저장용 맵
	Map<String, Object> map = new HashMap<>();
//	List<String> participant = new ArrayList<String>();
	for(WebSocketSession scksession : partList) {
		HttpSession session2 = (HttpSession) scksession.getAttributes().get("HttpSession");
		logger.info("session2 {} "+ session2);
		String participant = (String) session2.getAttribute("testuser");
		map.put("participant", participant);
//		participant.add((String) session2.getAttribute("testuser"));
	}
	
	logger.info("map "+ map);
//	logger.info("participant {} "+ participant.toArray());
	
	return map;
//	return participant;
	
	}
<<<<<<< HEAD
*/	
=======
	
>>>>>>> chat
	
//	다운로드는 chat.jsp 내에서 비동기적으로 처리되므로
//  따로 뷰를 지정한다.
// 	jsp 대신 파일 객체를 반환하므로, resolver 설정 + view 생성 클래스 필요
	@RequestMapping("/chat/logdown")
	public String chatLogDown(String userid,  HttpServletRequest request, Model model) {
		String filepath = chatService.getLog(userid); // ajax json값이 넘어옴 
		request.setAttribute("userid", userid);
		request.setAttribute("filepath",filepath);
		return "down";
	}
	
	
}