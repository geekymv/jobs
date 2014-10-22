package com.heike.action.employer;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.service.EmployerService;
import com.heike.utils.EncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller("updateEmployerAction")
@Scope("prototype")
public class UpdateEmployerAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 3883596882240389686L;
	
	@Autowired
	private EmployerService employerService;
	
	private Employer employer;
	
	private Integer empId;
	
	private String name;	//用工单位名称
	private String teacher;	//负责老师
	private String mobile;	//电话号码
	private String remarks;		//备注
	
	private String password;
	private String newpassword;
	private String repassword;
	
	/**
	 * 跳转到修改密码的页面
	 * @return
	 * @throws Exception
	 */
	public String preUpdatePwd() throws Exception {
		return "preUpdatePwd";
	}
	/**
	 * 修改密码
	 */
	public String updatePwd() throws Exception {
		
		Employer emp = (Employer) session.get("employer");
		if(null == emp) {
			return ERROR;
		}
		
		employer = employerService.queryEmployer(emp.getId());
		
		employer.setPassword(EncryptUtil.md5Encrypt(newpassword));
		
		employerService.saveEmployer(employer);
		
		return "updatePwd";
	}
	
	/**
	 * 对输入的密码进行验证
	 */
	public void validateUpdatePwd() {
		Employer emp = (Employer) session.get("employer");

		employer = employerService.queryEmployer(emp.getId());
		
		System.out.println("--------------------------------------------");
		
		if(null == password || "".equals(password.trim())){
			this.addFieldError("password", "密码不能为空！");
			return;
		}
		
		password = EncryptUtil.md5Encrypt(password);
		if(!employer.getPassword().equals(password)){
			this.addFieldError("password", "密码不正确！");
			return;
		}
		
		if(null == newpassword || "".equals(newpassword.trim())){
			this.addFieldError("newpassword", "新密码不能为空！");
			return;
		}
		if(!newpassword.equals(repassword)){
			this.addFieldError("repassword", "密码不一致！");
		}
		
	}
	
	
	
	/**
	 * 修改个人信息
	 * @return
	 * @throws Exception
	 */
	public String updateEmployer() throws Exception {
		Employer emp = (Employer) session.get("employer");
		if(null == emp) {
			return ERROR;
		}

		Employer employer = employerService.queryEmployer(empId);
		employer.setName(name);
		employer.setTeacher(teacher);
		employer.setMobile(mobile);
		employer.setRemarks(remarks);
		
		employerService.saveEmployer(employer);
		
		session.put("employer", employer);
		
		return "saveEmp";
	}
	
	
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	
}
