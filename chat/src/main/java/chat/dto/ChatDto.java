package chat.dto;

public class ChatDto {

	private int chatNo;
	private String userid;
	private String chatLog;
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getId() {
		return userid;
	}
	@Override
	public String toString() {
		return "ChatDto [chatNo=" + chatNo + ", userid=" + userid + ", chatLog=" + chatLog + "]";
	}
	public void setId(String userid) {
		this.userid = userid;
	}
	public String getMsg() {
		return chatLog;
	}
	public void setMsg(String chatLog) {
		this.chatLog = chatLog;
	}
	
}
