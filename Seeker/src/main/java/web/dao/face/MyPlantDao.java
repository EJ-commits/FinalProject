package web.dao.face;

import java.util.List;

import web.dto.MyPlant;

public interface MyPlantDao {
	
	public List<MyPlant> selectList();
	
	public MyPlant select(int myPlantNo);

	public String selectNick(int myPlantNo);
}
