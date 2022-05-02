package web.ws;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

//@EnableWebSocket // 웹소켓 활성화
@Configuration // 빈 설정 클래스가 되도록 만드는 어노테이션
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer{

//	@Autowired ChatHandler chatHandler;
	private final Logger logger = LoggerFactory.getLogger(StompWebSocketConfig.class);
	
//	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//		//ws 접속의 endpoint(서버 내의 자원에 접근할 수 있는 url)가 chat이라는 의미이다.
//		//오리진이란 스키마(프로토콜), 호스트(도메인), 포트를 뜻한다. 이 3가지가 같으면 출처가 같다.
//		//교차출처COR 를 막아놓으므로 필요한 CROS - * 이므로 어떤 오리진이든 허용한다. 
//		System.out.println("registerWebSocketHandlers");
//		registry.addHandler(chatHandler, "/ws/chat")
//		.setAllowedOrigins("*")
//		.withSockJS();
////		.setClientLibraryUrl("https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js");
//	}
	
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/chat")
//				.setAllowedOriginPatterns("*")
				.withSockJS();		
	}
	
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/sub"); // simplebroker 시작용 prefux
		registry.setApplicationDestinationPrefixes("/pub"); // destination 설정용 prefux
	}
	
} //config end
