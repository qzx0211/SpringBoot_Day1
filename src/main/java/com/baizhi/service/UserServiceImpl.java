package com.baizhi.service;

import com.baizhi.Dao.UserDao;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public void save(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setRole("普通用户");
        user.setState("激活");
        userDao.save(user);
    }

    @Override
    public void delete(String id) {
        userDao.delete(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> selectAll(Integer page, Integer rows) {
        List<User> users = userDao.selectAll(page, rows);
        return  users;

    }

    @Override
    public Integer selectCount() {
        Integer integer = userDao.selectCount();
        return integer;
    }
}
