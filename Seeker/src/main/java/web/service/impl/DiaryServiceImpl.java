package web.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.DiaryDao;
import web.dto.Diary;
import web.service.face.DiaryService;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired DiaryDao diaryDao;

	@Override
	public List<Diary> list(String week) {
		
		String[] days = week.split(",");
		
		List<Diary> diary = new ArrayList<Diary>();
		
		for(int i =0; i < 7; ++i) {
			
			String date= days[i];
			
			diary.add(diaryDao.select(date));
			
		}
		
		return diary;
		
	}
	
	@Override
	public Diary diary(String date) {
		
		return diaryDao.select(date);
		
	}

	@Override
	public void write(Diary diary) {
		
		if(diary.getDiaryDirt() == null) {
			
			diary.setDiaryDirt("");
			
		}
		
		if(diary.getDiaryWater() != null) {
			
			diary.setDiaryWater("1");
			
		} else {
			
			diary.setDiaryWater("0");
			
		}
		
		if(diary.getDiaryRepot() != null) {
			
			diary.setDiaryRepot("1");
			
		} else {
			
			diary.setDiaryRepot("0");
			
		}
		
		diaryDao.insert(diary);
		
	}
	
	@Override
	public void alter(Diary diary) {
		
		if(diary.getDiaryDirt() == null) {
			
			diary.setDiaryDirt("");
		}
		
		
		if(diary.getDiaryWater() != null) {
			
			diary.setDiaryWater("1");
			
		} else {
			
			diary.setDiaryWater("0");
			
		}
		
		if(diary.getDiaryRepot() != null) {
			
			diary.setDiaryRepot("1");
			
		} else {
			
			diary.setDiaryRepot("0");
			
		}
		
		diaryDao.update(diary);
		
	}

	@Override
	public void drop(String date) {
		
		diaryDao.delete(date);
		
	}

}
