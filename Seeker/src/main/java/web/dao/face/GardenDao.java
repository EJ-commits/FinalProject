package web.dao.face;

import web.dto.Garden;

public interface GardenDao {

	/**
	 * 수목원 또는 공원 이름으로 수목원 또는 공원 조회
	 * @param garden 조회할 수목원 또는 공원 이름
	 * @return 수목원번호
	 */
	public int selectByGardenName(Garden garden);

	/**
	 * 리스트 갯수 조회
	 * @param garden 조회할 번호
	 * @return 리뷰 갯수
	 */
	public int selectCntByGardenNo(int gardenNo);

	/**
	 * 번호에 해당하는 리스트 목록 조회
	 * @param gardenNo 조회하려는 번호
	 * @return 리뷰 리스트
	 */
//	public List<Garden> selectListAll(int gardenNo);

}
