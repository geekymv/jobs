package com.heike.service;

import java.util.List;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Recruit;
import com.heike.pojo.Salary;
import com.heike.pojo.Student;
import com.heike.utils.PageUtil;

public interface RecruitService {
	
	/**
	 * 添加招聘信息
	 * @param recruit
	 * @return
	 */
	public Recruit save(Recruit recruit);
	
	/**
	 * 通过id查询招聘信息
	 * @param id
	 * @return
	 */
	public Recruit get(Integer id);
	
	/**
	 * 分页查询招聘信息
	 * @param page	页号
	 * @param pageSize	每页显示的记录数
	 * @return
	 */
	public PageUtil<Recruit> getRecruits(int page, int pageSize);
	
	/**
	 * 根据Recruit的id获取报名信息
	 * @param id
	 * @return
	 */
	public List<RecruitStudent> listRecruitStudent(Integer id);
	
	/**
	 * 查看该学生是否报名了该招聘
	 * @param recId
	 * @param stuId
	 * @return true已报名, false未报名
	 */
	public boolean isApply(Integer stuId, Integer recId);
	
	
	/**
	 * 查询学生在某个用工单位通过的招聘信息
	 * @param stuId
	 * @param recId
	 * @return
	 */
	public RecruitStudent queryRecruitStudent(Integer stuId, Integer recId);
	
	/**
	 * 查询学生在某个用工单位通过的招聘信息，在同一个用工单位同时只能有一个招聘信息的status=1。
	 * @param stuId 学生号
	 * @param empId 部门号
	 * @return
	 */
	public RecruitStudent queryRecruitStudent2(Integer stuId, Integer empId);
	
	/**
	 * 审核学生招聘是否通过
	 * @param rs
	 */
	public void examineRecruit(Integer stuId, Integer recId, Integer status, Integer empId);

	/**
	 * 更新RecruitStudent
	 * @param rs
	 */
	public void updateRecruitStudent(RecruitStudent rs);
	

}
