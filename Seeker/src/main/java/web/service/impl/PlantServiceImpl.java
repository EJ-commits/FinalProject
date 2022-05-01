package web.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import web.dao.face.PlantDao;
import web.dto.PlantCode;
import web.service.face.PlantService;

@Service
public class PlantServiceImpl implements PlantService{
	
	@Autowired PlantDao plantDao;
	
	@Override
	public PlantCode getCode(String cnum) {
		
		String url = "";
		url += "http://api.nongsaro.go.kr/service/garden/gardenDtl";
		url	+= "?apiKey=20220425VJTSFIKU8XZEEQVAAD6UWG&cntntsNo=" + cnum;
		
		URL api = null;
		InputStream is = null;
			
		try {
			
			api = new URL(url);
			
			is = api.openStream();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
			
			
		Document doc = null;
		
		String temp = null;
		String tempW = null;
		String humid = null;
		String dirt = null;
		String dirtW = null;
		
		try {
				
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
				
			doc.getDocumentElement().normalize();
			
			temp = doc.getElementsByTagName("grwhTpCode").item(0).getFirstChild().getNodeValue();
			tempW = doc.getElementsByTagName("winterLwetTpCode").item(0).getFirstChild().getNodeValue();
			humid = doc.getElementsByTagName("hdCode").item(0).getFirstChild().getNodeValue();
			dirt = doc.getElementsByTagName("watercycleSummerCode").item(0).getFirstChild().getNodeValue();
			dirtW = doc.getElementsByTagName("watercycleWinterCode").item(0).getFirstChild().getNodeValue();
				
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		PlantCode code = new PlantCode();
		
		code.setTemp(temp);
		code.setTempW(tempW);
		code.setHumid(humid);
		code.setDirt(dirt);
		code.setDirtW(dirtW);
		
		return code;
		
	}

	@Override
	public HashMap<String, String> getTip(PlantCode plantCode) {
		
		List<String> text = plantDao.select(plantCode);
		
		HashMap<String, String> tip = new HashMap<String, String>();
		
		tip.put("temp", text.get(0));
		tip.put("tempW", text.get(1));
		tip.put("humid", text.get(2));
		tip.put("dirt", text.get(3));
		tip.put("dirtW", text.get(4));
		
		return tip;
		
	}

}
