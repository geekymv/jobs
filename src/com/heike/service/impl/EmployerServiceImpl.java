package com.heike.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heike.dao.EmployerDAO;
import com.heike.dto.RecruitStudent;
import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;
import com.heike.service.EmployerService;
import com.heike.service.RecruitService;
import com.heike.utils.PageUtil;

@Service("employerService")
public class EmployerServiceImpl implements EmployerService{

	@Autowired
	private EmployerDAO employerDAO;
	
	@Autowired
	private RecruitService recruitService;
	
	@Override
	public Employer login(String account, String password) {
		return employerDAO.query(account, password);
	}

	@Override
	public List<Student> listStudent(Integer id) {
		return employerDAO.listStudent(id);
	}

	@Override
	public PageUtil<Recruit> getRecruitsByPage(Integer id, int page,
			int pageSize) {
		return employerDAO.getRecruitsByPage(id, page, pageSize);
	}

	@Override
	public void saveEmployer(Employer employer) {
		employerDAO.save(employer);
	}

	@Override
	public List<Employer> listEmployer(Integer id) {
		
		return employerDAO.listEmployer(id);
	}

	@Override
	public Employer queryEmployer(Integer id) {
		
		return employerDAO.query(id);
	}

	@Override
	public Employer queryEmployer(String account) {
		
		return employerDAO.query(account);
	}

	@Override
	public void deleteStudent(Integer stuId, Integer empId) {
		
		employerDAO.deleteStudent(stuId, empId);
		
		//修改RecruitStudent中status为2，表示该学生已经对应的部门辞职
		RecruitStudent rs = recruitService.queryRecruitStudent2(stuId, empId);
		rs.setStatus(2);
		
		recruitService.updateRecruitStudent(rs);
	}

}
