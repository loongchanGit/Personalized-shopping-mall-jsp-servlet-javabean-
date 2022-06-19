package com.dingzi.dao.impl;

import com.dingzi.dao.OrderDao;
import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Orders;
import com.dingzi.pojo.Page;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {

    @Override
    public int addNewOrder(Orders orders) {
        String sql="insert into tb_orders values(?,?,?,?,?,?,?,?,?,?,?)";
        return update(sql,orders.getId(),orders.getGood_id(),orders.getUser_id(),orders.getAddress(),orders.getGood_size(),orders.getGood_color(),orders.getGood_image(),orders.getMoney(),orders.getTelephone(),orders.getDate(),orders.getState());
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql="select count(*) from tb_orders";
        Number count=(Number)queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Orders> queryPageItems(int begin, int pageSize) {
        String sql="select * from tb_orders limit ?,?";
        return queryForList(Orders.class,sql,begin,pageSize);
    }

    @Override
    public int deleteOrder(int id) {
        String sql="delete from tb_orders where id=?";
        return update(sql,id);
    }

    @Override
    public int modifyOrder(int id, String address, String telephone, String size, String color,String state) {
        String sql="update tb_orders set address=?,telephone=?,good_size=?,good_color=?,state=? where id=?";
        return update(sql,address,telephone,size,color,state,id);
    }

    @Override
    public int addAddress(int id, String address) {
        String sql="insert into tb_user_address values(?,?)";
        return update(sql,id,address);
    }

    @Override
    public Orders queryOrderById(int id) {
        String sql="select * from tb_orders where id=?";
        return queryForOne(Orders.class,sql,id);
    }

    @Override
    public int deleteMore(String ids) {
        String sql="delete from tb_orders where id in("+ids+")";
        return update(sql,null);
    }

    @Override
    public List<Orders> queryOrderByUser(int id) {
        String sql="select * from tb_orders where user_id=?";
        return queryForList(Orders.class,sql,id);
    }

    @Override
    public int confirm(long id) {
        String sql="update tb_orders set state='已收货' where id=?";
        return update(sql,id);
    }

    @Override
    public Integer queryForPageTotalCountById(int id) {
        String sql="select count(*) from tb_orders where user_id=?";
        Number count=(Number)queryForSingleValue(sql,id);
        return count.intValue();
    }

    @Override
    public List<Orders> queryPageItemsById(int begin, int pageSize, int id) {
        String sql="select * from tb_orders where user_id=? limit ?,?";
        return queryForList(Orders.class,sql,id,begin,pageSize);
    }


}
