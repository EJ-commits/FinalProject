package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Diary;

public interface DiaryService {
	
	public List<Diary> list(String week);
	
	public Diary diary(String date);
	
	public void write(Diary diary, MultipartFile file);
	
	public void alter(Diary diary, MultipartFile file);
	
	public void drop(String date);
}
