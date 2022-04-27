package web.dao.face;

import web.dto.Diary;

public interface DiaryDao {
	
	public Diary select(String date);
	
	public void insert(Diary diary);
	
	public void update(Diary diary);

	public void delete(String date);
}