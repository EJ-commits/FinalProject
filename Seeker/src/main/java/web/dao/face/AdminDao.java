package web.dao.face;

import java.util.List;

import web.dto.Category;
import web.dto.Goods;
import web.dto.GoodsView;

public interface AdminDao {

	/**
	 * 카테고리에 있는 데이터 조회
	 * 
	 * @return - 카테고리 List
	 */
	public List<Category> category();
	
	/**
	 * 상품 등록
	 * 
	 * @param goods - 등록할 상품 DTO
	 */
	public void register(Goods goods);
	
	/**
	 * 상품 목록 조회
	 * 
	 * @return - 상품 목록 List
	 */
	public List<GoodsView> goodsList();
	
	/**
	 * 상품 상세조회 + 카테고리 조인
	 * 
	 * @param gdsNum - 상세보기 하려는 상품 번호
	 * @return - 상품 정보
	 */
	public GoodsView goodsView(int gdsNum);
	
	/**
	 * 상품 수정
	 * 
	 * @param goods - 새로 수정한 상품 정보
	 */
	public void goodsUpdate(GoodsView goods);
	
	/**
	 * 상품 삭제
	 * 
	 * @param goods - 삭제할 상품 정보
	 */
	public void goodsDelete(Goods goods);
}
