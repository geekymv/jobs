package com.heike.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Student;
import com.heike.service.StudentService;
import com.heike.utils.EncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生注册
 */
@Controller("userRegisterAction")
@Scope("prototype")
public class UserRegisterAction extends ActionSupport {
	private static final long serialVersionUID = -2443614866725326145L;

	@Autowired
	private StudentService studentService;
	
	private String number;	//学号
	private String password;
	private String repassword;
	private String name;
	private String gender;
	private String college;	//学院
	private String profession;	//专业
	private String mobile;
	private String introduce;	//自我介绍

	@Override
	public String execute() throws Exception {
		
		password = EncryptUtil.md5Encrypt(password);
		
		Student student = new Student(number, password, name, gender, college, profession, mobile, introduce);
		student.setRegTime(new Date());
		
		studentService.save(student);
		
		return SUCCESS;
	}
	
	@Override
	public void validate() {
		if(studentService.validateStuNum(number)){
			this.addFieldError("number", "该学号已经被注册！");
		}
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

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}

	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
}
