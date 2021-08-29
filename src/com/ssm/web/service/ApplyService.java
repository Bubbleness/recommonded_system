package com.ssm.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.bean.Apply;
import com.ssm.util.common.BaseService;
import com.ssm.web.dao.ApplyMapper;
import com.ssm.web.dao.SQLMapper;

@Service
@Transactional//声明式事务管理注解（相当于配置文件里面的事务管理tx）
public class ApplyService extends BaseService<Apply> {

	@Autowired
	ApplyMapper	applyMapper;
	@Autowired
	SQLMapper	sqlMapper;

	public void udpateCheck(String status, int uid) {
		//根据主键进行选择
		Apply a = applyMapper.selectByPrimaryKey(uid);
		a.setStatus(status);
		applyMapper.updateByPrimaryKey(a);
		if("同意".equals(status)){
			//更新用户类型
			sqlMapper.updateUserType(a.getUserId());
		}
	}

}
