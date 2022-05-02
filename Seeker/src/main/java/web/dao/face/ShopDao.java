package web.dao.face;

import java.util.List;

import web.dto.GoodsView;

public interface ShopDao {

	/**
	 * 카테고리별 상품 리스트 목록 조회 : 1차 분류
	 * 
	 * @param cateCode - 1차 카테고리
	 * @param cateCodeRef - 2차 카테고리
	 * @return 상품 리스트
	 */
	public List<GoodsView> list_1(int cateCode, int cateCodeRef);
	
	/**
	 * 카테고리별 상품 리스트 목록 조회 : 2차 분류
	 * 
	 * @param cateCode - 1차 카테고리
	 * @return 상품 리스트
	 */
	public List<GoodsView> list_2(int cateCode);
	
	/**
	 * 상품 상세조회 + 카테고리 조인
	 * 
	 * @param gdsNum - 상세보기 하려는 상품 번호
	 * @return - 상품 정보
	 */
	public GoodsView goodsView(int gdsNum);
}
