package web.ws;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import web.dao.face.MessageDao;

public class MessageHandler extends TextWebSocketHandler {
	
	@Autowired private MessageDao messageDao; 

	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//해당 IP포트로 클라이언트가 접속했을 때 실행되는 메소드
	public void afterConnnectionEstablished(WebSocketSession session) throws Exception {
		String user_name = searchUserName(session);
		
		sessionList.add(session);
		session.sendMessage(new TextMessage("recMs :" + messageDao.countMessageView(user_name)));
	}
	
	//클라이언트가 메세지를 보냈을 때, 나타나는 메소드
	public void handlerTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String user_name = searchUserName(session);
		
		for(WebSocketSession sess: sessionList) {
            sess.sendMessage(new TextMessage(user_name+": "+ message.getPayload()));
        }
	}
	
	//연결이 끊어지면 실행되는 메소드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String user_name = searchUserName(session);
		System.out.println("연결 끊어짐");
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user_name + "님의 연결이 끊어졌습니다."));
		}
		sessionList.remove(session);
	}
	
	//세션 객체에 저장해둔 유저의 id 사용
	public String searchUserName(WebSocketSession session)throws Exception {
        String user_name;
        Map<String, Object> map;
        map = session.getAttributes();
        user_name = (String) map.get("id");
        return user_name;
    }
	
}
