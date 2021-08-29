package com.ssm.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

//操作数据库的Mapper
public interface SQLMapper {

	//查询电影表中的电影年份，按照年份降序排列
	@Select("select distinct movieYear from t_movie order by movieYear desc")
	List<String> findAllYear();

	//更新评分的用户号，评分（选出评分表中该电影的评分）
	@Update("update t_movie set scoreUserNumber=scoreUserNumber+1,score=(select avg(t_movie_score.socre) from t_movie_score where movieId=#{movieId})  where id=#{movieId}")
	void updateMovieScore(@Param(value = "movieId") Integer movieId);

	//更新user表的选中的id的type为V
	@Update("update t_user set type='V' where id=#{userId}")
	void updateUserType(@Param(value = "userId") Integer userId);

	//更新user的状态
	@Update("update t_user set locked=#{locked} where id=#{userId}")
	void updateUserLocked(@Param(value = "locked") String locked, @Param(value = "userId") Integer userId);

}
