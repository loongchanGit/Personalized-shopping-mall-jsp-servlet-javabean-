package com.dingzi.dao.impl;

import com.dingzi.dao.AddressDao;
import com.dingzi.pojo.Address;

public class AddressDaoImpl extends BaseDao implements AddressDao {
    @Override
    public Address queryDefaultAddressByUser(int id) {
        String sql="select * from tb_user_address where id=?";
        return queryForOne(Address.class,sql,id);
    }
}
