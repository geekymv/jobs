package com.heike.action.employer;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.pojo.Salary;
import com.heike.pojo.Student;
import com.heike.service.SalaryService;
import com.heike.service.StudentService;
import com.heike.utils.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 更新薪水信息：只能在每月的最后一周发布和更改
 */
@Controller("updateSalaryAction")
@Scope("prototype")
public class UpdateSalaryAction extends ActionSupport implements RequestAware, SessionAware {
	private static final long serialVersionUID = 4276635235505419457L;

	@Autowired
	private SalaryService salaryService;

	@Autowired
	private StudentService studentService;
	
	private Integer id;	//薪水的id
	
	private Integer stuId;
	
	private String month;	//月份
	private String worktime;	//工作时间
	private float salary;	//基本工资
	private float bonus;	//奖金
	private float toolFee;	//工具费
	
	private String remarks;	//备注信息
	
	/**
	 * 跳转到修改薪水页面
	 * @return
	 * @throws Exception
	 */
	public String preupdateSalary() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		if (!DateUtil.isLast7Day()) {
			this.addActionError("当前时间不是更改的时间段！您可以在每月的最后一周进行提交和更改本月的学生补助...");
			return INPUT;
		}
		
		Salary salary = salaryService.query(id);

		/**
		 * 用工单位只可以修改本月的薪水信息
		 */
		Date currentDate = new Date();
		int year = currentDate.getYear()+1900;
		int month = currentDate.getMonth()+1;
		String m = "";
		if(month < 10){
			m = "0" + month;
		}else {
			m = "" + month;
		}
		
		String date = year + "-" + m;
		
		
		System.out.println("时间比较 = " + date.equals(salary.getMonth()));
		
		if(!date.equals(salary.getMonth())) {
			this.addActionError("只可以修改本月的补助信息！");
			return INPUT;
		}
		
		Student student = studentService.query(stuId);
		
		request.put("salary", salary);
		request.put("student", student);
		
		return "preupdateSalary";
	}
	
	/**
	 * 修改学生薪水
	 * @return
	 * @throws Exception
	 */
	public String updateSalary() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		Salary sal = salaryService.query(id);
		
		sal.setMonth(month);
		sal.setWorktime(worktime);
		sal.setSalary(salary);
		sal.setBonus(bonus);
		sal.setToolFee(toolFee);
		sal.setRemarks(remarks.trim());
		
		salaryService.update(sal);
		
		return "updateSalary";
	}
	
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}

	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}

	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}

	public float getBonus() {
		return bonus;
	}
	public void setBonus(float bonus) {
		this.bonus = bonus;
	}

	public float getToolFee() {
		return toolFee;
	}
	public void setToolFee(float toolFee) {
		this.toolFee = toolFee;
	}

	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
