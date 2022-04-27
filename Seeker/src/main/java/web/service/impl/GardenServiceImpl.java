package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.GardenDao;
import web.dto.Garden;
import web.service.face.GardenService;

@Service
public class GardenServiceImpl implements GardenService{
	
	@Autowired
	private GardenDao gardenDao;
	
	@Override
	public int getGardenNo(Garden garden) {
		return gardenDao.selectByGardenName(garden);
	}
	
	@Override
	public int listCnt(int gardenNo) {
		return gardenDao.selectCntByGardenNo(gardenNo);
	}

//	@Override
//	public List<Garden> list(int gardenNo) {
//		return gardenDao.selectListAll(gardenNo);
//	}
	

	

	

}
