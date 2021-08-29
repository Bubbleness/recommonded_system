package com.ssm.web.service;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.bean.SimpleUser;
import com.ssm.bean.SysUser;
import com.ssm.util.MD5;
import com.ssm.util.common.BaseService;
import com.ssm.web.dao.SimpleUserMapper;
import com.ssm.web.dao.SysUserMapper;

@Service
@Transactional
public class SysUserService extends BaseService<SysUser> {

	//系统的管理员
	@Autowired
	private SysUserMapper sysUserMapper;
	//普通的用户
	@Autowired
	private SimpleUserMapper	simpleUserMapper;

	/**
	 * 用户登录
	 * @param name 用户名
	 * @param password 密码
	 * @param type 用户类型（管理员 还是 普通用户）
	 * @return
	 */
	public Object login(String name, String password, String type) {
		Object obj = null;
		// 得到类的简写名称
		//判断类型为管理员还是普通用户
		if (type.equals(SysUser.class.getSimpleName())) {
			SysUser temp = new SysUser();
			temp.setUname(name);
			temp.setUserPassword(password);
			obj = sysUserMapper.selectOne(temp);
		} else if (type.equals(SimpleUser.class.getSimpleName())) {
			SimpleUser temp = new SimpleUser();
			temp.setUname(name);
			temp.setUserPassword(password);
			obj = simpleUserMapper.selectOne(temp);
		}
		if (obj != null) {
			autoObjectFiled(obj);
		}
		
		return obj;
	}

	/**
	 * 删除一个管理员
	 * @param ids
	 */
	public void deleteSysUser(String ids) {
		if (ids != null) {
			String[] temp = ids.split(",");
			if (temp == null || temp.length <= 0) {
				throw new RuntimeException("ids error");
			}
			for (String str : temp) {
				mapper.deleteByPrimaryKey(Integer.valueOf(str));
			}
		}
	}

	/**
	 * 添加一个系统的管理员
	 * @param bean
	 */
	public void addSysUser(SysUser bean) {
		//MD5用来对数据进行加密
		MD5 md = new MD5();
		bean.setUserPassword(md.getMD5ofStr(bean.getUserPassword()));
		mapper.insert(bean);
	}

	/**
	 * 更新管理员的信息
	 * @param bean
	 */
	public void updateSysUser(SysUser bean) {
		//根据管理员的id选出要更新的管理员
		SysUser temp = mapper.selectByPrimaryKey(bean.getId());
		if (StringUtils.isNotBlank(bean.getUserPassword())) {
			MD5 md = new MD5();
			bean.setUserPassword(md.getMD5ofStr(bean.getUserPassword()));
		} else {
			bean.setUserPassword(temp.getUserPassword());
		}
		super.updateAll(bean);
	}

}
