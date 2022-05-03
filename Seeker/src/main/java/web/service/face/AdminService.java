package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Category;
import web.dto.Goods;
import web.dto.GoodsView;

public interface AdminService {

	/**
	 * 카테고리 조회
	 * 
	 * @return - 카테고리 List
	 */
	public List<Category> category();
	
	/**
	 * 상품 등록
	 * 
	 * @param goods - 등록할 상품 DTO
	 * @param file - 등록할 상품 썸네일이미지
	 */
	public void register(Goods goods,  MultipartFile file);
	
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
	 * @param file - 새로 수정한 상품 썸네일이미지
	 */
	public void goodsUpdate(GoodsView goods, MultipartFile file);
	
	/**
	 * 상품 삭제
	 * 
	 * @param goods - 삭제할 상품 정보
	 */
	public void goodsDelete(Goods goods);
}
