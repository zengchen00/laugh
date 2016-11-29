package cn.zc.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.UserMapper;
import cn.zc.first.po.User;
import cn.zc.first.service.UserService;

public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> getUser(User user) throws Exception {
		return userMapper.selectUsers(user);
	}

}
