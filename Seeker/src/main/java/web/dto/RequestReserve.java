package web.dto;

import java.util.Date;

public class RequestReserve {

	private String btnradio;
	private String datepicker;
	private String time;
	private int adult;
	private int child;
	private int others;
	
	public String getBtnradio() {
		return btnradio;
	}
	public void setBtnradio(String btnradio) {
		this.btnradio = btnradio;
	}
	public String getDatepicker() {
		return datepicker;
	}
	public void setDatepicker(String datepicker) {
		this.datepicker = datepicker;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getOthers() {
		return others;
	}
	public void setOthers(int others) {
		this.others = others;
	}
	@Override
	public String toString() {
		return "ReserveInfo [ btnradio=" + btnradio + ", datepicker=" + datepicker + ", time="
				+ time + ", adult=" + adult + ", child=" + child + ", others=" + others + "]";
	}
	
	
}
