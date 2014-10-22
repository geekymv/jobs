package com.heike.action.admin;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.service.EmployerService;
import com.heike.utils.ConstantUtils;
import com.heike.utils.EncryptUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller("adminAction")
@Scope("prototype")
public class AdminAction extends ActionSupport implements RequestAware, SessionAware {
	private static final long serialVersionUID = -5240557669011012186L;

	@Autowired
	private EmployerService employerService;
	
	private Employer employer;
	private Integer empId;
	private Integer stuId;	//学生id号
	
	private String password;
	private String repassword;
	
	private String account;	//用工单位账号
	
	
	/**
	 * 跳转到修改密码页面
	 * @return
	 * @throws Exception
	 */
	public String preUpdatePwd() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		return "preUpdatePwd";
	}
	/**
	 * 修改管理员密码
	 * @return
	 * @throws Exception
	 */
	public String updatePwd() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		if(null == password || password.trim().equals("")){
			this.addFieldError("password", "密码不能为空！");
			return "input_error";
		}
		if(!password.equals(repassword)) {
			this.addFieldError("repassword", "密码不一致！");
			return "input_error";
		}
		
		password = EncryptUtil.md5Encrypt(password);
		admin.setPassword(password);
		
		employerService.saveEmployer(admin);
		
		return "updatePwd";
	}
	
	/**
	 * 跳转到添加用工单位页面
	 * @return
	 * @throws Exception
	 */
	public String preAddEmployer() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		return "preAddEmployer";
	}
	
	/**
	 * 添加二级用户信息
	 * @return
	 * @throws Exception
	 */
	public String addEmployer() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		if(null == employer.getId()) {	//添加
			employer.setAuthority(2);	//设置二级用户权限
			
			String password = EncryptUtil.md5Encrypt(employer.getPassword());
			employer.setPassword(password);
			
			String remarks = employer.getRemarks();	//备注信息
			
			if(remarks == null || remarks.trim().equals("")){
				employer.setRemarks("无");
			}
		}
		
		employerService.saveEmployer(employer);
		
		return "addEmployer";
	}
	/**
	 * 对输入的用工单位信息合法性验证
	 */
	public void validateAddEmployer() {
		//判断用工单位账号是否已经存在
		Employer emp = employerService.queryEmployer(employer.getAccount());
		if(null != emp)	{
			this.addFieldError("account", "用工单位账号已存在！");
		}
		
		if(!repassword.equals(employer.getPassword())){
			this.addFieldError("repassword", "密码不一致！");
		}
		
	}
	
	/**
	 * 管理员列举所有的二级用户
	 * @return
	 * @throws Exception
	 */
	public String listEmployer() throws Exception {
		
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		List<Employer> employers = employerService.listEmployer(admin.getId());
		
		request.put("employers", employers);
		
		return "listEmployer";
	}
	
	/**
	 * 修改用工单位密码
	 * @return
	 * @throws Exception
	 */
	public String updateEmployerpwd() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		/**
		 * 根据用工单位账号查询
		 */
		Employer employer = employerService.queryEmployer(account);
		if(null == employer) {
			this.addFieldError("account", "账号不存在！");
			return "errInput";
		}
		if(null == password || password.trim().equals("")){
			this.addFieldError("password", "密码不能为空！");
			return "errInput";
		}
		if(!password.equals(repassword)) {
			this.addFieldError("repassword", "密码不一致！");
			return "errInput";
		}
		
		password = EncryptUtil.md5Encrypt(password);
		employer.setPassword(password);
		
		employerService.saveEmployer(employer);
		
		request.put("url", "admin-preUpdateEmppwd.do");	//跳转到修改成功页面之后跳转的页面地址
		
		return "updateEmployerpwd";
	}
	/**
	 * 跳转到修改用工单位密码页面
	 * @return
	 * @throws Exception
	 */
	public String preUpdateEmppwd() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		return "preUpdateEmppwd";
	}
	
	
	
	/**
	 * 跳转到工资下载页面
	 * @return
	 * @throws Exception
	 */
	public String preLoadSalary() throws Exception {
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		
		return "preLoadSalary";
	}

	/**
	 * 跳转到修改学生密码页面
	 * @return
	 */
	public String preupdateStupwd(){
		Employer admin = (Employer) session.get("employer");
		if(null == admin || admin.getAuthority() != ConstantUtils.ADMIN) {
			return ERROR;
		}
		return "preupdateStupwd";
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
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
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
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
}
