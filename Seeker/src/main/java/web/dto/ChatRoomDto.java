package web.dto;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoomDto implements Serializable{

	private String roomId;
	private String roomName;
	//private Set<WebSocketSession> sessions = new HashSet<>(); // 참여한 사람들의 세션 목록
	
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

	@Override
	public String toString() {
		return "ChatRoomDto [roomId=" + roomId + ", roomName=" + roomName + "]";
	}
	
	//생성자
	public ChatRoomDto() {}
	
	public ChatRoomDto(String roomName) {
		setRoomId();
		setroomName(roomName);
	}
}
