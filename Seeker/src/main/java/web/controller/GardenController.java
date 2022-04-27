package web.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Garden;
import web.service.face.GardenService;


@Controller
public class GardenController {
	
	//로거
	private static final Logger logger = LoggerFactory.getLogger(GardenController.class);
	
	//수목원 서비스 객체
	@Autowired
	private GardenService gardenService;
	
	
	@RequestMapping(value="/garden/gardenMap", method=RequestMethod.GET)
	public void gardenMain(HttpSession session) {
		logger.info("/garden/gardenMap[GET]");
		session.setAttribute("id", "boss1");
	}
	
	
	@RequestMapping(value="/garden/list", method=RequestMethod.GET)
	public String list(Garden garden, Model model) {
		logger.info("/garden/list[GET]");
		logger.info("garden:{}",garden);
		
		//garden번호 가져오기
		garden.setGardenNo(gardenService.getGardenNo(garden));
		logger.info("garden:{}",garden);
		
		
		//garden번호에 해당하는 리뷰 리스트 가져오기
		if(gardenService.listCnt(garden.getGardenNo())>0) {
			logger.info("0이상이면 리뷰 불러온다");	
			
//			List<Garden> gardenInfo = gardenService.list(garden.getGardenNo());
			
			
			model.addAttribute("res", 1);
			
		}else {
			logger.info("0보다 작음");
			model.addAttribute("res", 0);
		}
		
		return "garden/gardenReview";
		
	}
	
	
}
