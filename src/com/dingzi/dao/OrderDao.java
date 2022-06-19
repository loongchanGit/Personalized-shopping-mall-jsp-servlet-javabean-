package com.dingzi.dao;

import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Orders;
import com.dingzi.pojo.Page;

import java.util.List;

public interface OrderDao {
    /**
     * 插入一条新的订单记录
     * @param orders
     * @return
     */
    public int addNewOrder(Orders orders);


    /**
     * 查询当前页总记录数
     * @return
     */
    public Integer queryForPageTotalCount();

    /**
     * 查询当前页对象
     * @param begin
     * @param pageSize
     * @return
     */
    public List<Orders> queryPageItems(int begin, int pageSize);

    /**
     * 根据id删除指定订单
     * @param id
     * @return
     */
    public int deleteOrder(int id);

    public int modifyOrder(int id, String address, String telephone, String size, String color,String state);

    public int addAddress(int id, String address);

    public Orders queryOrderById(int id);

    public int deleteMore(String ids);

    public List<Orders> queryOrderByUser(int id);

    public int confirm(long id);
    
    public Integer queryForPageTotalCountById(int id);

    public List<Orders> queryPageItemsById(int begin, int pageSize, int id);
}
