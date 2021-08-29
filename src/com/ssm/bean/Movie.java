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
import javax.persistence.Transient;

import com.ssm.util.FD;

import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

@Entity
@Table(name = "t_movie")
@NameStyle(Style.normal)
public class Movie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer		id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "movieAreaId")
	@FD("地区")
	private MovieArea	movieArea;
	private Integer		movieAreaId;
	@FD("类型")
	private String		movieType;
	@FD("名称")
	private String		name;
	@Column(length = 5000)
	@FD("简介")
	private String		note;
	@FD("图片")
	private String		imageFile;
	@FD("视频")
	private String		movieFile;

	@FD("年代")
	private String		movieYear;
	@Column(updatable = false)
	@FD("用户评分")
	private Double		score;
	@Column(updatable = false)
	@FD("评分人数")
	private Integer		scoreUserNumber;

	@FD("导演")
	private String		daoyan;
	@FD("演员")
	@Column(length = 1000)
	private String		yanyuan;
	@FD("时长")
	private String		shichang;
	@FD("上映时间")
	private String		shangyingshijian;
	@FD("语言")
	private String		yuyan;

	@Transient
	public String[] getTypeArray() {
		if (movieType == null)
			return null;
		return movieType.split(",");
	}

	@Transient
	public String getImageFile1() {
		if (imageFile != null) {
			if (imageFile.startsWith("http")) {
				return imageFile;
			} else {
				return "http://localhost:8080/sp/resource/" + imageFile;
			}
		}
		return "";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public MovieArea getMovieArea() {
		return movieArea;
	}

	public void setMovieArea(MovieArea movieArea) {
		this.movieArea = movieArea;
	}

	public Integer getMovieAreaId() {
		return movieAreaId;
	}

	public void setMovieAreaId(Integer movieAreaId) {
		this.movieAreaId = movieAreaId;
	}

	public String getMovieType() {
		return movieType;
	}

	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public String getMovieFile() {
		return movieFile;
	}

	public void setMovieFile(String movieFile) {
		this.movieFile = movieFile;
	}

	public String getMovieYear() {
		return movieYear;
	}

	public void setMovieYear(String movieYear) {
		this.movieYear = movieYear;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Integer getScoreUserNumber() {
		return scoreUserNumber;
	}

	public void setScoreUserNumber(Integer scoreUserNumber) {
		this.scoreUserNumber = scoreUserNumber;
	}

	public String getDaoyan() {
		return daoyan;
	}

	public void setDaoyan(String daoyan) {
		this.daoyan = daoyan;
	}

	public String getYanyuan() {
		return yanyuan;
	}

	public void setYanyuan(String yanyuan) {
		this.yanyuan = yanyuan;
	}

	public String getShichang() {
		return shichang;
	}

	public void setShichang(String shichang) {
		this.shichang = shichang;
	}

	public String getShangyingshijian() {
		return shangyingshijian;
	}

	public void setShangyingshijian(String shangyingshijian) {
		this.shangyingshijian = shangyingshijian;
	}

	public String getYuyan() {
		return yuyan;
	}

	public void setYuyan(String yuyan) {
		this.yuyan = yuyan;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Movie other = (Movie) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
