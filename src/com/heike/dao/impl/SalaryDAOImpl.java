package com.heike.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heike.dao.SalaryDAO;
import com.heike.pojo.Salary;

@Repository("salaryDAO")
public class SalaryDAOImpl implements SalaryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void save(Salary salary) {
		getSession().save(salary);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Salary> list(Integer empId) {
		
		return (List<Salary>)getSession()
				.createQuery("from Salary s where s.employer.id=? order by s.month desc")	//
				.setInteger(0, empId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Salary> listAll(String month) {
		
		String hql = "from Salary s where s.month=? order by s.student.id";	//order by s.employer.id
		
		return (List<Salary>)getSession().createQuery(hql).setString(0, month).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Salary> listAll2(String month, Integer empId) {
		
		String hql = "from Salary s where s.month=? and s.employer.id=?";
		
		return (List<Salary>)getSession().createQuery(hql).setString(0, month).setInteger(1, empId).list();
	}

	@Override
	public Salary query(Integer id) {
		
		return (Salary) getSession().get(Salary.class, id);
	}

	@Override
	public void update(Salary sal) {
		
		getSession().update(sal);
	}

}
