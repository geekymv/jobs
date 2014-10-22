package com.heike.dao;

import java.util.List;

import com.heike.pojo.Salary;

public interface SalaryDAO {
	
	/**
	 * 保存
	 * @param salary
	 */
	public void save(Salary salary);
	
	/**
	 * 根据部门id列出该部门学生的薪水
	 * @param empId
	 * @return
	 */
	public List<Salary> list(Integer empId);
	
	
	/**
	 * 管理员根据月份得到所有学生的工资表
	 * @param month
	 * @return
	 */
	public List<Salary> listAll(String month);

	/**
	 * 用工单位根据月份得到所有学生的工资表
	 * @param month
	 * @return
	 */
	public List<Salary> listAll2(String month, Integer empId);

	/**
	 * 根据薪水id查询薪水信息
	 * @param id
	 * @return
	 */
	public Salary query(Integer id);

	/**
	 * 更新薪水信息
	 * @param sal
	 */
	public void update(Salary sal);
	
}
