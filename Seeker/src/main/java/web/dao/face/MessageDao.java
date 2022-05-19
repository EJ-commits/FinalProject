package web.dao.face;

import java.util.List;

import web.dto.Member;
import web.dto.Message;

public interface MessageDao {

	/**
	 * 발송된 메세지 카운트
	 * 
	 * @param id - 쪽지 보내는 유저 id
	 * @return 
	 */
	public String countMessageView(String id);
	
	public List<Message> findList(String receiver_name);
	
	/**
	 * 메세지 보내기
	 * 
	 * @param message - 보낸 메세지 DTO
	 */
	public int insertMessage(Message message);
	
	/**
	 * 유저 목록 불러오기
	 * 
	 * @return - 유저목록 List
	 */
	public List<Member> searchMember();
}
