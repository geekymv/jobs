package com.heike.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.pojo.Student;
import com.heike.utils.ConstantUtils;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 登录成功处理类，用来区分用户权限
 * @author Geek_ymv
 */
@Controller("loginSuccessAction")
@Scope("prototype")
public class LoginSuccessAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 274552440422174537L;

	/**
	 * 登录成功
	 * @return
	 * @throws Exception
	 */
	public String success() throws Exception {

		Object user = session.get("user");
		
		if(null == user) {
			return ERROR;
		}

		if(user instanceof Student){	//学生
			Student student = (Student)user;
			
			session.put("student", student);
			
			System.out.println("student....");
			
			return "student";
			
		}else if (user instanceof Employer){
			
			Employer employer = (Employer)user;
			
			session.put("employer", employer);
			
			System.out.println("employer....");
			
			Integer authority = employer.getAuthority();
			
			if(ConstantUtils.ADMIN == authority){	//admin
				return "admin";
			
			}else if (ConstantUtils.EMPLOYER == authority){	//学院或社团
				
				System.out.println("111");
				
				return "employer";
			}
		}
		
		return ERROR;
	}

	
	private Map<String, Object> session;
	
	@Override
	public void setSession(Map<String, Object> session) {
		
		System.out.println("session = " + session.getClass());
		
		this.session = session;
	}

}
