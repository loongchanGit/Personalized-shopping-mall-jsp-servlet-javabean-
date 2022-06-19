package com.dingzi.service.impl;

import com.dingzi.dao.AddressDao;
import com.dingzi.dao.impl.AddressDaoImpl;
import com.dingzi.pojo.Address;
import com.dingzi.service.AddressService;

public class AddressServiceImpl implements AddressService {
    private AddressDao addressDao=new AddressDaoImpl();
    @Override
    public Address showDefaultAddressByUser(int id) {
        return addressDao.queryDefaultAddressByUser(id);
    }
}
