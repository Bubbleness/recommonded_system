package com.ssm.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ssm.util.FD;

import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

@Entity
@Table(name = "t_apply")
@NameStyle(Style.normal)
public class Apply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer		id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	@FD("用户")
	private SimpleUser	user;
	private Integer		userId;

	@FD("申请日期")
	private String		addDate;
	@FD("申请理由")
	private String		reason;
	@FD("状态")
	private String		status;	//待审核,同意,拒绝

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public SimpleUser getUser() {
		return user;
	}

	public void setUser(SimpleUser user) {
		this.user = user;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
