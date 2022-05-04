package web.dto;

import java.util.Date;

public class CartList {

	//장바구니 + 상품 조인 DTO
	
	private int cartNum;
	private int member_no;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String gdsName;
	private int gdsPrice;
	private String ImgOriginName;
	private String ImgStoredName;
	@Override
	public String toString() {
		return "CartList [cartNum=" + cartNum + ", member_no=" + member_no + ", gdsNum=" + gdsNum + ", cartStock="
				+ cartStock + ", addDate=" + addDate + ", num=" + num + ", gdsName=" + gdsName + ", gdsPrice="
				+ gdsPrice + ", ImgOriginName=" + ImgOriginName + ", ImgStoredName=" + ImgStoredName + "]";
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public String getImgOriginName() {
		return ImgOriginName;
	}
	public void setImgOriginName(String imgOriginName) {
		ImgOriginName = imgOriginName;
	}
	public String getImgStoredName() {
		return ImgStoredName;
	}
	public void setImgStoredName(String imgStoredName) {
		ImgStoredName = imgStoredName;
	}
	
	
	
	
	
	
}
