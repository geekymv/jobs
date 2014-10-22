package com.heike.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heike.dao.EmployerDAO;
import com.heike.dao.SalaryDAO;
import com.heike.dao.StudentDAO;
import com.heike.pojo.Employer;
import com.heike.pojo.Salary;
import com.heike.pojo.Student;
import com.heike.service.SalaryService;

@Service("salaryService")
public class SalaryServiceImpl implements SalaryService {

	@Autowired
	private SalaryDAO salaryDAO;
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private EmployerDAO employerDAO;
	
	@Override
	public void add(List<Integer> stuIds, List<Integer> empIds, List<String> worktimes,
			List<Float> salarys, List<Float> toolfees, List<Float> bonus,
			List<String> remarks, String month) {
		
		for(int i = 0; i < stuIds.size(); i++) {
			
			Integer stuId = stuIds.get(i);
			Integer empId = empIds.get(i);
			
			String worktime = worktimes.get(i);
			float salary = salarys.get(i);
			float toolFee = toolfees.get(i);
			float bonu = bonus.get(i);
			String remark = remarks.get(i);
			
			Employer employer = employerDAO.query(empId);
			Student student = studentDAO.query(stuId);
			
			Salary s = new Salary(new Date(), month, worktime, salary, bonu, toolFee, employer, student, remark);
			
			salaryDAO.save(s);
		}
	}
	
	@Override
	public List<Salary> list(Integer empId) {
		return salaryDAO.list(empId);
	}

	@Override
	public List<Salary> listAll(String month) {
		return salaryDAO.listAll(month);
	}

	@Override
	public List<Salary> listAll2(String month, Integer empId) {
		
		return salaryDAO.listAll2(month, empId);
	}

	@Override
	public Salary query(Integer id) {
		
		return salaryDAO.query(id);
	}

	@Override
	public void update(Salary sal) {
		
		salaryDAO.update(sal);
	}

}
