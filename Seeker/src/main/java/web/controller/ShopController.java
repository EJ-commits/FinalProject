package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.GoodsView;
import web.service.face.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired ShopService shopService;
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@RequestMapping(value = "/home")
	public void home() {}
	
	//(사용자)상품 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,
						@RequestParam("L") int level, Model model) {
		logger.info("/shop/list [GET]");
		
		List<GoodsView> list = shopService.list(cateCode, level);
		
		model.addAttribute("list", list);
		
	}
	
	//(사용자)상품 상세 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) {
		logger.info("get view");
		
		GoodsView view = shopService.goodsView(gdsNum);
		model.addAttribute("view", view);
	}
	
}
