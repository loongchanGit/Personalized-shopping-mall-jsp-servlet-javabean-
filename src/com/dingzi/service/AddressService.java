package com.dingzi.service;

import com.dingzi.pojo.Address;

public interface AddressService {
    /**
     * 显示用户默认地址
     * @param id
     * @return
     */
    public Address showDefaultAddressByUser(int id);
}
