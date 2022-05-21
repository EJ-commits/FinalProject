package web.service.face;

import java.util.List;

import web.dto.Member;
import web.dto.Message;

public interface MessageService {

	/**
	 * 받는사람이 receiver_name인 메시지 보관함 리스트
	 * 
	 * @param receiver_name - 받는 사람
	 * @return 메시지 보관함에 있는 메시지 List
	 */
	public List<Message> findList(String receiver_name);
	
	/**
	 * 쪽지 보내기
	 * 
	 * @param message - 보낸 쪽지 DTO
	 * @return 보낸 결과 1 : 성공, 0: 실패
	 */
	public int insertMessage(Message message);
	
	/**
	 * 유저 목록 불러오기
	 * 
	 * @return - 유저목록 List
	 */
	public List<Member> searchMember();
	
	/**
	 * 메시지 읽은 상태 Update
	 * 
	 * @param message update할 메시지 DTO
	 */
	public void updateRead(Message message);
}
