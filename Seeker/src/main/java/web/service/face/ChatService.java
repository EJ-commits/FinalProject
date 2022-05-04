package web.service.face;

import java.util.List;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;

>>>>>>> chat
import web.dto.ChatDto;
import web.dto.ChatRoomDto;

public interface ChatService {

	/**
<<<<<<< HEAD
	 * 채팅 로그를 txt 파일로 만들어서 불러온다. 
	 * @param 유저 아이디
	 * @return 생성된 파일의 전체 경로 
=======
	 * 채팅 내역 저장하기
	 * @param 채팅 내역 DTO
>>>>>>> chat
	 * */
	public void saveMsg(ChatDto chatDto);
	
<<<<<<< HEAD
	public String getLog(String userid);
	
	/**
=======
	
	/**
	 * 채팅 로그를 txt 파일로 만들어서 불러온다. 
	 * @param 유저 아이디
	 * @return 생성된 파일의 전체 경로 
	 * */
	public String getLog(String userid);
	
	
	/**
>>>>>>> chat
	 * 채팅방을 만든다. 
	 * @param 채팅방 이름
	 * @return 채팅방 DTO
	 * */
	public ChatRoomDto createRoom(String name);

<<<<<<< HEAD
=======
	
>>>>>>> chat
	/**
	 * 채팅방 목록 표시
	 * @return 채팅방 목록
	 * */
	public List<ChatRoomDto> findAllRooms();

<<<<<<< HEAD
=======
	
>>>>>>> chat
	/**
	 * 채팅방 정보 불러오기
	 * @param 채팅방 PK ID
	 * @return ID값에 해당하는 채팅방 정보 DTO
	 * */
	public ChatRoomDto findRoomById(String roomId);

	/**
<<<<<<< HEAD
	 * 채팅 내역 저장하기
	 * @param 채팅 내역 DTO
	 * */
	public void saveMsg(ChatDto chatDto);
	
=======
	 * 채팅방 참여자의 세션을 추가 
	 * @param userid , 채팅방 DTO
	 * */
	public void addSession(ChatRoomDto room, String userid);

	/**
	 * 채팅방 탈퇴자의 세션 제거  
	 * @param session , 채팅방 DTO
	 * */
	public void deleteSession(ChatRoomDto room, String userid);

	/**
	 * 채팅방 삭제   
	 * @param session , 채팅방 DTO
	 * */
	public void deleteRoom(ChatRoomDto room);
>>>>>>> chat

	
}
