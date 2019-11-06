package com.baizhi.Dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //插入
    void save(User user);
    //删除
    void delete(String  id);
    //修改
    void update(User user);
    //查询
    User selectOne(String user);
    //查询所有
    List<User> selectAll(@Param("page") Integer page, @Param("rows") Integer rows);
    //获取总条数
    Integer selectCount();
}

//修改   github上做的
