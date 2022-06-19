package com.dingzi.service.impl;

import com.dingzi.dao.TypeDao;
import com.dingzi.dao.impl.TypeDaoImpl;
import com.dingzi.pojo.Type;
import com.dingzi.service.TypeService;

import java.util.List;

public class TypeServiceImpl implements TypeService {
    private TypeDao typeDao=new TypeDaoImpl();
    @Override
    public List<Type> queryAllType() {
        return typeDao.queryAllType();
    }

    @Override
    public int addNewType(String name) {
        return typeDao.addNewType(name);
    }
}
