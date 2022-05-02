package web.service.face;

import java.util.List;

import web.dto.ChatDto;
import web.dto.ChatRoomDto;

public interface ChatService {
	
	/** 채팅 로그를 하나씩 저장한다. 
	 * @param 날짜, 아이디, 채팅내역
	 */
	public void saveMsg(int start, int end, String userid, String chatLog);

	/**
	 * 채팅 로그를 txt 파일로 만들어서 불러온다. 
	 * @param 유저 아이디
	 * @return 생성된 파일의 전체 경로 
	 * */
	
	public String getLog(String userid);
	
	/**
	 * 채팅방을 만든다. 
	 * @param 채팅방 이름
	 * @return 채팅방 DTO
	 * */
	public ChatRoomDto createRoom(String name);

	/**
	 * 채팅방 목록 표시
	 * @return 채팅방 목록
	 * */
	public List<ChatRoomDto> findAllRooms();

	/**
	 * 채팅방 정보 불러오기
	 * @param 채팅방 PK ID
	 * @return ID값에 해당하는 채팅방 정보 DTO
	 * */
	public ChatRoomDto findRoomById(String roomId);

	/**
	 * 채팅 내역 저장하기
	 * @param 채팅 내역 DTO
	 * */
	public void saveMsg(ChatDto chatDto);
	

	
}
