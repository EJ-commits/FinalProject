package chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import chat.ChatHandler;

@Controller
public class WebsocketChat {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);	
	private static final List<Session> sessionList = new ArrayList<>();
	
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
	
	@RequestMapping("/chat/chat")
	public void getChat(
			HttpSession session, 
			Model model
			) {
		logger.info("/chat/chat[get]");
		
			
		//로그인 한 사람의 정보 가져오기 

		System.out.println("session[get]"+session.getAttribute("testuser"));
		
		
		
	
	}
	
}
