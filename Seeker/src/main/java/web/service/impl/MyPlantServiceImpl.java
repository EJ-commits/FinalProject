package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MyPlantDao;
import web.dto.MyPlant;
import web.service.face.MyPlantService;
import web.util.TransDate;

@Service
public class MyPlantServiceImpl implements MyPlantService {

	@Autowired MyPlantDao myPlantDao;
	
	@Override
	public List<MyPlant> list() {
		
		List<MyPlant> list = myPlantDao.selectList();
		
		TransDate transDate = new TransDate();
		for(int i = 0; i < list.size(); ++i) {
			list.get(i).setBirth(transDate.toString(list.get(i).getBirth()));
		}
		
		return list;
		
	}

	@Override
	public String nick(int myPlantNo) {
		
		return myPlantDao.selectNick(myPlantNo);
		
	}

	@Override
	public MyPlant profile(int myPlantNo) {
		
		return myPlantDao.select(myPlantNo);
		
	}

}
