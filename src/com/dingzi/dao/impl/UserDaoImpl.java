package com.dingzi.dao.impl;

import com.dingzi.dao.UserDao;
import com.dingzi.pojo.Address;
import com.dingzi.pojo.User;

import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User queryUserByUsername(String username) {
        String sql="select id,username,password,telephone from tb_users where username= ?";
        return queryForOne(User.class,sql,username);
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql="select * from tb_users where username=? and password=?";
        return queryForOne(User.class,sql,username,password);
    }


    @Override
    public int saveUser(User user) {
        String sql="insert into tb_users(username,password,telephone,email,state) values(?,?,?,?,?)";
        return update(sql,user.getUsername(),user.getPassword(),user.getTelephone(),user.getEmail(),user.getState());
    }

    @Override
    public List<User> queryAllUser() {
        String sql="select * from tb_users";
        return queryForList(User.class,sql);
    }

    @Override
    public int deleteUserById(int id) {
        String sql="delete from tb_users where id=?";
        return update(sql,id);
    }

    @Override
    public int modifyUserById(int id, String username, String password, String telephone) {
        String sql="update tb_users set username=?,password=?,telephone=? where id=?";
        return update(sql,username,password,telephone,id);
    }

    @Override
    public List<Address> queryAddressByUser(int id) {
        String sql="select * from tb_user_address where id=?";
        return queryForList(Address.class,sql,id);
    }

    @Override
    public User queryUserByActiveToken(String activetoken) {
        String sql="select * from tb_users where cdkey=?";
        return queryForOne(User.class,sql,activetoken);
    }

    @Override
    public int queryIdByUsername(String username) {
        String sql="select id from tb_users where username=?";
        Number count=(Number) queryForSingleValue(sql,username);
        return count.intValue();
    }

    @Override
    public int activate(String id) {
        String sql="update tb_users set state='已激活' where id=?";
        return update(sql,id);
    }
}
