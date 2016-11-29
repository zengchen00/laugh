package cn.zc.first.service;

import java.util.List;

import cn.zc.first.po.User;


public interface UserService {
	public List<User> getUser(User user) throws Exception;
}
