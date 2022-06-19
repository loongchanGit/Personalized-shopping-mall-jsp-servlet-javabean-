package com.dingzi.service;

import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Orders;
import com.dingzi.pojo.Page;

import java.util.List;

public interface OrderService {
    /**
     * 新建订单
     * @param orders
     * @return
     */
    public int addNewOrder(Orders orders);

    /**
     * 订单分页
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Orders> page(int pageNo, int pageSize);

    /**
     * 删除指定id的订单
     * @param id
     * @return
     */
    public int deleteOrder(int id);

    /**
     * 修改指定id订单
     * @param id
     * @param address
     * @param telephone
     * @param size
     * @param color
     */
    public int modifyOrder(int id, String address, String telephone, String size, String color,String state);

    public int addAddress(int id, String address);

    /**
     * 根据指定id查询订单
     * @param id
     * @return
     */
    public Orders queryOrderById(int id);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    public int deleteMore(String ids);

    /**
     * 显示用户订单
     * @param id
     * @return
     */
    public List<Orders> showOrderByUser(int id);

    /**
     * 指定id商品改为已收获状态
     * @param id
     * @return
     */
    public int confirm(long id);

    /**
     * 显示个人订单分页
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Orders> PsersonalPage(int pageNo, int pageSize,int id);


}
