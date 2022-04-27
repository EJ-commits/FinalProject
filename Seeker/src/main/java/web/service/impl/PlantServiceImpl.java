package web.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import web.dto.Plant;
import web.service.face.PlantService;

@Service
public class PlantServiceImpl implements PlantService{

	@Override
	public Plant getTip(String cnum) {
		
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
		
		Plant plant = new Plant();
		
		plant.setTemp(temp);
		plant.setTempW(tempW);
		plant.setHumid(humid);
		plant.setDirt(dirt);
		plant.setDirtW(dirtW);
		
		return plant;
		
	}

}
