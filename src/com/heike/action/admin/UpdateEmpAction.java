package com.heike.action.admin;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.service.EmployerService;
import com.heike.utils.ConstantUtils;
import com.opensymphony.xwork2.ActionSupport;

@Controller("updateEmpAction")
@Scope("prototype")
public class UpdateEmpAction extends ActionSupport implements RequestAware, SessionAware {
	private static final long serialVersionUID = 7765735654673545159L;

	@Autowired
	private EmployerService employerService;
	
	private Employer employer;
	
	private Integer empId;	//用工单位id
	
	private String name;	//用工单位名称
	private String teacher;	//负责老师
	private String mobile;	//电话号码
	private Integer totalMoney;	//申请月总金额
	private Integer postNum;	//申请的岗位数
	private String remarks;		//备注
	
	/**
	 * 管理员修改二级用户的信息：跳转到修改页面
	 * @return
	 * @throws Exception
	 */
	public String preupdateEmployer() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		employer = employerService.queryEmployer(empId);
		
		request.put("employer", employer);
		
		return "preupdateEmployer";
	}
	
	
	/**
	 * 修改用工单位信息
	 * @return
	 * @throws Exception
	 */
	public String updateEmployer() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}

		employer = employerService.queryEmployer(empId);
		
		employer.setName(name);
		employer.setTeacher(teacher);
		employer.setMobile(mobile);
		employer.setTotalMoney(totalMoney);
		employer.setPostNum(postNum);
		employer.setRemarks(remarks.trim());
		
		employerService.saveEmployer(employer);
		
		System.out.println("helloworld");
		
		return "updateEmployer";
	}
	/**
	 * 对输入的用工单位信息验证
	 */
	public void validateUpdateEmployer() {
		employer = employerService.queryEmployer(empId);
		
		if(null == name || name.trim().equals("")){
			this.addFieldError("name", "用工单位名称不能为空！");
			return;
		}
		if(null == mobile || mobile.trim().equals("")){
			this.addFieldError("mobile", "电话号码不能为空！");
			return;
		}
		if(null == teacher || teacher.trim().equals("")){
			this.addFieldError("teacher", "负责老师姓名不能为空！");
			return;
		}
		if(null == totalMoney){
			this.addFieldError("totalMoney", "月总金额不能为空！");
			return;
		}
		if(null == postNum){
			this.addFieldError("postNum", "岗位数不能为空！");
		}
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
	
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Integer getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getPostNum() {
		return postNum;
	}
	public void setPostNum(Integer postNum) {
		this.postNum = postNum;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
