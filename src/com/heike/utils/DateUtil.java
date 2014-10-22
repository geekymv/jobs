package com.heike.utils;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
		/**
		 * 判断当前日期是否为该月的最后7天
		 * @return
		 */
		@SuppressWarnings("deprecation")
		public static boolean isLast7Day() {
			
			Date current = new Date();
			int cyear = current.getYear()+1900;
			int cmonth = current.getMonth()+1;
			int cday = current.getDate();
			
			System.out.println("当前日期 = " + cyear + " - " + cmonth + " - " + cday);
			
			Date date = getLastDayOfMonth(cyear, cmonth);	//取得某月的的最后一天 的日期
			int day = date.getDate();
			
			
			if(cday >= day-6 && cday <= day) {
				return true;
			}
	    	
			return false;
		}
		
		  /** 
	     * 取得某月的的最后一天 
	     *  
	     * @param year 
	     * @param month 
	     * @return 
	     */ 
	    public static Date getLastDayOfMonth(int year, int m) { 
	        Calendar cal = Calendar.getInstance(); 
	        cal.set(Calendar.YEAR, year);// 年 
	        cal.set(Calendar.MONTH, m - 1);// 月，因为Calendar里的月是从0开始，所以要减1 
	        cal.set(Calendar.DATE, 1);// 日，设为一号 
	        cal.add(Calendar.MONTH, 1);// 月份加一，得到下个月的一号 
	        cal.add(Calendar.DATE, -1);// 下一个月减一为本月最后一天 
	        return cal.getTime();// 获得月末是几号 
	    } 

}
