package com.heike.action.student;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;
import com.heike.service.RecruitService;
import com.heike.service.StudentService;
import com.heike.utils.PageUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller("studentAction")
@Scope("prototype")
public class StudentAction extends ActionSupport implements SessionAware, RequestAware{
	private static final long serialVersionUID = -9121763308525676529L;
	
	@Autowired
	private RecruitService recruitService;
	@Autowired
	private StudentService studentService;
	
	private Integer id;	//招聘信息id
	
	private int page = 1;
	private PageUtil<Recruit> pageUtil;
	
	private Recruit recruit;
	private Student student;
	
	/**
	 * 分页显示招聘信息
	 * @return
	 * @throws Exception
	 */
	public String listRecruit() throws Exception {
		student = (Student) session.get("student");
		if(null == student){
			return ERROR;
		}
	
		pageUtil = recruitService.getRecruits(page, 10);
		System.out.println(pageUtil.getDatas());
		
		request.put("pageUtil", pageUtil);
		
		return "listRecruit";
	}

	/**
	 * 查看学生信息
	 * @return
	 * @throws Exception
	 */
	public String stuInfo() throws Exception {
		student = (Student) session.get("student");
		if(null == student){
			return ERROR;
		}
		
		student = studentService.query(student.getId());
		session.put("student", student);	//更新session
		
		request.put("student", student);

		return "stuInfo";
	}

	/**
	 * 查看招聘信息
	 * @return
	 * @throws Exception
	 */
	public String details() throws Exception {
		student = (Student) session.get("student");
		if(null == student){
			return ERROR;
		}

		recruit = recruitService.get(id);
		request.put("recruit", recruit);
		
		return "details";
	}
	
	/**
	 * 学生报名工作
	 * @return
	 * @throws Exception
	 */
	public String applyJob() throws Exception {
		student = (Student) session.get("student");
		if(null == student) {
			return ERROR;
		}
		
		recruit = recruitService.get(recruit.getId());
	
		//判断报名是否已经截止
		Date endDate = recruit.getEndDate();	//截止日期
		
		System.out.println("截止日期 = " + endDate);
		
		Date nowDate = new Date();
		
		System.out.println("当前日期 = " + nowDate);
		
		if(endDate.getTime() - nowDate.getTime() < 0){
			
			request.put("message", "报名已经截止了！");
			request.put("page", "招聘列表页面");
			request.put("url", "stu-listRecruit.do");	//-------------
			
			return "result";
		}
		
		
		
		boolean isApply = recruitService.isApply(student.getId(), recruit.getId());
		
		//判断该生是否已经申请了该工作
		if(isApply){
			request.put("message", "你已经报过名了！");
			request.put("page", "招聘列表页面");
			request.put("url", "stu-listRecruit.do");	//-------------
			
			return "result";
		}	

		//同一个学生在同一个单位只能应聘一个岗位
		List<RecruitStudent> recruitStudents = studentService.listRecruitStudent(student.getId());
		
		
//		List<Recruit> recruits = new ArrayList<Recruit>();
		for(RecruitStudent rs : recruitStudents) {
			Recruit r = rs.getRecruit();
			
			boolean flag = recruit.getEmployer().getId() == r.getEmployer().getId();
		
			if(flag && rs.getStatus() == 1){	//在该单位通过招聘
				request.put("message", "在同一个单位你只能报名一个岗位！");
				request.put("page", "招聘列表页面");
				request.put("url", "stu-listRecruit.do");	//-------------
				
				return "result";
			}
			//在该单位申请的招聘还在审核中
			else if(flag && rs.getStatus() == 0){	//审核中
				request.put("message", "你之前在该单位的报名等待审核中....");
				request.put("page", "招聘列表页面");
				request.put("url", "stu-listRecruit.do");	//-------------
				
				return "result";
			}
		}

		studentService.applyJob(student, recruit);
		
		request.put("message", "报名成功！");
		request.put("page", "报名记录页面");
		request.put("url", "stu-listJob.do");	//操作提示--要跳转的页面地址
		
		return "applyJob";
	}
	
	/**
	 * 查看该学生报名哪些工作
	 * @return
	 * @throws Exception
	 */
	public String listJob() throws Exception {
		student = (Student) session.get("student");
		if(null == student) {
			return ERROR;
		}
		
		//报名的招聘信息集合
		List<RecruitStudent> recruitStudents = studentService.listRecruitStudent(student.getId());
		
		request.put("recruitStudents", recruitStudents);
		
		return "listJob";
	}

	/**
	 * 查看审核通过的工作
	 * @return
	 */
	public String approveJob() throws Exception {
		student = (Student) session.get("student");
		if(null == student) {
			return ERROR;
		}
		List<RecruitStudent> recruitStudents = studentService.listApproveJob(student.getId());
		
		//工作状态RecruitStudent中status=2
		List<String> status = new ArrayList<String>();
		
		for(RecruitStudent rs : recruitStudents) {
			
//			Employer employer = rs.getEmployer();
//			
//			Set<Student> students = employer.getStudents();
//			
//			if(students.contains(student)){
//				status.add("在职");
//			}else {
//				status.add("离职");
//			}
			
			if(rs.getStatus() == 2) {
				status.add("离职");
			}else if(rs.getStatus() == 1) {
				status.add("在职");
			}
			
		}
		
		request.put("recruitStudents", recruitStudents);
		request.put("status", status);
		
		
		return "approve";
	} 
	
	private Map<String, Object> session;
	private Map<String, Object> request;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public PageUtil<Recruit> getPageUtil() {
		return pageUtil;
	}
	public void setPageUtil(PageUtil<Recruit> pageUtil) {
		this.pageUtil = pageUtil;
	}
	
	public Recruit getRecruit() {
		return recruit;
	}
	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
}
