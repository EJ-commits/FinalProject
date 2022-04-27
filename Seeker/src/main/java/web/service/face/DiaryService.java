package web.service.face;

import java.util.List;

import web.dto.Diary;

public interface DiaryService {
	
	public List<Diary> list(String week);
	
	public Diary diary(String date);
	
	public void write(Diary diary);
	
	public void alter(Diary diary);
	
	public void drop(String date);
}
