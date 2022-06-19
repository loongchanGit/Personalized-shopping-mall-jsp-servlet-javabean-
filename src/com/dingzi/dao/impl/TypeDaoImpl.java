package com.dingzi.dao.impl;

import com.dingzi.dao.TypeDao;
import com.dingzi.pojo.Type;

import java.util.List;

public class TypeDaoImpl extends BaseDao implements TypeDao {
    @Override
    public List<Type> queryAllType() {
        String sql="select type_name from tb_type";
        return queryForList(Type.class,sql);
    }

    @Override
    public int addNewType(String name) {
        String sql="insert into tb_type values(null,?)";
        return update(sql,name);
    }
}
