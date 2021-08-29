package com.ssm.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.bean.Movie;
import com.ssm.util.common.BaseService;
import com.ssm.web.dao.SQLMapper;

@Service
@Transactional
public class MovieService extends BaseService<Movie> {
	@Autowired
	SQLMapper sqlMapper;

	/**
	 * 查询出所有的年份
	 * @return
	 */
	public List<String> findAllYear() {
		return sqlMapper.findAllYear();
	}

}
