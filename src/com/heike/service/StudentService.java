package com.heike.service;

import java.util.List;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;

public interface StudentService {

	/**
	 * 保存用户
	 * @param student
	 * @return
	 */
	public Student save(Student student);
	
	/**
	 * 根据学生id编号查询学生
	 * @param id
	 * @return
	 */
	public Student query(Integer id);
	
	/**
	 * 根据账号和密码，验证用户的合法性
	 * @param account
	 * @param password
	 * @return
	 */
	public Student login(String account, String password);
	
	/**
	 * 学生报名工作
	 * @param student
	 * @param recruit
	 * @return
	 */
	public boolean applyJob(Student student, Recruit recruit);
	
//	/**
//	 * 根据学生学号,查看该学生报名的工作
//	 * @param id
//	 * @return
//	 */
//	public List<Recruit> listRecruit(Integer id);
	
	/**
	 * 根据Student的id获取报名信息
	 * @param id
	 * @return
	 */
	public List<RecruitStudent> listRecruitStudent(Integer id);
	
	/**
	 * 判断学生的学号是否已经存在
	 * @param number
	 * @return
	 */
	public boolean validateStuNum(String number);

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

	/**
	 * 根据学生学号查询
	 * @param number
	 * @return
	 */
	public Student query(String number);

	/**
	 * 根据学生的id删除学生
	 * @param stuId
	 */
	public void delete(Integer stuId);
	
}



