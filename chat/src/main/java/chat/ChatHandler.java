package chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import chat.service.face.ChatService;
import chat.service.impl.ChatServiceImpl;

//자바가 기본 제공하는 웹소켓 핸들러 2종을 쓸 수도 있지만, 상속받아서 커스텀. 
//아래 메서드의 변수 타입들은 웹소켓 의존을 통해 사용가능해졌음. 
//핸들러를 상속받아 구현하는 핸들러이며, 엔드포인트이기도 하다. 
@Component // 빈 선언 클래스. controller, service, repository 를 포함한다. 
public class ChatHandler extends TextWebSocketHandler{
	
	//이하의 메서드들은 수행 조건 또는 순서가 존재한다. (웹서버 접속과정을 다루는 핸들러니까)
	//(Established > handleMessage > Closed | Error)
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	private ChatService chatService = new ChatServiceImpl();
	
	//다수 클라이언트가 접속하므로 각 세션 내역은 list에 저장
	private static List<WebSocketSession> list = new ArrayList<>();
	
	//핸들러 클래스의 메서드. AbstractWebSocketHandler로부터 상속
	//TextMessage는 웹소켓 연결 상에서 다뤄지는 텍스트
	//웹소켓에 들어온 텍스트 메시지가 이 함수를 부르고, 파라미터화 된다. 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage messages) throws Exception {
		
		//전송되는 데이터. (ajax로 치면 data:{}부)
		String payload = messages.getPayload();
		logger.info("payload {}" ,payload);
	
		if(payload.contains(":")) {
		String[] msgForSave = payload.split(":");
		logger.info("msgForSave {}" ,msgForSave);
		chatService.saveMsg(msgForSave[0],msgForSave[1]);
		}
		//WebSocketSession은 웹소켓에 메시지를 보내는 클래스.
		//받은 웹소켓 세션에 있는 메시지를 모두 보낸다. 
		for(WebSocketSession scksession : list) {
			scksession.sendMessage(messages);
		}
		
	}
	
	//웹소켓과 클라이언트가 연결되고 바로 호출되는 메서드. 
	//클라이언트가 최초 서버 접속할 때에 수행되어야 할 동작들을 넣는다. 
	public void afterConnectionEstablished(WebSocketSession session)  { 

		//기존의 요청을 처리한 후, 새로운 세션을 받았을 때 그것을 기존의 내역에 더한다.
		list.add(session);
		
	//	map = session.getAttributes();
		logger.info("클라이언트 접속 {}",session.toString());
		System.out.println(session.getAttributes().toString());
	}
	
	public void afterConnectionClosed(WebSocketSession session) { //클라이언트의 요청 해제시 작동
		
		list.remove(session);
	}
	
	public void handleTransportError(WebSocketSession session) {
		
	}
	
}//class end 
