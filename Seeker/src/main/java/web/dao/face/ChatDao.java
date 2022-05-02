package web.dao.face;

import java.util.List;

import web.dto.ChatDto;

public interface ChatDao {

	public void saveMsg(ChatDto chatDto);

	public List<ChatDto> getChatLog(String userid); 

}
