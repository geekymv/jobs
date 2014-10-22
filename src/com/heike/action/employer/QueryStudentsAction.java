package com.heike.action.employer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Employer;
import com.heike.pojo.Student;
import com.heike.service.RecruitService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("queryStudentsAction")
@Scope("prototype")
public class QueryStudentsAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = -6433575204294237287L;

	@Autowired
	private RecruitService recruitService;

	// 招聘信息的id
	private Integer id;

	private List<Student> students;
	private List<Integer> status;

	private Integer stuId;	//学生的id
	private Integer examine;	//学生报名信息状态：0表示在审核，1表示审核通过，-1表示审核未通过
	
	/**
	 * 查看某条招聘信息所有报名的学生
	 */
	@Override
	public String execute() throws Exception {
		students = new ArrayList<Student>();
		status = new ArrayList<Integer>();
		
		List<RecruitStudent> recruitStudents = recruitService.listRecruitStudent(id);
		
		for(Iterator<RecruitStudent> iter = recruitStudents.iterator(); iter.hasNext(); ){
			RecruitStudent rs = iter.next();
			
			Student student = rs.getStudent();
			Integer statu = rs.getStatus();

			students.add(student);
			status.add(statu);
		}

		return SUCCESS;
	}

	/**
	 * Employer管理，让学生能否得到工作
	 * @return
	 * @throws Exception
	 */
	public String exexamineStudent() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
									//学生id	//招聘信息id		//用工单位id
		recruitService.examineRecruit(stuId, id, examine, employer.getId());
		
		return SUCCESS;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	public List<Integer> getStatus() {
		return status;
	}
	public void setStatus(List<Integer> status) {
		this.status = status;
	}

	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public Integer getExamine() {
		return examine;
	}
	public void setExamine(Integer examine) {
		this.examine = examine;
	}

	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
