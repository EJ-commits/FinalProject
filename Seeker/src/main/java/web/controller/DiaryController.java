package web.controller;

import java.io.IOException;

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
import web.dto.Plant;
import web.service.face.DiaryService;
import web.service.face.PlantService;
import web.util.TransDate;

@Controller
@RequestMapping( value = "/diary")
public class DiaryController {

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired private DiaryService diaryService;
	@Autowired private PlantService plantService;
	
	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public String calender() {
		
		logger.info("diary/calender [GET]");
		
		return "/myplant/calender";
		
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
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(String date, Model model) {
		
		logger.info("diary/write [GET]");
		logger.info("{}", date);
		
		TransDate transDate = new TransDate();
		
		String newDate = transDate.toString(date);
		
		model.addAttribute("date", date);
		model.addAttribute("newDate", newDate);
		
		return "/myplant/diarywrite";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Diary diary, MultipartFile file, Model model) {
		
		logger.info("diary/write [POST]");
		logger.info("{}", diary);
		
		diaryService.write(diary, file);
		
		TransDate transDate = new TransDate();
		
		String newDate = transDate.toString(diary.getDdate());
		
		model.addAttribute(diary);
		model.addAttribute("newDate", newDate);
		
		return "/myplant/diaryview";
		
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String getView(String date, Model model) throws IOException {
		
		logger.info("/diary/view [GET]");
		logger.info("{}", date);
		
		Diary diary = diaryService.diary(date);
		
		Plant plant = plantService.getTip("13242");
		
		TransDate transDate = new TransDate();
		
		String newDate = transDate.toString(diary.getDdate());
		
		logger.info("{}", diary);
		logger.info("{}", plant);

		model.addAttribute(diary);
		model.addAttribute("newDate", newDate);
		model.addAttribute(plant);
		
		return "/myplant/diaryview";
		
	}
	
	@RequestMapping(value = "/alter", method = RequestMethod.POST)
	public String alter(Diary diary, MultipartFile file, Model model) {
		
		logger.info("diary/alter [POST]");
		logger.info("{}", diary);

		diaryService.alter(diary, file);
		
		TransDate transDate = new TransDate();
		
		String newDate = transDate.toString(diary.getDdate());
		
		model.addAttribute(diary);
		model.addAttribute("newDate", newDate);
		
		return "/myplant/diaryview";
		
	}
	
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String drop(String date) {
		
		logger.info("diary/delete [GET]");
		logger.info("{}", date);
		
		diaryService.drop(date);
		
		return "redirect:/diary/calender";
		
	}

}