package web.controller;

import java.lang.annotation.Retention;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

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
		logger.info("[post] /garden/reserveCalc");

		
		logger.info("reserve {}", reserve.toString());
		String garden = reserve.getgardenName();
		GardenPriceDto gardenPrice = resService.getGardenPrice(garden);
		
		logger.info("gardenPrice {}", gardenPrice.toString());
		
		double totalPrice= reserve.getAdult()*gardenPrice.getAdult() +
						reserve.getChild()*gardenPrice.getchildren()+
						reserve.getOthers()*gardenPrice.getRest();
		
		if(reserve.getTime().equals("morning")){
			totalPrice = totalPrice * 0.8;
		}else if(reserve.getTime().equals("night")){
			totalPrice = totalPrice * 1.2;
		}
		logger.info("totalPrice {}", totalPrice);
	
		model.addAttribute("totalPrice",totalPrice);
		return "jsonView";
	}	
	
	
	
	//예약 정보 DB에 저장
	@RequestMapping(value = "/garden/saveReserve")
	public String saveReserve(RequestReserve reserve, Model model) {
		logger.info("[get] /garden/saveReserve");
		
		String garden = reserve.getgardenName();
		GardenPriceDto gardenPrice = resService.getGardenPrice(garden);
		
		double totalPrice= reserve.getAdult()*gardenPrice.getAdult() +
				reserve.getChild()*gardenPrice.getchildren()+
				reserve.getOthers()*gardenPrice.getRest();

		if(reserve.getTime().equals("morning")){
			totalPrice = totalPrice * 0.8;
		}else if(reserve.getTime().equals("night")){
			totalPrice = totalPrice * 1.2;
		}
		
		//프론트로부터 받은 예약 정보 ReserveInfo에 저장
		ReserveInfo info = new ReserveInfo();
		info.setGardenNo(gardenPrice.getGardenNo());
		info.setGardenName(reserve.getgardenName());
		
		info.setMemberNo(Integer.parseInt((String) session.getAttribute("memberNo")));
		info.setGardenName(reserve.getgardenName());
		
		info.setMemberNo(Integer.parseInt( (String) session.getAttribute("memberNo")));
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
			Date resdate = sdf.parse(reserve.getDatepicker());
			info.setVisitDate(sdf.format(resdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
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
		
		logger.info("totalInfo {}", info);
		
		// DB에 내역 저장
		resService.saveResInfo(info); 
		
		resService.getQrCode(info);
		
		return "redirect:/garden/reserveRes";
	}	
	
	
	@GetMapping(value = "/garden/reserveRes")
	public void resultReserve(Model model) {
		logger.info("[get] /garden/reserveRes");
		//예약정보 불러오기 
		int memberNo = Integer.parseInt((String)session.getAttribute("memberNo"));
		int resNo = resService.getReserveNo(memberNo);

		ReserveInfo resInfo = resService.getResInfo(resNo);
		model.addAttribute("resInfo", resInfo);
		model.addAttribute("name", "abc");
	
		logger.info("memberNo {} ",memberNo);
		logger.info("resNo {} ",resNo);
		logger.info("resinfo {} ",resInfo);
		
		
	}
	

	
	
}//class end	