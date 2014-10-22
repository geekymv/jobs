package com.heike.action.employer;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.service.RecruitService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 更新已发布的招聘信息
 */
@Controller("updateRecruitAction")
@Scope("prototype")
public class UpdateRecruitAction extends ActionSupport implements RequestAware,SessionAware {
	private static final long serialVersionUID = -5060881855548279211L;

	@Autowired
	private RecruitService recruitService;
	
	private Integer id;	//招聘信息的id

	private String title;
	private String postName;	//招聘岗位名
	private Integer postNum;	//招聘岗位数
	private String salary;	//薪资待遇
	private String context;	//工作要求
	private Date endDate;	//报名截止时间
	private String remarks;	//备注
	
	/**
	 * 跳转到修改招聘信息页面
	 * @return
	 */
	public String preUpdate() {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		
		Recruit recruit = recruitService.get(id);
		
		request.put("recruit", recruit);
		
		return "preUpdate";
	}
	
	/**
	 * 修改招聘信息
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		Employer employer = (Employer) session.get("employer");
		if(null == employer){
			return ERROR;
		}
		
		Recruit recruit = recruitService.get(id);
		
		recruit.setTitle(title);
		recruit.setPostName(postName);
		recruit.setPostNum(postNum);
		recruit.setSalary(salary);
		recruit.setContext(context.trim());
		recruit.setEndDate(endDate);
		recruit.setRemarks(remarks.trim());

		recruitService.save(recruit);
		
		return "update";
	} 
	
	@Override
	public void validate() {
		//空实现
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
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}

	public Integer getPostNum() {
		return postNum;
	}
	public void setPostNum(Integer postNum) {
		this.postNum = postNum;
	}

	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}

	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


}
