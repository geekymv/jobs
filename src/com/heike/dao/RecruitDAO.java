package com.heike.dao;

import java.util.List;

import com.heike.dto.RecruitStudent;
import com.heike.pojo.Recruit;
import com.heike.utils.PageUtil;

public interface RecruitDAO {
	
	/**
	 * 保存
	 * @param recruit
	 * @return
	 */
	public Recruit save(Recruit recruit);
	
	
	/**
	 * 通过id查询招聘信息
	 * @param id
	 * @return
	 */
	public Recruit query(Integer id);
	
	/**
	 * 分页查询招聘信息
	 * @return
	 */
	public PageUtil<Recruit> getRecruitsByPage(int page, int pageSize);
	
	/**
	 * 获得招聘信息表中的总记录数
	 * @return
	 */
	public int getRowCounts();
	
	/**
	 * 学生报名招聘
	 * @param rs
	 */
	public void applyJobt(RecruitStudent rs);
	
	/**
	 * 查看该学生是否报名了该招聘
	 * @param recId
	 * @param stuId
	 * @return true已报名, false未报名
	 */
	public boolean isApply(Integer stuId, Integer recId);
	
	/**
	 * 更新学生报名
	 */
	public void update(RecruitStudent rs); 
	
	/**
	 * 查询
	 * @param stuId 学生号
	 * @param recId 招聘信息号
	 * @return
	 */
	public RecruitStudent queryRecruitStudent(Integer stuId, Integer recId);
	
	/**
	 * 查询学生在某个用工单位通过的招聘信息
	 * @param stuId 学生号
	 * @param empId 部门号
	 * @return
	 */
	public RecruitStudent queryRecruitStudent2(Integer stuId, Integer empId);
	
	
	
	
	/**
	 * 根据Recruit的id获取报名信息
	 * @param id
	 * @return
	 */
	public List<RecruitStudent> listRecruitStudent(Integer id);


	/**
	 * 更新RecruitStudent
	 * @param rs
	 */
	public void updateRecruitStudent(RecruitStudent rs);
}
