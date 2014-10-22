package com.heike.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heike.dao.EmployerDAO;
import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;
import com.heike.utils.PageUtil;

@Repository("employerDAO")
public class EmployerDAOImpl implements EmployerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public Employer save(Employer employer) {
		
		getSession().saveOrUpdate(employer);

		return employer;
	}

	@Override
	public List<Employer> queryAll() {
		
		@SuppressWarnings("unchecked")
		List<Employer> employers = getSession().createQuery("from Employer").list();
		
		return employers;
	}


	@Override
	public Employer query(String number, String password) {
		
		String hql = "from Employer e where e.account = ? and e.password = ? ";
		
		return (Employer) getSession().createQuery(hql).
			setString(0, number).setString(1, password).uniqueResult();
		
	}

	@Override
	public Employer query(Integer empId) {
	
		Employer employer = (Employer) getSession().get(Employer.class, empId);
		
		return employer;
	}

	@Override
	public List<Student> listStudent(Integer id) {
		
		Employer employer = (Employer) getSession().get(Employer.class, id);
		
		List<Student> students = new ArrayList<Student>();
		
		students.addAll(employer.getStudents());
		
		return students;
	}


	@Override
	public PageUtil<Recruit> getRecruitsByPage(Integer id, int page,
			int pageSize) {
		
		PageUtil<Recruit> pageUtil = new PageUtil<Recruit>();
		
		int rowCounts = getRowCounts(id);
		
		pageUtil.getTotalPage(rowCounts, pageSize);	//计算总页数
		
		String hql = "from Recruit r where r.employer.id = ? order by r.endDate desc";
		
		@SuppressWarnings("unchecked")
		List<Recruit> recruits = getSession().createQuery(hql)	//
								.setInteger(0, id)	//
								.setFirstResult((page-1)*pageSize).setMaxResults(pageSize).list();
		
		pageUtil.setDatas(recruits);
		
		
		return pageUtil;
		
	}


	private int getRowCounts(Integer id) {
		long rowCounts = (Long) getSession().	//
				createQuery("select count(*) from Recruit r where r.employer.id = ?")	//
				.setInteger(0, id).uniqueResult();
	
		return Integer.valueOf(String.valueOf(rowCounts));
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Employer> listEmployer(Integer id) {

		List<Employer> employers = getSession()
				.createQuery("from Employer emp where emp.authority=2 and emp.id!=?")
				.setInteger(0, id).list();
		
		return employers;
	}


	@Override
	public Employer query(String account) {
		
		String hql = "from Employer emp where emp.account=?";
		
		Employer employer = (Employer) getSession().createQuery(hql)
					.setString(0, account).uniqueResult();
		
		return employer;
	}


	@Override
	public void deleteStudent(Integer stuId, Integer empId) {

		String sql = "delete from t_employer_student where stu_id=? and emp_id=?";
		
		getSession().createSQLQuery(sql)
			.setInteger(0, stuId).setInteger(1, empId).executeUpdate();
	}
}
