package web.service.face;

import java.util.List;

import web.dto.Cart;
import web.dto.CartList;
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
	
	/**
	 * 상품 상세조회 + 카테고리 조인
	 * 
	 * @param gdsNum - 상세보기 하려는 상품 번호
	 * @return - 상품 정보
	 */
	public GoodsView goodsView(int gdsNum);
	
	/**
	 * 장바구니 추가
	 * 
	 * @param cart - 장바구니에 담길 객체
	 */
	public void addCart(Cart cart);
	
	/**
	 * 장바구니 목록
	 * 
	 * @param id - 장바구니 담는 회원
	 * @return 장바구니 목록
	 */
	public List<CartList> cartList(int member_no);
	
	/**
	 * 장바구니 삭제
	 * 
	 * @param cart - 삭제할 장바구니
	 */
	public void deleteCart(Cart cart);

	/**
	 * 장바구니 수량 변경
	 * 
	 * @param cart - 수량 변경할 장바구니
	 */
	public void updateCart(Cart cart);
	
	/**
	 * 장바구니에 담을 상품이 중복되어 담기는 지 체크
	 * 
	 * @param cart - 장바구니
	 * @param memberNo - 멤버넘버(못가져오는 케이스여서 주입해줄 예정)
	 * @return int - 1이면 중복, 0이면 중복아님
	 */
	public int selectCart(Cart cart);
}
