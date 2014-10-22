package com.heike.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("validateUser")
@Scope("prototype")
public class ValidateUser extends ActionSupport {
	private static final long serialVersionUID = -5431974610995039218L;

	@Autowired
	private StudentService studentService;
	
	private InputStream inputStream;
	
	private String number;
	
	/**
	 * 验证学生的学号是否存在
	 * @return
	 * @throws Exception
	 */
	public String validateNum() throws Exception {

		if(studentService.validateStuNum(number)){	//该学号已经存在
			inputStream = new ByteArrayInputStream("fail".getBytes("UTF-8"));
		}else {
			inputStream = new ByteArrayInputStream("success".getBytes("UTF-8"));
		}
		
		return "ajax-success";
	}

	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
}
