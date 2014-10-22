package com.heike.action.student;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Student;
import com.heike.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 更新学生信息
 */
@Controller("updateStudentInfoAction")
@Scope("prototype")
public class UpdateStudentInfoAction extends ActionSupport implements SessionAware, RequestAware {
	private static final long serialVersionUID = 6018412115443471574L;
	
	@Autowired
	private StudentService studentService;
	
	private Student student;
	
	/**
	 * 跳转到修改学生信息页面
	 * @return
	 * @throws Exception
	 */
	public String updateStuInfo() throws Exception {
		student = (Student) session.get("student");
		if(null == student){
			return ERROR;
		}
		request.put("student", student);
		
		return "preupdate";
	}

	/**
	 * 更新学生信息
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		
		student.setIntroduce(student.getIntroduce().trim());
		studentService.save(student);

		return "save";
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

	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
}
