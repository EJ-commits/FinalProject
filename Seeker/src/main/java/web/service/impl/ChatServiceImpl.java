package web.service.impl;

import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ChatDao;
import web.dto.ChatDto;
import web.service.face.ChatService;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired private ChatDao chatDao;
	private ChatDto chatDto = new ChatDto();
	
	@Autowired ServletContext context; // 파일저장용
	
	
	@Override
	public void saveMsg(int start, int end, String userid, String chatLog) {
	
	chatDto.setIsStart(start);
	chatDto.setIsEnd(end);	
	chatDto.setUserid(userid);
	chatDto.setChatLog(chatLog);
	System.out.println(chatDto.toString());
	chatDao.saveMsg(chatDto);
		
	}

	@Override
	public File getLog(String userid) {

		String today = new SimpleDateFormat("yyyyMMdd_ss").format(new Date());
		String fileName = userid + "_CHATLOG_"+ today + ".txt";

		File log = new File(fileName); //파일 생성 
		

				
				
				
				
				
				//서버내 저장경로설정 
		String storedPath = context.getRealPath("upload"); // 서블릿컨텍스트의 실제경로
		File storedFolder = new File(storedPath); 
			if(!storedFolder.exists()) storedFolder.mkdir();
		
		
		
		return null;
	}




}
