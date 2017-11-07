package com.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 系统Util类
 * @author 于小耘
 */
public class SysUtil {
	
	public static String getCurrentTime() {
		// TODO Auto-generated method stub
	    Date date = new Date();
	    DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	    String time = format.format(date);
	    return time;

	}
	public static String getCurrentTime(String formatStr){
	    Date date = new Date();
	    DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	    if(formatStr!=null){
	    	format = new SimpleDateFormat(formatStr);
	    }
		String time = format.format(date);
		return time;
	}



}
