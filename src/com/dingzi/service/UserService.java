package com.dingzi.service;

import com.dingzi.pojo.Address;
import com.dingzi.pojo.User;

import java.util.List;

public interface UserService {
    /**
     * 注册
     * @param user
     */
    public void regisUser(User user);

    /**
     *
     * @param user
     * @return 返回null说明登录失败，否则成功
     */
    public User login(User user);

    /**
     * 检查用户名是否可用
     * @param username
     * @return 返回true表示用户名已存在，返回false表示用户可用
     */
    public boolean existsUsername(String username);

    /**
     * 显示所有用户信息
     * @return
     */
    public List<User> showAllUser();

    /**
     * 根据用户id删除用户
     * @param id
     */
    public int deleteUserById(int id);

    /**
     * 根据id修改用户信息
     * @param id
     * @param username
     * @param password
     * @param telephone
     * @return
     */
    public int modifyUserById(int id,String username,String password,String telephone);

    /**
     * 根据用户id查询用户所有收货地址
     * @param id
     * @return
     */
    public List<Address> queryAddressByUser(int id);

    /**
     * 根据激活码找Userbean对象
     * @param activetoken
     * @return
     */
    public User queryUserByActiveToken(String activetoken);

    public int queryIdByUsername(String username);

    /**
     * 激活该id用户
     * @param id
     */
    public int activate(String id);
}
