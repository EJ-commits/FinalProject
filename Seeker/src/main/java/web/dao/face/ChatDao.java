package web.dao.face;

import java.util.List;

import web.dto.ChatDto;
import web.dto.ChatRoomDto;

public interface ChatDao {

	public void saveMsg(ChatDto chatDto);

	public void setChatRoom(ChatRoomDto chatRoom);

	public List<ChatRoomDto> getChatRooms();

	public ChatRoomDto getRoomToGo(String roomId);

	public void deleteRoom(ChatRoomDto room);

	public List<ChatDto> getChatLog(ChatDto chatDto); 

}
