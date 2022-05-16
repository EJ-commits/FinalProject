package web.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import web.dao.face.ReserveDao;
import web.dto.GardenPriceDto;
import web.dto.ReserveInfo;
import web.service.face.ReserveService;
import web.util.QrUtil;

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

	@Override
	public ReserveInfo getResInfo(int resNo) {
		return reserveDao.getResInfo(resNo);
	}

	
	@Autowired ServletContext context;
	@Autowired QrUtil qrUtil;
	
	@Override
	public void getQrCode(ReserveInfo info) {
		
		Gson gson = new Gson();
		String context = gson.toJson(info);
		
		String storedPath = context.getRealPath("qrImg");
		File folder = new File(storedPath);
		if(!folder.exists()) 
			folder.mkdir();
		
		String qrImgName = info.getMemberNo() + info.getReserveNo() + "";
		
		File dest = new File(folder, qrImgName);
		
		BufferedImage qrCode = qrUtil.makeQR(context);
		
		
	}



}
