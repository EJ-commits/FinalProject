package web.service.face;

import java.util.List;

import web.dto.GoodsView;

public interface ShopService {

	/**
	 * 카테고리별 상품 리스트 목록 조회
	 * 
	 * @param cateCode - 1차 카테고리
	 * @param level - 1:1차 카테고리만 있음, 2:2차 카테고리까지 있음
	 * @return 상품 리스트
	 */
	public List<GoodsView> list(int cateCode, int level);
	
}
