package cn.zc.first.mapper;

import java.util.List;

import cn.zc.first.po.User;

public interface UserMapper {
    List<User> selectUsers(User user);
}