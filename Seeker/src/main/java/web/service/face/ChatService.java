package web.service.face;

import java.io.File;

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
	
	
}
