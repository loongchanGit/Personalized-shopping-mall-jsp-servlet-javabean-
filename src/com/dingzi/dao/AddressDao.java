package com.dingzi.dao;

import com.dingzi.pojo.Address;

public interface AddressDao {
    /**
     * 查询当前用户默认地址
     * @return
     */
    public Address queryDefaultAddressByUser(int id);
}
