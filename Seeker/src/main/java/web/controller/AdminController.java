package web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONArray;
import web.dto.Category;
import web.dto.Goods;
import web.dto.GoodsView;
import web.service.face.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired AdminService adminService;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//메인
	@RequestMapping(value = "/index")
	public void adminIndex() {}
	
	//카테고리분류
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void goodsRegister(Model model) {
		logger.info("/admin/goods/register [GET]");
		
		List<Category> category = adminService.category();
		
		//카테고리를 JSON타입으로 변환 후 모델값 전달
		model.addAttribute("category", JSONArray.fromObject(category));
		
		logger.info("category : {}", category);
	}
	
	//상품등록
	@Transactional
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String goodsRegisterProc(Goods goods, MultipartFile file) {
		adminService.register(goods, file);
		
		return "redirect:/admin/index";
	}
	
	//상품목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void goodsList(Model model) {
		
		List<Goods> list = adminService.goodsList();
		
		model.addAttribute("list", list);
	}
	
	//상품 상세보기
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void goodsView(@RequestParam("n") int gdsNum, Model model) {
		
		GoodsView goods = adminService.goodsView(gdsNum);
		
		logger.info("goods : {}", goods);
		
		model.addAttribute("goods", goods);
	}
	
	//상품 수정 GET
	@RequestMapping(value = "/goods/update", method = RequestMethod.GET)
	public void goodsUpdate(@RequestParam("n")int gdsNum, Model model) {
		
		GoodsView goods = adminService.goodsView(gdsNum);
		logger.info("goods : {}", goods);
		model.addAttribute("goods", goods);
		
		List<Category> category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
	}
	
	//상품 수정 POST
	@Transactional
	@RequestMapping(value = "/goods/update", method = RequestMethod.POST)
	public String goodsUpdateProc(GoodsView goods, MultipartFile file) {
		
		logger.info("/admin/goods/update [POST]");
		logger.info("goods : {}", goods);
		
		adminService.goodsUpdate(goods, file);
		
		return "redirect:/admin/goods/list";
	
	}
	
	//상품 삭제
	@Transactional
	@RequestMapping(value = "/goods/delete", method = RequestMethod.GET)
	public String goodsDelete(Goods goods) {
		
		adminService.goodsDelete(goods);
		
		return "redirect:/admin/goods/list";
	}
	
	
}
