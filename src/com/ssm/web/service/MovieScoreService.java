package com.ssm.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.bean.MovieScore;
import com.ssm.util.common.BaseService;
import com.ssm.web.dao.MovieScoreMapper;
import com.ssm.web.dao.SQLMapper;

@Service
@Transactional
public class MovieScoreService extends BaseService<MovieScore> {

	@Autowired
	MovieScoreMapper	movieScoreMapper;
	@Autowired
	SQLMapper			sqlMapper;

	public void addScore(MovieScore ms) {
		movieScoreMapper.insert(ms);
		sqlMapper.updateMovieScore(ms.getMovieId());
	}

}
