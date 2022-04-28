package web.service.face;

import java.io.File;

public interface ChatService {
	
	/** 채팅 로그를 하나씩 저장한다. 
	 * @param 날짜, 아이디, 채팅내역
	 */
	public void saveMsg(int start, int end, String userid, String chatLog);

	/**
	 * 채팅 로그를 txt 파일로 만들어서 불러온다. 
	 * */
	
	public File getLog(String userid);
	
	
}
