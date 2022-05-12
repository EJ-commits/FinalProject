package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ReserveDao;
import web.dto.GardenPriceDto;
import web.dto.ReserveInfo;
import web.service.face.ReserveService;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired ReserveDao reserveDao;
	
	@Override
	public List<String> getGardenList() {
		
		List<String> gerdenList = reserveDao.getGardenNameList();
		
		return gerdenList;
	}

	@Override
	public GardenPriceDto getGardenPrice(String garden) {
		
		GardenPriceDto gardenPrice = reserveDao.getGardenPrice(garden);		
		
		return gardenPrice;
	}

	@Override
	public void saveResInfo(ReserveInfo info) {
		reserveDao.saveResInfo(info);
	}

	@Override
	public int getReserveNo(int memberNo) {
		return reserveDao.getReserveNo(memberNo);
	}



}
