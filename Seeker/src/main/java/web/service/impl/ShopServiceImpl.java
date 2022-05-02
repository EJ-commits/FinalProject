package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ShopDao;
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
	
	// 상품조회 + 카테고리 조인
	@Override
	public GoodsView goodsView(int gdsNum) {

		return shopDao.goodsView(gdsNum);
	}

	
	
	

}
