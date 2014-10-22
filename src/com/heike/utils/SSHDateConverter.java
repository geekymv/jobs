package com.heike.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class SSHDateConverter extends StrutsTypeConverter {

	private DateFormat format;
	{
		format = new SimpleDateFormat("yyyy-MM-dd");
	}
	
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		
		if(toClass == Date.class){
			try {
				return format.parse(values[0]);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	@Override
	public String convertToString(Map context, Object obj) {

//		if(obj.getClass() == Date.class){
//			return format.format(obj);
//		}
		if(obj instanceof Date){
			return format.format((Date)obj);
		}

		return null;
	}
}








