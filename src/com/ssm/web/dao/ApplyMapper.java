package com.ssm.web.dao;

import com.ssm.bean.Apply;

import tk.mybatis.mapper.common.Mapper;

//Mapper接口：一种通用的接口（相当于dao接口）
//由Mybatis框架根据接口定义创建接口的动态代理对象
public interface ApplyMapper extends Mapper<Apply> {

}
