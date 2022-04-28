package web.dto;

public class ChatDto {

	private int isStart;
	private int isEnd;
	private String userid;
	private String chatLog;
	private String chatDate;
	public int getIsStart() {
		return isStart;
	}
	public void setIsStart(int isStart) {
		this.isStart = isStart;
	}
	public int getIsEnd() {
		return isEnd;
	}
	public void setIsEnd(int isEnd) {
		this.isEnd = isEnd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getChatLog() {
		return chatLog;
	}
	public void setChatLog(String chatLog) {
		this.chatLog = chatLog;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	@Override
	public String toString() {
		return "ChatDto [isStart=" + isStart + ", isEnd=" + isEnd + ", userid=" + userid + ", chatLog=" + chatLog
				+ ", chatDate=" + chatDate + "]";
	}

}
