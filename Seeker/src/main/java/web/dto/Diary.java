package web.dto;

public class Diary {
	
	private int diaryNo;
	private int myPlantNo;
	private String diaryTemp;
	private String diaryHumid;
	private String diaryDirt;
	private String diaryWater;
	private String diaryRepot;
	private String diaryCmt;
	private String diaryDate;
	
	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", myPlantNo=" + myPlantNo + ", diaryTemp=" + diaryTemp + ", diaryHumid="
				+ diaryHumid + ", diaryDirt=" + diaryDirt + ", diaryWater=" + diaryWater + ", diaryRepot=" + diaryRepot
				+ ", diaryCmt=" + diaryCmt + ", diaryDate=" + diaryDate + "]";
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getMyPlantNo() {
		return myPlantNo;
	}

	public void setMyPlantNo(int myPlantNo) {
		this.myPlantNo = myPlantNo;
	}

	public String getDiaryTemp() {
		return diaryTemp;
	}

	public void setDiaryTemp(String diaryTemp) {
		this.diaryTemp = diaryTemp;
	}

	public String getDiaryHumid() {
		return diaryHumid;
	}

	public void setDiaryHumid(String diaryHumid) {
		this.diaryHumid = diaryHumid;
	}

	public String getDiaryDirt() {
		return diaryDirt;
	}

	public void setDiaryDirt(String diaryDirt) {
		this.diaryDirt = diaryDirt;
	}

	public String getDiaryWater() {
		return diaryWater;
	}

	public void setDiaryWater(String diaryWater) {
		this.diaryWater = diaryWater;
	}

	public String getDiaryRepot() {
		return diaryRepot;
	}

	public void setDiaryRepot(String diaryRepot) {
		this.diaryRepot = diaryRepot;
	}

	public String getDiaryCmt() {
		return diaryCmt;
	}

	public void setDiaryCmt(String diaryCmt) {
		this.diaryCmt = diaryCmt;
	}

	public String getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(String diaryDate) {
		this.diaryDate = diaryDate;
	}

}
