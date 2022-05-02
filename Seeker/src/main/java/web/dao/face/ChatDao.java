package web.dao.face;

import java.util.List;

import web.dto.ChatDto;
import web.dto.ChatRoomDto;

public interface ChatDao {

	public void saveMsg(ChatDto chatDto);

	public List<ChatDto> getChatLog(String userid);

	public void setChatRoom(ChatRoomDto chatRoom);

	public List<ChatRoomDto> getChatRooms();

	public ChatRoomDto getRoomToGo(String roomId); 

}
