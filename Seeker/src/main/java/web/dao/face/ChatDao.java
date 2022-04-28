package web.dao.face;

import web.dto.ChatDto;

public interface ChatDao {

	public void saveMsg(ChatDto chatDto);

	public void getChatLog(String userid); 

}
