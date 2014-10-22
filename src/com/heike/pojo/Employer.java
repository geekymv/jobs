package com.heike.pojo;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;

/**
 * 用工单位类(学生处和学院)
 * @author Geek_ymv
 */
@Entity
@Table(name="t_employer")
public class Employer {
	
	private Integer id;
	private String account;	//账号
	private String password;
	private String name;	//用工单位名称
	private String teacher;	//负责老师
	private String mobile;
	private Integer totalMoney;	//申请月总金额
	private Integer postNum;	//申请的岗位数
	private Integer authority;	//权限（1--学生处， 2--学院或社团）
	private String remarks;		//备注
	
	private Set<Student> students = new LinkedHashSet<Student>();
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="t_employer_student",
			joinColumns={@JoinColumn(name="emp_id")},
			inverseJoinColumns={@JoinColumn(name="stu_id")}	//Employer维护关联关系
			)
	@JSON(serialize=false)
	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	@Column(columnDefinition="float default 0")
	public Integer getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getPostNum() {
		return postNum;
	}
	public void setPostNum(Integer postNum) {
		this.postNum = postNum;
	}
	public Integer getAuthority() {
		return authority;
	}
	public void setAuthority(Integer authority) {
		this.authority = authority;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
}













