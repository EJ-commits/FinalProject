package web.dao.face;

import java.util.List;

import web.dto.GardenPriceDto;
import web.dto.ReserveInfo;

public interface ReserveDao {
	
	
	/**
	 * DB에 저장된 수목원 목록을 조회한다.
	 * 
	 * @return 수목원 목록이 담긴 list 객체
	 * */
	public List<String> getGardenNameList();


	/**
	 * 해당 수목원의 가격을 조회한다.
	 * @param garden 
	 * 
	 * @return 수목원 목록이 담긴 list 객체
	 * */
	public GardenPriceDto getGardenPrice(String garden);

	/**
	 * 예약 내역을 저장한다. 
	 * @param 예약 내역이 들어있는 DTO
	 * */
	public void saveResInfo(ReserveInfo info);

	/**
	 * 예약 번호를 불러온다. 
	 * @param 예약한 사람의 유저번호
	 * @return 
	 * */
	public int getReserveNo(int memberNo);



}


