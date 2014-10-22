package com.heike.action.admin;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.pojo.Student;
import com.heike.service.StudentService;
import com.heike.utils.ConstantUtils;
import com.heike.utils.EncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 修改学生密码
 */
@Controller("updateStudentPasswordAction")
@Scope("prototype")
public class UpdateStudentPasswordAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 5935119839281359920L;

	@Autowired
	private StudentService studentService;
	
	private String number;	//学生学号
	
	private String password;	//新密码
	private String repassword;	//密码确认
	
	@Override
	public String execute() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		Student student = studentService.query(number);
		if(null == student){
			this.addFieldError("number", "该学生不存在！");
			return INPUT;
		}
		if(null == password || password.trim().equals("")){
			this.addFieldError("password", "密码不能为空！");
			return INPUT;
		}
		if(!password.equals(repassword)){
			this.addFieldError("repassword", "两次密码输入不一致！");	
			return INPUT;
		}
		password = EncryptUtil.md5Encrypt(password);	//md5加密
		student.setPassword(password);
		studentService.save(student);
		
		return SUCCESS;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
