package web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TransDate {
	
	public String toString(String str) {
		
		String date = null;
		
		try {
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyyMMdd");
			
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
			
			Date tempDate = beforeFormat.parse(str);
			
			date = afterFormat.format(tempDate);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
			
		}
		
		
		return date;
		
	}
	
	public Date toDate(String str) {
		
		Date tempDate = null;
		
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			
			tempDate = format.parse(str);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
			
		}
		
		return tempDate;

	}
		
}

