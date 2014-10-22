package com.heike.action;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.pojo.Student;
import com.heike.service.EmployerService;
import com.heike.service.StudentService;
import com.heike.utils.EncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 837098305141530374L;

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private EmployerService employerService;
	
	private String account;
	private String password;
	private String rememberMe;	//记住我
	
	
	private String repassword;
	private Student student;
	
	private Employer employer;
	
	
	/**
	 * 用户登录验证
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
	
//		System.out.println(rememberMe);
		
		//对密码使用md5加密
		password = EncryptUtil.md5Encrypt(password);
		
		employer = employerService.login(account, password);
		
		if(null != employer){
			session.put("user", employer);
			
			return "loginSuccess";
		}
		
		student = studentService.login(account, password);
		
		if(null != student){
			session.put("user", student);
			
			return "loginSuccess";
		}
		
		this.addActionError("用户名或密码错误！");
		return INPUT;
	}
	
	/**
	 * 用户退出
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception {
		
		if(session instanceof SessionMap){

			SessionMap<String, Object> sessionMap = (SessionMap<String, Object>)session;
			
			sessionMap.invalidate();
			
		}

		return "logout";
		
	}
	
	
//	/**
//	 * 用户注册
//	 * @return
//	 * @throws Exception
//	 */
//	public String register() throws Exception {
//		
//		student.setRegTime(new Date());	//设置注册时间
//		String password = student.getPassword();
//		
//		//对密码使用md5加密
//		password = EncryptUtil.md5Encrypt(password);
//		student.setPassword(password);
//		
//		studentService.save(student);
//		
//		return "registerSuccess";
//	}
	
	
	private Map<String, Object> session;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setRememberMe(String rememberMe) {
		this.rememberMe = rememberMe;
	}
	public String getRememberMe() {
		return rememberMe;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Student getStudent() {
		return student;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	public Employer getEmployer() {
		return employer;
	}

}






