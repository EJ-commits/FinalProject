package web.service.face;

import java.util.HashMap;

import web.dto.PlantCode;

public interface PlantService {
	
	public PlantCode getCode(String cnum);
	
	public HashMap<String, String> getTip(PlantCode Code);
	
}
