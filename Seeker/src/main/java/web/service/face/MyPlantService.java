package web.service.face;

import java.util.List;

import web.dto.MyPlant;

public interface MyPlantService {
	
	public List<MyPlant> list(int memberNo);
	
	public String nick(int myPlantNo);
	
	public MyPlant profile(int myPlantNo);
	
	public void write(MyPlant myPlant);
	
	public void drop(int myPlantNo);
	
}
