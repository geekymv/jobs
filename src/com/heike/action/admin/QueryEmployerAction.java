package com.heike.action.admin;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Employer;
import com.heike.service.EmployerService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 查询用工单位信息
 * @author Geek_ymv
 */
@Controller("queryEmployerAction")
@Scope("prototype")
public class QueryEmployerAction extends ActionSupport implements RequestAware{
	private static final long serialVersionUID = -3826259591146804619L;

	@Autowired
	private EmployerService employerService;
	
	//用工单位账号
	private String account;
	private Integer id;
	
	/**
	 * 根据用工单位账号查询用工单位信息
	 * @return
	 * @throws Exception
	 */
	public String queryEmployer() throws Exception {
		
		Employer employer = employerService.queryEmployer(account);
		
		if(null == employer) {
			
			request.put("url", "admin-listEmployer.do");
			
			return ERROR;
		}
		
		id = employer.getId();

		return SUCCESS;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}





