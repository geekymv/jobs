package com.heike.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 薪水类
 * @author Geek_ymv
 */
@Entity
@Table(name="t_salary")
public class Salary {
	
	private Integer id;
	private Date date;
	private String month;	//月份
	private String worktime;	//工作时间
	private float salary;	//基本工资
	private float bonus;	//奖金
	private float toolFee;	//工具费

	private Employer employer;
	private Student student;	//多对一的关联关系，Student是一的一方
	
	private String remarks;		//备注
	
	public Salary() {
	}
	
	
	public Salary(Date date, String month, String worktime, float salary, float bonus,
			float toolFee, Employer employer, Student student, String remarks) {
		this.date = date;
		this.month = month;
		this.worktime = worktime;
		this.salary = salary;
		this.bonus = bonus;
		this.toolFee = toolFee;
		this.employer = employer;
		this.student = student;
		this.remarks = remarks;
	}


	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	
	@ManyToOne
	@JoinColumn(name="stu_id")
	public Student getStudent() {
		return student;
	}
	@ManyToOne
	@JoinColumn(name="emp_id")
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	public Date getDate() {
		return date;
	}
	public String getMonth() {
		return month;
	}
	@Column(columnDefinition="float default 0")
	public float getSalary() {
		return salary;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@Column(columnDefinition="float default 0")
	public float getBonus() {
		return bonus;
	}
	public void setBonus(float bonus) {
		this.bonus = bonus;
	}
	@Column(columnDefinition="float default 0")
	public float getToolFee() {
		return toolFee;
	}
	public void setToolFee(float toolFee) {
		this.toolFee = toolFee;
	}

	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	
}
