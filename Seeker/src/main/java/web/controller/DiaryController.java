package web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.dto.Diary;
import web.dto.PlantCode;
import web.service.face.DiaryService;
import web.service.face.PlantService;
import web.util.TransDate;

@Controller
@RequestMapping( value = "/diary")
public class DiaryController {

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired private DiaryService diaryService;
	@Autowired private PlantService plantService;
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar() {
		
		logger.info("diary/calendar [GET]");
		
		return "/myplant/calendar";
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String week(
			
			@RequestParam(value="param") String week
			
			) throws JsonProcessingException {
	
		logger.info("diary/list [GET]");
		logger.info("{}", week);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String result = objectMapper.writeValueAsString(diaryService.list(week));
		
		return result;
		
		
	}
	
	@RequestMapping(value = "/view", method = {RequestMethod.GET, RequestMethod.POST})
	public String getView(HttpSession session, String date, Model model) throws IOException {
		
		logger.info("/diary/view [GET, POST]");
		
		if(date != null) {
			session.setAttribute("date", date);
		} else {
			date = (String) session.getAttribute("date");
		}
		
		logger.info("{}", date);
		
		Diary diary = diaryService.diary(date);
		
		PlantCode code = plantService.getCode("13242");
		
		HashMap<String, String> tip = plantService.getTip(code);
		
		model.addAttribute("diary", diary);
		model.addAttribute("code", code);
		model.addAttribute("tip", tip);
		
		TransDate transDate = new TransDate();
		model.addAttribute("newDate", transDate.toString(date));
		
		return "/myplant/diaryview";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(HttpSession session, String date, Model model) {
		
		logger.info("diary/write [GET]");
		logger.info("{}", date);
		
		session.setAttribute("date", date);
		
		TransDate transDate = new TransDate();
		model.addAttribute("newDate", transDate.toString(date));
		
		return "/myplant/diarywrite";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpSession session, Diary diary, MultipartFile file) {
		
		logger.info("diary/write [POST]");
		
		diary.setDdate((String) session.getAttribute("date"));
		
		diaryService.write(diary, file);
		
		return "forward:/diary/view";
		
	}
	
	@RequestMapping(value = "/alter", method = RequestMethod.POST)
	public String alter(HttpSession session, Diary diary, MultipartFile file) {
		
		logger.info("diary/alter [POST]");
		
		diary.setDdate((String) session.getAttribute("date"));

		diaryService.alter(diary, file);
		
		return "forward:/diary/view";
		
	}
	
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String drop(HttpSession session) {
		
		logger.info("diary/delete [GET]");
		
		String date = (String) session.getAttribute("date");
		logger.info("{}", date);
		
		diaryService.drop(date);
		session.removeAttribute("date");
		
		return "redirect:/diary/calendar";
		
	}

}