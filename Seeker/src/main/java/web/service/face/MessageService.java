package web.service.face;

import java.util.List;

import web.dto.Member;
import web.dto.Message;

public interface MessageService {

	public List<Message> findList(String receiver_name);
	
	public int insertMessage(Message message);
	
	/**
	 * 유저 목록 불러오기
	 * 
	 * @return - 유저목록 List
	 */
	public List<Member> searchMember();
}
