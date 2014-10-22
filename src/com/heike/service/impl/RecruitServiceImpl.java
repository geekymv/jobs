package com.heike.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heike.dao.EmployerDAO;
import com.heike.dao.RecruitDAO;
import com.heike.dao.StudentDAO;
import com.heike.dto.RecruitStudent;
import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;
import com.heike.service.RecruitService;
import com.heike.utils.PageUtil;

@Service("recruitService")
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDAO recruitDAO;
	
	@Autowired
	private EmployerDAO employerDAO;

	@Autowired
	private StudentDAO studentDAO;
	
	@Override
	public Recruit save(Recruit recruit) {
		
		return recruitDAO.save(recruit);
	}

	
	@Override
	public PageUtil<Recruit> getRecruits(int page, int pageSize) {
		
		return recruitDAO.getRecruitsByPage(page, pageSize);
	}


	@Override
	public Recruit get(Integer id) {
		
		return recruitDAO.query(id);
	}


	@Override
	public List<RecruitStudent> listRecruitStudent(Integer id) {
		return recruitDAO.listRecruitStudent(id);
	}


	@Override
	public boolean isApply(Integer stuId, Integer recId) {
	
		return recruitDAO.isApply(stuId, recId);
	}

	@Override
	public void examineRecruit(Integer stuId, Integer recId, Integer status, Integer empId) {
		
		Employer employer = employerDAO.query(empId);
		Student student = studentDAO.query(stuId);
		
		if(1 == status){	//审核通过
			employer.getStudents().add(student);
//			student.getEmployers().add(employer);
			
			employerDAO.save(employer);
//			studentDAO.save(student);
		}
		
		RecruitStudent rs = recruitDAO.queryRecruitStudent(stuId, recId);
		
		rs.setStatus(status);
		rs.setEmployer(employer);
		
		recruitDAO.update(rs);
	}


	@Override
	public RecruitStudent queryRecruitStudent(Integer stuId, Integer recId) {

		return recruitDAO.queryRecruitStudent(stuId, recId);
	}


	@Override
	public RecruitStudent queryRecruitStudent2(Integer stuId, Integer empId) {
		
		return recruitDAO.queryRecruitStudent2(stuId, empId);
	}


	@Override
	public void updateRecruitStudent(RecruitStudent rs) {
		recruitDAO.updateRecruitStudent(rs);
	}
	
	

}















