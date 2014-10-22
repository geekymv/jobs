package com.heike.utils;

import java.io.File;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;


public class ReadExcel {
	
	public static void readExcel(){
		try {
			Workbook book = Workbook.getWorkbook(new File("C:\\Users\\Administrator\\Downloads\\文件名(7).xls"));
			
			Sheet sheet = book.getSheet(0);	//获得第一个工作表对象
			
			Cell cell = sheet.getCell(0, 0);	//得到第一列第一行的单元格
			
			String content = cell.getContents();	//得到单元格的内容
			
			System.out.println(content);
			
			book.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//循环读取Excel的内容
	public static void readExcel2(){
		try {
			Workbook workbook = Workbook.getWorkbook(new File("C:\\Users\\Administrator\\Downloads\\文件名(7).xls"));

			Sheet sheet = workbook.getSheet(0);
			
			int cols = sheet.getColumns();
			int rows = sheet.getRows();
			
//			System.out.println("列数 = " + cols + ", 行数 = " + rows);
			
			for (int i = 0; i < rows; i++) {
				for (int j = 0; j < cols; j++) {
					
					String content = sheet.getCell(j, i).getContents();
					
					System.out.println(content);
					
				}
			}
			
			workbook.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		
		readExcel2();
	}
}
