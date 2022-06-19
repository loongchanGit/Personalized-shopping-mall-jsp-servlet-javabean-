package com.dingzi.test;

import com.dingzi.dao.UserDao;
import com.dingzi.dao.impl.UserDaoImpl;
import com.dingzi.pojo.User;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoTest {
    UserDao userDao = new UserDaoImpl();

    @Test
    public void queryUserByUsername() {
        if (userDao.queryUserByUsername("admin") == null) {
            System.out.println("用户名可用");
        } else {
            System.out.println("用户名已存在");
        }
    }

    @Test
    public void queryUserByUsernameAndPassword() {
        if (userDao.queryUserByUsernameAndPassword("admin", "admin") == null) {
            System.out.println("登陆失败");
        } else {
            System.out.println("登陆成功");
        }
    }
}

