package web.controller;

import java.io.UnsupportedEncodingException;
import java.lang.annotation.Retention;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.zxing.WriterException;

import web.dto.GardenPriceDto;
import web.dto.RequestReserve;
import web.dto.ReserveInfo;
import web.service.face.ReserveService;
import web.util.QrUtil;



@Controller
public class ReserveController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	@Autowired ReserveService resService;
	@Autowired HttpSession session;
	@Autowired QrUtil qrUtil;
	@Autowired ServletContext context;
	
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
		double totalPrice = 0;
		
		if(!(garden.equals( "noneChecked"))) {
			GardenPriceDto gardenPrice = resService.getGardenPrice(garden);
			if( !((reserve.getAdult() == 0)&&(reserve.getChild() == 0)&&(reserve.getOthers() == 0)) ) {
				totalPrice= (reserve.getAdult()*gardenPrice.getAdult()) +
								reserve.getChild()*gardenPrice.getchildren()+
								reserve.getOthers()*gardenPrice.getRest();
				if(reserve.getTime().equals("morning")){
					totalPrice = totalPrice * 0.8;
				}else if(reserve.getTime().equals("night")){
					totalPrice = totalPrice * 1.2;
				}
				model.addAttribute("totalPrice",totalPrice);
			}else {
				totalPrice = 0;
				logger.info("totalPrice {}", totalPrice);
				model.addAttribute("totalPrice", 0);
			}	
		}
		
		System.out.println("totalPrice"+totalPrice);
		return "jsonView";
	}	
	
	
	
	//예약 정보 DB에 저장
	@ResponseBody
	@RequestMapping(value = "/garden/saveReserve")
	public ReserveInfo saveReserve(RequestReserve reserve, Model model) {
		logger.info("[get] /garden/saveReserve");
		
		//프론트로부터 받은 예약 정보 ReserveInfo에 저장
		ReserveInfo info = new ReserveInfo();
		String garden = reserve.getgardenName();
		double totalPrice = 0; // 초기값
		
	if( !garden.toString().equals("noneChecked") ) {
		GardenPriceDto gardenPrice = resService.getGardenPrice(garden);
			if (!( (reserve.getAdult()==0) && 
				  (reserve.getChild()==0) && 
				  (reserve.getOthers()==0) )) {
					totalPrice= reserve.getAdult()*gardenPrice.getAdult() +
					reserve.getChild()*gardenPrice.getchildren()+
					reserve.getOthers()*gardenPrice.getRest();
					info.setTotalPrice(totalPrice);
			}
			info.setGardenNo(gardenPrice.getGardenNo());
		} else {
			info.setGardenNo(000); //공원 선택되지 않으면 공원번호 000으로 지정
			totalPrice = 0;

		}
		
		info.setGardenName(reserve.getgardenName());
		info.setMemberNo(Integer.parseInt(String.valueOf( session.getAttribute("memberNo" )) ));
		info.setGardenName(reserve.getgardenName());
		

		if(reserve.getDatepicker()!="")
			info.setVisitDate(reserve.getDatepicker());
		else
			info.setVisitDate("noneChecked");

		if(reserve.getTime()!="") {
			info.setVisitTime(reserve.getTime());
			if(reserve.getTime() == "moring"){
				totalPrice = totalPrice * 0.8;
			}else if(reserve.getTime() == "night"){
				totalPrice = totalPrice * 1.2;
			}
		}
		else
			info.setVisitTime("NotCheckedTime");
	
		info.setAdultMem(reserve.getAdult());
		info.setChildMem(reserve.getChild());
		info.setDisabMem(reserve.getOthers());
		info.setTotalPrice(totalPrice);
		
		
		// DB에 내역 저장
		if(reserve.getDatepicker()!="" &&
			reserve.getDatepicker()!="" &&
			reserve.getTime()!="" &&
			!( (reserve.getAdult()==0) && 
			   (reserve.getChild())==0) && 
			   (reserve.getOthers()==0) ) {
					resService.saveResInfo(info); 
					int memberNo = Integer.parseInt((String.valueOf( session.getAttribute("memberNo"))));
					int resNo = resService.getReserveNo(memberNo);
					info.setReserveNo(resNo);
					
					String qrNo = resService.getQrCode(info, resNo);
					info.setQrCode(qrNo);
					
					logger.info("DB saved {}", info);
		}
		
		
		return info;
//		return "redirect:/garden/reserveRes";
//		return "/garden/reserveRes";
	}	
	
	
	@RequestMapping(value = "/garden/reserveRes")
	public String resultReserve(Model model) {
		logger.info("[get] /garden/reserveRes");
		logger.info("{}",session.getAttribute("memberNo").toString());
		//예약정보 불러오기 
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		int resNo = resService.getReserveNo(memberNo);
		
		model.addAttribute("qrCodeUrl","http://localhost:8088/qrImg/" + resService.getResInfo(resNo).getQrCode()+".png");
		
		ReserveInfo resInfo = resService.getResInfo(resNo);
		model.addAttribute("resInfo", resInfo);
	
		logger.info("memberNo {} ",memberNo);
		logger.info("resNo {} ",resNo);
		logger.info("resinfo {} ",resInfo);
		logger.info("resinfo {} ", "http://localhost:8088/qrImg/" + resService.getResInfo(resNo).getQrCode()+".png");
		
		return "/garden/reserveRes";
	}
	

	@RequestMapping(value = "/garden/modifyReserve")
	public ReserveInfo modifyReserve(RequestReserve reserve, Model model) {
		logger.info("[get] /garden/modifyReserve");
		
		//프론트로부터 받은 예약 정보 ReserveInfo에 저장
		ReserveInfo info = new ReserveInfo();
		String garden = reserve.getgardenName();
		double totalPrice = 0; // 초기값
		
	if( !garden.toString().equals("noneChecked") ) {
		GardenPriceDto gardenPrice = resService.getGardenPrice(garden);
			if (!( (reserve.getAdult()==0) && 
				  (reserve.getChild()==0) && 
				  (reserve.getOthers()==0) )) {
					totalPrice= reserve.getAdult()*gardenPrice.getAdult() +
					reserve.getChild()*gardenPrice.getchildren()+
					reserve.getOthers()*gardenPrice.getRest();
					info.setTotalPrice(totalPrice);
			}
			info.setGardenNo(gardenPrice.getGardenNo());
		} else {
			info.setGardenNo(000); //공원 선택되지 않으면 공원번호 000으로 지정
			totalPrice = 0;

		}

		info.setGardenName(reserve.getgardenName());
		info.setMemberNo(Integer.parseInt(String.valueOf( session.getAttribute("memberNo" )) ));
		info.setGardenName(reserve.getgardenName());
		

		if(reserve.getDatepicker()!="")
			info.setVisitDate(reserve.getDatepicker());
		else
			info.setVisitDate("noneChecked");

		if(reserve.getTime()!="") {
			info.setVisitTime(reserve.getTime());
			if(reserve.getTime() == "moring"){
				totalPrice = totalPrice * 0.8;
			}else if(reserve.getTime() == "night"){
				totalPrice = totalPrice * 1.2;
			}
		}
		else
			info.setVisitTime("NotCheckedTime");
	
		info.setAdultMem(reserve.getAdult());
		info.setChildMem(reserve.getChild());
		info.setDisabMem(reserve.getOthers());
		info.setTotalPrice(totalPrice);
		
		
		// DB에 내역 저장
		if(reserve.getDatepicker()!="" &&
			reserve.getDatepicker()!="" &&
			reserve.getTime()!="" &&
			!( (reserve.getAdult()==0) && 
			   (reserve.getChild())==0) && 
			   (reserve.getOthers()==0) ) {
					resService.saveResInfo(info); 
					int memberNo = Integer.parseInt((String.valueOf( session.getAttribute("memberNo"))));
					int resNo = resService.getReserveNo(memberNo);
					info.setReserveNo(resNo);
					
					String qrNo = resService.getQrCode(info, resNo);
					info.setQrCode(qrNo);
					
					logger.info("DB saved {}", info);
		}
		return info;
	}	
	
	
	@RequestMapping(value = "/garden/resModify")
	public void resModify(@RequestParam String resNo, ReserveInfo info) {
		System.out.println("resNo"+resNo);
		info = resService.getResInfo(Integer.parseInt(resNo));
		
	}
	
	
}//class end	