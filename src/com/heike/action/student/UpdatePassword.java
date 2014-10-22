package com.heike.action.student;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Student;
import com.heike.service.StudentService;
import com.heike.utils.EncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller("updatePassword")
@Scope("prototype")
public class UpdatePassword extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 4599286304229594327L;
	
	@Autowired
	private StudentService studentService;
	
	private String password;
	private String newpassword;
	private String repassword;
	
	/**
	 * 更新密码
	 * @return
	 * @throws Exception
	 */
	public String updatePassword() throws Exception {
		Student student = (Student) session.get("student");
		if(null == student){
			return ERROR;
		}
		
		student = studentService.query(student.getId());

		if(null == password || "".equals(password.trim())){
			this.addFieldError("password", "密码不能为空！");
			return INPUT;
		}
		password = EncryptUtil.md5Encrypt(password);
		if(!student.getPassword().equals(password)){
			this.addFieldError("password", "密码不正确！");
			return INPUT;
		}
		
		if(null == newpassword || "".equals(newpassword.trim())){
			this.addFieldError("newpassword", "新密码不能为空！");
			return INPUT;
		}
		if(!newpassword.equals(repassword)){
			this.addFieldError("repassword", "密码不一致！");
			return INPUT;
		}
		
		newpassword = EncryptUtil.md5Encrypt(newpassword);
		studentService.updatePassword(newpassword, student.getId());
		
		return "updatePassword";
	}
	/**
	 * 跳转到更行密码页面
	 * @return
	 * @throws Exception
	 */
	public String preUpdatePassword() throws Exception {
		return "preUpdatePassword";
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

	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
