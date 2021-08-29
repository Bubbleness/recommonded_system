package com.ssm.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

@Entity
@Table(name = "t_user_filter_result")
@NameStyle(Style.normal)
public class UserFilteringResult {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer	id;
	//用户id
	private Integer	memberid;
	//视频id
	private String	productids;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getProductids() {
		return productids;
	}

	public void setProductids(String productids) {
		this.productids = productids;
	}

}
