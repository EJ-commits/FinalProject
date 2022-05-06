package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ShopDao;
import web.dto.Cart;
import web.dto.CartList;
import web.dto.GoodsView;
import web.service.face.ShopService;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired ShopDao shopDao;

	//카테고리별 상품 리스트
	@Override
	public List<GoodsView> list(int cateCode, int level) {
		
		int cateCodeRef = 0;
		
		if(level == 1) { // level 1 = 1차 분류
			
			cateCodeRef = cateCode;
			return shopDao.list_1(cateCode, cateCodeRef);
			//두 가지 모두 cateCode로 해도 무관
			
			
		} else { // level 2 = 2차 분류
			
			return shopDao.list_2(cateCode);
		}
		
	}

	//상품 상세조회
	@Override
	public GoodsView goodsView(int gdsNum) {
		
		return shopDao.goodsView(gdsNum);
	}

	//장바구니 담기
	@Override
	public void addCart(Cart cart) {
		shopDao.addCart(cart);
	}

	//장바구니 목록
	@Override
	public List<CartList> cartList(int member_no) {		
		return shopDao.cartList(member_no);
	}

	//장바구니 삭제
	@Override
	public void deleteCart(Cart cart) {
		shopDao.deleteCart(cart);
	}

	//장바구니 수량 변경
	@Override
	public void updateCart(Cart cart) {
		shopDao.updateCart(cart);
	}

	@Override
	public int selectCart(Cart cart) {
		
		int result = shopDao.selectCart(cart);
		
		return result;
	}
	
	
	
	

	
	
	

}
