package com.heike.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.heike.pojo.Recruit;
import com.heike.pojo.Salary;
import com.heike.pojo.Student;


//参考博文：http://heisetoufa.iteye.com/blog/1932093

public class CreateExcel {

	public static InputStream getExcelInputStream(String[] titles,
			List<Salary> salarys, List<Recruit> recruits) {
		// 将OutputStream转化为InputStream
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		
		putDataOnOutputStream(titles, salarys, recruits, out);
		
		return new ByteArrayInputStream(out.toByteArray());
	}

	private static void putDataOnOutputStream(String[] titles,
			List<Salary> salarys, List<Recruit> recruits, OutputStream os) {
		try { 
			WritableWorkbook wworkbook = Workbook.createWorkbook(os);

			// 生成名为'第一页'的工作表，参数0表示这是第一页
			WritableSheet sheet = wworkbook.createSheet("学生补助报表", 0);

			// 合并单元格 //列 行
			sheet.mergeCells(0, 0, 11, 0);// 合并第1行第1列到第1行第12列的单元格

			// 设定行高
			sheet.setRowView(0, 400); // 设定第一行的高度为400
			// 设定列宽
			sheet.setColumnView(4, 15); // 设定第5列的宽度20
			sheet.setColumnView(5, 15); // 设定第6列的宽度20

			// 指定字体、字号和粗细
			WritableFont font = new WritableFont(WritableFont.TIMES, 12,
					WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			format.setAlignment(Alignment.CENTRE); // 水平居中
			format.setVerticalAlignment(VerticalAlignment.CENTRE); // 垂直居中

			// 在Label对象的构造函数中指明单元格的位置是第一行第一列，单元格的内容为
			Label label = new Label(0, 0, "安徽农业大学学生勤工助学工资表("+ salarys.get(0).getMonth() + ")", format);
			// 将定义好的单元格添加到工作表中
			sheet.addCell(label);

			sheet.mergeCells(0, 1, 2, 1);// 合并第2行第1列到第2行第3列单元格
			sheet.setRowView(1, 300); // 设定第2行的高度为400
			font = new WritableFont(WritableFont.TIMES, 10,
					WritableFont.BOLD);
			format = new WritableCellFormat(font);
			format.setAlignment(Alignment.CENTRE); // 水平居中
			format.setVerticalAlignment(VerticalAlignment.CENTRE); // 垂直居中
			label = new Label(0, 1, "用工单位盖章处", format);	//在第2行第2列
			sheet.addCell(label);
			
			// 添加标题
			if (null != titles) {
				for (int i = 0; i < titles.length; i++) {
					label = new Label(i, 2, titles[i]); // 在第三行添加标题
					sheet.addCell(label);
				}
			}
			
			// 一个学生的所有薪资信息对应一个map	
								 //	姓名	   学号		年级专业		岗位名称   	     工作时间		基本工资	工具费	奖金		实发工资	所在学院	备注
			// 学生的信息存放在List集合中(name, number, profession, postName, worktime, salary, toolFee, bonus, total, college, remarks)
			Map<String, List<Object>> map = new LinkedHashMap<String, List<Object>>();	
			
			for(int i = 0; salarys != null && i < salarys.size(); i++) {
			
				Salary s = salarys.get(i);
				
				Student student = s.getStudent();
				String number = student.getNumber();
				String name = student.getName();
				String profession = student.getProfession();
				String college = student.getCollege();
				
				Recruit recruit = recruits.get(i);
				String rpostName = recruit.getPostName();
				String rworktime = s.getWorktime();	//工作时间
				float rsalary = s.getSalary();	//基本工资
				float rtoolFee = s.getToolFee();	//工具费
				float rbonus = s.getBonus();	//奖金
				float rtotal = rsalary + rtoolFee + rbonus;	//实发工资
				String empName = s.getEmployer().getName();		//用工单位
				
				String rremarks = s.getRemarks(); 	//备注
				
				if(!rremarks.equals("无")){
					rremarks += "("+ empName +")";
				}
				
				if(map.containsKey(number)){
					List<Object> list = map.get(number);
					String postName = (String) list.get(3);	//岗位名称
					postName = postName + "，" + rpostName;
					list.set(3, postName);
					
					String worktime = (String) list.get(4);	//工作时间
					worktime = worktime + " + " + rworktime;
					list.set(4, worktime);
					
					
					String salary = String.valueOf(list.get(5));	//基本工资
					salary = salary + " + " + rsalary;
					list.set(5, salary);
					
					String toolFee = list.get(6).toString();	//工具费
					toolFee = toolFee + " + " + rtoolFee;
					list.set(6, toolFee);
					
					String bonus = list.get(7).toString();	//奖金
					bonus = bonus + " + " + rbonus;
					list.set(7, bonus);
					
					Float total = (Float) list.get(8);	//实发工资
					total = total + rtotal;
					list.set(8, total);
					
					String remarks = (String) list.get(10);	//备注信息
					if(remarks.equals("无")){
						remarks = rremarks;

					}else if(!rremarks.equals("无")) {
						remarks = remarks + "，" + rremarks;
					}
					
					list.set(10, remarks);
					
					map.put(number, list);
					
				}else {
					List<Object> list = new ArrayList<Object>();
					
					list.add(name);
					list.add(number);
					list.add(profession);
					list.add(rpostName);
					list.add(rworktime);
					list.add(rsalary);
					list.add(rtoolFee);
					list.add(rbonus);
					list.add(rtotal);
					list.add(college);
					list.add(rremarks);
					
					map.put(number, list);
				}
				
				/*
				List<String> datas = new ArrayList<String>();
				
				Salary s = salarys.get(i);
				
				Integer num = i + 1;	//编号
				
				Student student = s.getStudent();
				String stuName = student.getName();
				String stuNum = student.getNumber();
				String profession = student.getProfession();
				
				Recruit recruit = recruits.get(i);
				
				String postName = recruit.getPostName();	//岗位名称
				
				String worktime = s.getWorktime();	//工作时间
				float salary = s.getSalary();	//基本工资
				float toolFee = s.getToolFee();	//工具费
				float bonus = s.getBonus();	//奖金
				
				//所在学院
				String college = student.getCollege();
				
				String remarks = s.getRemarks();	//备注
				
				datas.add(num+"");
				datas.add(stuName);
				datas.add(stuNum);
				datas.add(profession);
				datas.add(postName);
				datas.add(worktime);
				datas.add(salary+"");
				datas.add(toolFee+"");
				datas.add(bonus+"");
				datas.add((salary+toolFee+bonus)+"");	//实发工资
				datas.add(college);	//学生所在学院
				datas.add(remarks);
				
				for(int j = 0; j < datas.size(); j++){
					label = new Label(j, i+3, datas.get(j)); // 
					sheet.setColumnView(3, 17); // 设定第4列的宽度17
					sheet.setColumnView(10, 17); // 设定第11列的宽度17
					sheet.addCell(label);
				}
				*/
			}
			
			Set<Entry<String, List<Object>>> set = map.entrySet();
			
			int i = 0;
			
			for(Iterator<Entry<String, List<Object>>> iter = set.iterator(); iter.hasNext(); ){
				
				Entry<String, List<Object>> entry = iter.next();
				
				List<Object> list = entry.getValue();
				
				for(int j = 0; j < list.size(); j++){
					label = new Label(0, i+3, (i+1+""));
					sheet.addCell(label);
									//列	      行
					label = new Label(j+1, i+3, list.get(j)+""); // 
					sheet.setColumnView(3, 17); // 设定第4列的宽度17
					sheet.setColumnView(10, 17); // 设定第11列的宽度17
					sheet.addCell(label);
				}
				
				i++;
			}
			
			
			// 添加数据
			// for(int i = 0; i < datas.size(); i++){
			// //String是学院或社团的名字，List对应其中的数据
			// Map<String, List> map = datas.get(i);
			// Set<Map.Entry<String, List>> set = map.entrySet();
			//
			// for(Iterator<Map.Entry<String, List>> iter = set.iterator();
			// iter.hasNext();){
			// Map.Entry<String, List> entry = iter.next();
			//
			// String key = entry.getKey();
			// List values = entry.getValue(); //具体显示信息
			//
			// }
			//
			//
			// }

			// 生成一个保存数字的单元格，必须使用Number的完整路径，否则有语法歧义
			// jxl.write.Number number = new jxl.write.Number(0, 1, 21.10);

			// sheet.addCell(number);

			// 写入数据并关闭文件
			wworkbook.write();
			wworkbook.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
