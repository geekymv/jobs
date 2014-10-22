package com.heike.dao;

import java.util.List;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;

public interface StudentDAO {
	
	/**
	 * 添加或更新用户
	 * @param student
	 * @return
	 */
	public Student save(Student student);

	/**
	 * 根据学号和密码查询学生
	 * @param number
	 * @param password
	 * @return
	 */
	public Student query(String number, String password);

	/**
	 * 根据学生学号查询
	 * @param number
	 * @return
	 */
	public Student query(String number);
	
	/**
	 * 根据id查询学生信息
	 * @param id
	 * @return
	 */
	public Student query(Integer id);
	
	/**
	 * 根据Student的id获取报名信息
	 * @param id
	 * @return
	 */
	public List<RecruitStudent> listRecruitStudent(Integer id);

	/**
	 * 根据学生id查看学生通过的工作
	 * @param id
	 * @return
	 */
	public List<RecruitStudent> listApproveJob(Integer id);

	/**
	 * 更新密码
	 * @param newpassword
	 * @param id
	 */
	public void updatePassword(String newpassword, Integer id);
	
}
