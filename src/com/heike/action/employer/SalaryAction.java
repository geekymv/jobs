package com.heike.action.employer;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.pojo.Salary;
import com.heike.service.SalaryService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 薪水管理
 */
@Controller("salaryAction")
@Scope("prototype")
public class SalaryAction extends ActionSupport implements RequestAware, SessionAware {
	private static final long serialVersionUID = -4962451778266969984L;
	
	@Autowired
	private SalaryService salaryService;
	
	private Employer employer;
	
	private Salary salary;

	/**
	 * 列出学生薪水
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		employer = (Employer) session.get("employer");
		if(null == employer) {
			return ERROR;
		}
		
		List<Salary> salarys = salaryService.list(employer.getId());
		
		System.out.println(salarys);
		
		request.put("salarys", salarys);
		
		return "listSalary";
	}
	
//	/**
//	 * 修改学生的薪水：只可以当天修改
//	 * @return
//	 * @throws Exception
//	 */
//	public String update() throws Exception {
//		
//		return "update";
//	}

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
	
	
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public Salary getSalary() {
		return salary;
	}
	public void setSalary(Salary salary) {
		this.salary = salary;
	}

	

}
