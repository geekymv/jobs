package com.heike.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.heike.pojo.Recruit;
import com.heike.service.RecruitService;
import com.heike.utils.PageUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 处理首页的Action
 * @author Geek_ymv
 */
@Controller("indexAction")
@Scope("prototype")
public class IndexAction extends ActionSupport implements RequestAware{
	private static final long serialVersionUID = 3354263751848273843L;

	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}
	

	private Integer id;	//招聘信息id
	
	@Autowired
	private RecruitService recruitService;
	
	private int page = 1;
	private PageUtil<Recruit> pageUtil;
	
	private Recruit recruit;
	
	/**
	 * 分页显示招聘信息
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {

		pageUtil = recruitService.getRecruits(page, 8);
		System.out.println(pageUtil.getDatas());
		
		request.put("pageUtil", pageUtil);
			
		return "list";
	}
	
	
	/**
	 * 查看招聘信息
	 * @return
	 * @throws Exception
	 */
	public String details() throws Exception {

		recruit = recruitService.get(id);

		System.out.println(recruit);
		
		request.put("recruit", recruit);
		
		return "details";
	}
	
	
	
	
	private Map<String, Object> request;
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

}
