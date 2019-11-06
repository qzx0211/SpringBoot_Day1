package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    //插入
    void save(User user);
    //删除
    void delete(String  id);
    //修改
    void update(User user);
    //查询所有
    List<User> selectAll(Integer page, Integer rows);
    //获取总条数
    Integer selectCount();
}
