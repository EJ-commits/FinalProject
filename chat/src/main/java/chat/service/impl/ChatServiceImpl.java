package chat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import chat.dao.face.ChatDao;
import chat.dto.ChatDto;
import chat.service.face.ChatService;


public class ChatServiceImpl implements ChatService{

	private ChatDao chatDao;
	private ChatDto chatDto;
	
	@Override
	public void saveMsg(String userid, String chatLog) {
		chatDto.setId(userid);
		chatDto.setMsg(chatLog);
		chatDao.saveMsg(chatDto);
		
	}


}
