package web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.GardenPriceDto;
import web.dto.RequestReserve;
import web.dto.ReserveInfo;
import web.service.face.ReserveService;


@Controller
public class ReserveController {

	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	@Autowired ReserveService resService;
	@Autowired HttpSession session;
	
	@RequestMapping(value = "/garden/reservation")
	public String reserve() {
		return "/garden/gardenResv";
	}
	
	@RequestMapping(value = "/garden/getGardenList")
	public String getGardenList( Model model) {
		
		List<String> gardenList = resService.getGardenList();
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("gardenList", gardenList);
//		Gson gson = new Gson();
//		
//		return gson.toJson(map);
		
		model.addAttribute("gardenList", gardenList);
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/garden/reserveCalc")
	public String reserveCalc(RequestReserve reserve, Model model) {
		
		logger.info("reserve {}", reserve.toString());
		
		String garden = reserve.getgardenName();
		GardenPriceDto gardenPrice = resService.getGardenPrice(garden);
		logger.info("gardenPrice {}", gardenPrice.toString());
		
		double totalPrice= reserve.getAdult()*gardenPrice.getAdult() +
						reserve.getChild()*gardenPrice.getchildren()+
						reserve.getOthers()*gardenPrice.getRest();
		
		//프론트로부터 받은 예약 정보 ReserveInfo에 저장

		ReserveInfo info = new ReserveInfo();
<<<<<<< HEAD
		info.setGardenNo(gardenPrice.getGardenNo());
		info.setGardenName(reserve.getgardenName());
		
		info.setMemberNo(Integer.parseInt((String) session.getAttribute("memberNo")));
=======
		info.setGardenName(reserve.getBtnradio());
		
		logger.info("memberNo {}", session.getAttribute("memberNo"));
		
		info.setUserNo(Integer.parseInt( (String) session.getAttribute("memberNo")));
>>>>>>> main
		
		logger.info("date {}", reserve.getDatepicker());
		
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
				Date resdate = sdf.parse(reserve.getDatepicker());
				info.setVisitDate(sdf.format(resdate));
				logger.info("resdate {}", resdate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		logger.info("info middlecheck{}", info.toString());
		
		info.setVisitTime(reserve.getTime());
		if(reserve.getTime() == "moring"){
			totalPrice = totalPrice * 0.8;
		}else if(reserve.getTime() == "night"){
			totalPrice = totalPrice * 1.2;
		}
	
		info.setAdultMem(reserve.getAdult());
		info.setChildMem(reserve.getChild());
		info.setDisabMem(reserve.getOthers());
		info.setTotalPrice(totalPrice);
		
		logger.info("info reserve {}", info.toString());
		
		resService.saveResInfo(info); // DB에 내역 저장
		
		//예약번호 추가
		int resNo = resService.getReserveNo(
				Integer.parseInt((String) 
						session.getAttribute("memberNo")));
		info.setReserveNo(resNo);
		
		model.addAttribute("Info", info);
		
		return "jsonView";
	}	
	
	@RequestMapping(value = "/garden/reserveRes")
	public void resultReserve() {
		
	}
	
	
}//class end	