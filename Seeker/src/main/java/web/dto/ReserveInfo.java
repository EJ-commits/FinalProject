package web.dto;

import java.util.Date;

public class ReserveInfo {
	private String gardenName;
	private int UserNo;
	private String visitDate;
	private String visitTime;
	private int adultMem;
	private int childMem;
	private int disabMem;
	private int totalPrice;
	public String getGardenName() {
		return gardenName;
	}
	public void setGardenName(String gardenName) {
		this.gardenName = gardenName;
	}
	public int getUserNo() {
		return UserNo;
	}
	public void setUserNo(int userNo) {
		UserNo = userNo;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String string) {
		this.visitDate = string;
	}
	public String getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}
	public int getAdultMem() {
		return adultMem;
	}
	public void setAdultMem(int adultMem) {
		this.adultMem = adultMem;
	}
	public int getChildMem() {
		return childMem;
	}
	public void setChildMem(int childMem) {
		this.childMem = childMem;
	}
	public int getDisabMem() {
		return disabMem;
	}
	public void setDisabMem(int disabMem) {
		this.disabMem = disabMem;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "ReserveInfo [gardenName=" + gardenName + ", UserNo=" + UserNo + ", visitDate=" + visitDate
				+ ", visitTime=" + visitTime + ", adultMem=" + adultMem + ", childMem=" + childMem + ", disabMem="
				+ disabMem + ", totalPrice=" + totalPrice + "]";
	}


}
