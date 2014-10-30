package com.heike.action.employer;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.service.SalaryService;
import com.heike.utils.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 批量给学生发薪水
 */
@Controller("payoffAction")
@Scope("prototype")
public class PayoffAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 5159830980480774192L;

	@Autowired
	private SalaryService salaryService;

	private List<Integer> stuIds;	//学生的id
	private List<Integer> empIds;	//所有用工单位的id
	private List<String> worktimes;	//工作时间
	private List<Float> salarys;	//基本工资
	private List<Float> toolfees;	//工具费
	private List<Float> bonus;	//奖金
	private List<String> remarks;	//备注
	
	private String month;
	
	
	public String payoff() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		if (!DateUtil.isLast7Day()) {
			this.addActionError("当前时间不是提交薪资的时间段！您可以在每月的最后一周进行提交...");
			return INPUT;
		}
		
		if(stuIds.size() == empIds.size() && empIds.size() == worktimes.size() 
				&& worktimes.size() == salarys.size() && salarys.size() == toolfees.size() 
				&& toolfees.size() == bonus.size() && bonus.size() == remarks.size()) {
		
//			System.out.println("month = " + month);
//			System.out.println(stuIds);
//			System.out.println(empIds);
//			System.out.println("worktimes = " + worktimes);
//			System.out.println("salary = " + salarys);
//			System.out.println("toolfees = " + toolfees);
//			System.out.println("bonus = " + bonus);
//			System.out.println("remarks = " + remarks);

			salaryService.add(stuIds, empIds, worktimes, salarys, toolfees, bonus, remarks, month);
		
			return "payoff";
		}
		
		this.addActionError("输入的数据不符合要求！请仔细查看输入格式要求...");
		
		return INPUT;
	}

	public SalaryService getSalaryService() {
		return salaryService;
	}
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	
	public List<Integer> getStuIds() {
		return stuIds;
	}
	public void setStuIds(List<Integer> stuIds) {
		this.stuIds = stuIds;
	}

	public List<Integer> getEmpIds() {
		return empIds;
	}
	public void setEmpIds(List<Integer> empIds) {
		this.empIds = empIds;
	}
	public List<Float> getSalarys() {
		return salarys;
	}
	public void setSalarys(List<Float> salarys) {
		this.salarys = salarys;
	}
	public List<Float> getToolfees() {
		return toolfees;
	}
	public void setToolfees(List<Float> toolfees) {
		this.toolfees = toolfees;
	}
	public List<Float> getBonus() {
		return bonus;
	}
	public void setBonus(List<Float> bonus) {
		this.bonus = bonus;
	}
	public List<String> getRemarks() {
		return remarks;
	}
	public void setRemarks(List<String> remarks) {
		this.remarks = remarks;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Map<String, Object> getSession() {
		return session;
	}

	public List<String> getWorktimes() {
		return worktimes;
	}
	public void setWorktimes(List<String> worktimes) {
		this.worktimes = worktimes;
	}

	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
