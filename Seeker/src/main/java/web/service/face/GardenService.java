package web.service.face;

import web.dto.Garden;


public interface GardenService {

	/**
	 * 해당 수목원 또는 공원 리스트를 가져오기 위해 수목원 이름으로 수목원 번호 가져오기
	 * @param garden 조회할 수목원 또는 공원 이름
	 * @return 수목원 또는 공원 번호
	 */
	public int getGardenNo(Garden garden);
	
	/**
	 * 리스트가 1개 이상인지 확인
	 * @param garden 확인할 수목원 번호
	 * @return 리스트 갯수
	 */
	public int listCnt(int gardenNo);

	/**
	 * 해당 수목원 또는 공원의 리뷰 리스트 불러오기
	 * @param gardenNo 확인할 수목원 번호
	 * @return 리뷰 리스트
	 */
//	public List<Garden> list(int gardenNo);
	

	


	

}
