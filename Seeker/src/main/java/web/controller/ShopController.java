package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Cart;
import web.dto.CartList;
import web.dto.GoodsView;
import web.service.face.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired ShopService shopService;
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	//상품 홈
	@RequestMapping(value = "/home")
	public void home() {}
	
	//상품 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,
						@RequestParam("L") int level, Model model) {
		logger.info("/shop/list [GET]");
		
		List<GoodsView> list = shopService.list(cateCode, level);
		
		model.addAttribute("list", list);
		
	}
	
	//상품 상세조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) {
		
		GoodsView view = shopService.goodsView(gdsNum);
		model.addAttribute("view", view);
	}
	
	//카트 담기
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/view/addCart",method = RequestMethod.POST)
	public int addCart(Cart cart, HttpSession session) {
		
		//로그인 되어있는 지 체크
		int result = 0;
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		if(memberNo != 0) {
			
			cart.setMember_no(memberNo);
			shopService.addCart(cart);
			result = 1;
		}
		
		return result;
	}
	
	//카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) {
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		List<CartList> cartList = shopService.cartList(memberNo);
		
		model.addAttribute("cartList", cartList);
		
	}
}
