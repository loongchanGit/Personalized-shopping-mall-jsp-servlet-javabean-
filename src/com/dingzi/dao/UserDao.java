package com.dingzi.dao;

import com.dingzi.pojo.Address;
import com.dingzi.pojo.User;

import java.util.List;

public interface UserDao {

    /**
     * 根据用户名查找用户信息
     * @param username
     * @return 返回null说明没有这个用户
     */
    public User queryUserByUsername(String username);

    /**
     * 根据用户名和密码查找用户
     * @param username
     * @param password
     * @return
     */
    public User queryUserByUsernameAndPassword(String username,String password);

    /**
     * 保存用户信息
     * @param user
     * @return 返回-1表示失败
     */
    public int saveUser(User user);

    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> queryAllUser();

    /**
     * 根据用户id删除用户
     * @param id
     * @return
     */
    public int deleteUserById(int id);

    /**
     * 根据id修改用户
     * @param id
     * @param username
     * @param password
     * @param telephone
     * @return
     */
    public int modifyUserById(int id, String username, String password, String telephone);

    /**
     * 根据用户id查询用户收货地址
     * @param id
     * @return
     */
    public List<Address> queryAddressByUser(int id);
    

    public User queryUserByActiveToken(String activetoken);

    public int queryIdByUsername(String username);

    public int activate(String id);
}
