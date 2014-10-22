package com.heike.action;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Salary;
import com.heike.pojo.Student;
import com.heike.service.RecruitService;
import com.heike.service.SalaryService;
import com.heike.utils.ConstantUtils;
import com.heike.utils.CreateExcel;
import com.heike.utils.SSHDateConverter;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 下载Excel
 */
@Controller("downloadExcelAction")
@Scope("prototype")
public class DownloadExcelAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = -4688945224880167732L;
	
	@Autowired
	private SalaryService salaryService;
	@Autowired
	private RecruitService recruitService;
	
	private InputStream excelStream;
	
	private String filename;
	
	private String month;	//月份
	
	private Employer employer;
	
	public String loadSalary() throws Exception {
		employer = (Employer)session.get("employer");
		if(employer == null) {
			return ERROR;
		}
		
		String[] titles = {"序号", "姓名", "学号", "年级专业", "岗位名称", "工作时间/h", "基本工资", "工具费", "奖金", "实发工资", "所在学院", "备注"};

		SSHDateConverter converter = new SSHDateConverter();
		String date = converter.convertToString(null, new Date());
		filename = "学生勤工助学工资表" + date + ".xls";
		filename = new String(filename.getBytes("gbk"), "iso-8859-1");

		List<Salary> salarys = null;	//数据
		//判断是管理员下载还是用工单位下
		if(ConstantUtils.ADMIN == employer.getAuthority()) {	//管理员
			salarys = salaryService.listAll(month);
			
		}else if(ConstantUtils.EMPLOYER == employer.getAuthority()){	//用工单位
			salarys = salaryService.listAll2(month, employer.getId());
		}
		
		List<Recruit> recruits = new ArrayList<Recruit>();
		for(Salary s : salarys){
			//根据stuId和empId得到RecruitStudent
			Student student = s.getStudent();
			Employer employer = s.getEmployer();
			RecruitStudent rs = recruitService.queryRecruitStudent2(student.getId(), employer.getId());

			Recruit recruit = rs.getRecruit();	
			
			recruits.add(recruit);
		}
		
		excelStream = CreateExcel.getExcelInputStream(titles, salarys, recruits);
		
		return "loadSalary";
	}
	
	
	public InputStream getExcelStream() {
		return excelStream;
	}
	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}


	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}    
	
}















