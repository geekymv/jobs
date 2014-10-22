package com.heike.action.employer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;
import com.heike.service.EmployerService;
import com.heike.service.RecruitService;
import com.heike.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生管理
 */
@Controller("studentManagerAction")
@Scope("prototype")
public class StudentManagerAction extends ActionSupport implements SessionAware, RequestAware {
	private static final long serialVersionUID = -4660955332666540649L;
	
	@Autowired
	private EmployerService employerService;
	
	@Autowired
	private RecruitService recruitService;
	
	@Autowired
	private StudentService studentService;
	
	private Integer stuId;	//学生id号
	
	/**
	 * 查看学生资料
	 * @return
	 * @throws Exception
	 */
	public String showStudentInfo() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		Student student = studentService.query(stuId);
		
		request.put("student", student);
		
		return "showStudentInfo";
	}
	
	/**
	 * 学生列表
	 * @return
	 * @throws Exception
	 */
	public String listStudent() throws Exception {
		
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		List<Student> students = employerService.listStudent(employer.getId());
		request.put("students", students);
		
		List<String> postNames = new ArrayList<String>();
		for(Student student : students){
			
			RecruitStudent rs = recruitService.queryRecruitStudent2(student.getId(), employer.getId());
			Recruit recruit = rs.getRecruit();
			
			postNames.add(recruit.getPostName());
		}
		
		request.put("postNames", postNames);
		
		return "listStudent";
	}
	
	/**
	 * 解雇学生
	 * @return
	 */
	public String deleteStudent() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		/**
		 * 解雇学生
		 */
		employerService.deleteStudent(stuId, employer.getId());
		
		return "deleteStudent";
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

	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	
}
