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
@Table(name = "t_movie_comment")
@NameStyle(Style.normal)
public class MovieComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer		id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "movieId")
	@FD("视频")
	private Movie		movie;
	private Integer		movieId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	@FD("用户")
	private SimpleUser	user;
	private Integer		userId;
	@FD("评论日期")
	private String		addDate;
	@FD("评论内容")
	@Column(length = 5000)
	private String		content;

	private String		vtype;//大V?

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVtype() {
		return vtype;
	}

	public void setVtype(String vtype) {
		this.vtype = vtype;
	}

}
