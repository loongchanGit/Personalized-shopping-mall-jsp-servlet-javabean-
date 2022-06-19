package com.dingzi.service;

import com.dingzi.pojo.Type;

import java.util.List;

public interface TypeService {
    /**
     * 展示所有商品分类
     * @return
     */
    public List<Type> queryAllType();

    /**
     * 新增类别
     * @param name
     */
    public int addNewType(String name);
}
