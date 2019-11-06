package com.baizhi.test;

import com.baizhi.Application;
import com.baizhi.Dao.UserDao;
import com.baizhi.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class) //开启SpringBoot测试
@SpringBootTest(classes = Application.class)  //初始化Springboo的相关配置
public class TestDao {

    @Autowired
    private UserDao userDao;

    @Test
    public void save(){
        userDao.save(new User("2","yasuo","123","2222","102@qq.ocm","2","微信","普通用户","冻结"));
    }

    @Test
    public void delete(){
        userDao.delete("2");
    }

    @Test
    public void update(){
        userDao.update(new User("2","yasuo","123","333","1111@qq.ocm","2","微信","普通用户","jjj"));
    }

    @Test
    public void select(){
        User user = userDao.selectOne("uzi");

        System.out.println(user);
    }
}
