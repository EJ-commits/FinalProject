package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.MyPlantService;

@Controller
@RequestMapping(value = "/myplant")
public class MyPlantController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPlantController.class);
	
	@Autowired private MyPlantService myPlantService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		logger.info("myplant/list [GET]");

		model.addAttribute("list", myPlantService.list());
		
		return "/myplant/list";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(Model model) {
		
		logger.info("myplant/write [GET]");
		
		return "/myplant/write";
		
	}
	
	@RequestMapping(value = "/alter", method = RequestMethod.GET)
	public String getAlter(Model model) {
		
		logger.info("myplant/alter [GET]");
		
		return "/myplant/alter";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model) {
		
		logger.info("myplant/delete [GET]");
		
		return "redirect:/myplant/list";
		
	}

}
