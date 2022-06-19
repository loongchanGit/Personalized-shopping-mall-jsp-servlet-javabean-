package com.dingzi.dao;

import com.dingzi.pojo.Type;

import java.util.List;

public interface TypeDao {
    /**
     * 查询所有商品分类
     * @return
     */
    public List<Type> queryAllType();

    /**
     * 新增类别
     * @param name
     */
    public int addNewType(String name);
}
