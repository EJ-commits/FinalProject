package web.service.face;

import java.util.List;

import web.dto.MyPlant;

public interface MyPlantService {
	
	public List<MyPlant> list();
	
	public String nick(int myPlantNo);
	
	public MyPlant profile(int myPlantNo);
	
}
