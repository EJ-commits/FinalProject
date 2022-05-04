package web.dto;

import java.io.Serializable;
<<<<<<< HEAD
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;
=======
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import javax.servlet.http.HttpSession;

>>>>>>> chat

public class ChatRoomDto implements Serializable{

	private String roomId;
	private String roomName;
<<<<<<< HEAD
	//private Set<WebSocketSession> sessions = new HashSet<>(); // 참여한 사람들의 세션 목록
	
=======
	public static Set<String> nameList = new HashSet<String>() ; // 참여한 사람들의 세션 목록

>>>>>>> chat
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId() {
		this.roomId = UUID.randomUUID().toString().split("-")[4]; // 중복방지 랜덤번호 부여
	}
	public String getroomName() {
		return roomName;
	}
	public void setroomName(String roomName) {
		this.roomName = roomName;
	}
<<<<<<< HEAD

	@Override
	public String toString() {
		return "ChatRoomDto [roomId=" + roomId + ", roomName=" + roomName + "]";
	}
	
=======
	
	

	
	@Override
	public String toString() {
		return "ChatRoomDto [roomId=" + roomId + ", roomName=" + roomName + ", nameList=" + nameList + "]";
	}
>>>>>>> chat
	//생성자
	public ChatRoomDto() {}
	
	public ChatRoomDto(String roomName) {
		setRoomId();
		setroomName(roomName);
	}
}
