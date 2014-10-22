package com.heike.dto;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.heike.pojo.Employer;
import com.heike.pojo.Recruit;
import com.heike.pojo.Student;

/**
 * Student和Recruit之间的辅助实体类
 * @author Geek_ymv
 */
@Entity
@Table(name="t_recruit_student")
public class RecruitStudent {
	
	
	private Integer id;
	private Integer status;	//0表示在审核，1表示审核通过，-1表示审核未通过，2表示该学生已经对应的部门辞职
	private Date applyDate;	//报名时间
	
	private Recruit recruit;
	private Student student;
	
	private Employer employer;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	@ManyToOne
	@JoinColumn(name="rec_id", nullable=true)
	public Recruit getRecruit() {
		return recruit;
	}
	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}
	
	@ManyToOne
	@JoinColumn(name="stu_id", nullable=true)
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@ManyToOne
	@JoinColumn(name="emp_id", nullable=true)
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	
	
	
}















