package com.heike.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heike.dao.RecruitDAO;
import com.heike.dto.RecruitStudent;
import com.heike.pojo.Recruit;
import com.heike.utils.PageUtil;

@Repository("recruitDAO")
public class RecruitDAOImpl implements RecruitDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public Recruit save(Recruit recruit) {

		getSession().saveOrUpdate(recruit);
		
		return recruit;
	}


	@Override
	public PageUtil<Recruit> getRecruitsByPage(int page, int pageSize) {
		
		PageUtil<Recruit> pageUtil = new PageUtil<Recruit>();
		
		int rowCounts = getRowCounts();
		
		pageUtil.getTotalPage(rowCounts, pageSize);	//计算总页数
		
		String hql = "from Recruit r order by r.endDate desc";
		
		@SuppressWarnings("unchecked")
		List<Recruit> recruits = getSession().createQuery(hql)	//
								.setFirstResult((page-1)*pageSize).setMaxResults(pageSize).list();
		
		pageUtil.setDatas(recruits);
		
		
		return pageUtil;
	}


	@Override
	public int getRowCounts() {
		long rowCounts = (Long) getSession().	//
					createQuery("select count(*) from Recruit").uniqueResult();
		
		return Integer.valueOf(String.valueOf(rowCounts));
	}


	@Override
	public Recruit query(Integer id) {
		return (Recruit) getSession().get(Recruit.class, id);
	}


	@Override
	public List<RecruitStudent> listRecruitStudent(Integer id) {
		
		Recruit recruit = (Recruit) getSession().get(Recruit.class, id);
		
		List<RecruitStudent> students = new ArrayList<RecruitStudent>();
		
		Set<RecruitStudent> recruitStudents = recruit.getRecruitStudents();
		
		students.addAll(recruitStudents);

		return students;
	}


	@Override
	public boolean isApply(Integer stuId, Integer recId) {
		
		RecruitStudent rs = this.queryRecruitStudent(stuId, recId);

		if(null != rs){
			return true;
		}
		
		return false;
	}


	@Override
	public void applyJobt(RecruitStudent rs) {
		
		getSession().saveOrUpdate(rs);
		
	}


	@Override
	public void update(RecruitStudent rs) {
		getSession().update(rs);
	}


	@Override
	public RecruitStudent queryRecruitStudent(Integer stuId, Integer recId) {

		String hql = "from RecruitStudent rs where rs.student.id=? and rs.recruit.id=?";
		
		RecruitStudent rs = (RecruitStudent) getSession().createQuery(hql)	//
				.setInteger(0, stuId).setInteger(1, recId)	//
				.uniqueResult();
		
		return rs;
	}


	@Override
	public RecruitStudent queryRecruitStudent2(Integer stuId, Integer empId) {
																							//表示通过
		String hql = "from RecruitStudent rs where rs.student.id=? and rs.employer.id=? and rs.status=1";

		RecruitStudent rs = (RecruitStudent) getSession().createQuery(hql)	//
				.setInteger(0, stuId).setInteger(1, empId)	//
				.uniqueResult();
		
		return rs;
	}


	@Override
	public void updateRecruitStudent(RecruitStudent rs) {
		
		getSession().update(rs);
	}
}




