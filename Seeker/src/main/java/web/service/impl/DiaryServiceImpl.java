package web.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.DiaryDao;
import web.dto.Diary;
import web.service.face.DiaryService;
import web.util.StoreImg;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired DiaryDao diaryDao;
	@Autowired ServletContext context;

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
	public void write(Diary diary, MultipartFile file) {
		
		if(diary.getDirt() == null) {
			diary.setDirt("");
		}
		
		if(diary.getWater() != null) {
			diary.setWater("1");
		} else {
			diary.setWater("0");
		}
		
		if(diary.getRepot() != null) {
			diary.setRepot("1");
		} else {
			diary.setRepot("0");
			
		}
		
		if(file.getSize() > 0) {
			StoreImg fileUpload = new StoreImg();
			String stored = fileUpload.on(file, context);
		
			diary.setOrigin(file.getOriginalFilename());
			diary.setStored(stored);
		}
		
		diaryDao.insert(diary);
		
	}
	
	@Override
	public void alter(Diary diary, MultipartFile file) {
		
		if(diary.getDirt() == null) {
			diary.setDirt("");
		}
		
		if(diary.getWater() != null) {
			diary.setWater("1");
		} else {
			diary.setWater("0");
		}
		
		if(diary.getRepot() != null) {
			diary.setRepot("1");
		} else {
			diary.setRepot("0");
		}
		
		if(file.getSize() > 0) {
			StoreImg fileUpload = new StoreImg();
			String stored = fileUpload.on(file, context);
		
			diary.setOrigin(file.getOriginalFilename());
			diary.setStored(stored);
		}
		
		diaryDao.update(diary);
		
	}

	@Override
	public void drop(String date) {
		
		diaryDao.delete(date);
		
	}

}
