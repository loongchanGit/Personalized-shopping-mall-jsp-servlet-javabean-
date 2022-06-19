package com.dingzi.service.impl;

import com.dingzi.dao.OrderDao;
import com.dingzi.dao.impl.OrderDaoImpl;
import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Orders;
import com.dingzi.pojo.Page;
import com.dingzi.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao=new OrderDaoImpl();
    @Override
    public int addNewOrder(Orders orders) {
        return orderDao.addNewOrder(orders);
    }

    @Override
    public Page<Orders> page(int pageNo, int pageSize) {
        Page<Orders> page= new Page<>();
        page.setPageNo(pageNo);
        Integer pageTotalCount=orderDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal=pageTotalCount/pageSize;
        if(pageTotalCount % pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);
        int begin=(page.getPageNo()-1)*pageSize;
        List<Orders> items=orderDao.queryPageItems(begin,pageSize);
        page.setItem(items);
        return page;
    }

    @Override
    public int deleteOrder(int id) {
        return orderDao.deleteOrder(id);
    }

    @Override
    public int modifyOrder(int id, String address, String telephone, String size, String color,String state) {
        return orderDao.modifyOrder(id,address,telephone,size,color,state);
    }

    @Override
    public int addAddress(int id, String address) {
        return orderDao.addAddress(id,address);
    }

    @Override
    public Orders queryOrderById(int id) {
        return orderDao.queryOrderById(id);
    }

    @Override
    public int deleteMore(String ids) {
        return orderDao.deleteMore(ids);
    }

    @Override
    public List<Orders> showOrderByUser(int id) {
        return orderDao.queryOrderByUser(id);
    }

    @Override
    public int confirm(long id) {
        return orderDao.confirm(id);
    }

    @Override
    public Page<Orders> PsersonalPage(int pageNo, int pageSize,int id) {
        Page<Orders> page= new Page<>();
        page.setPageNo(pageNo);
        Integer pageTotalCount=orderDao.queryForPageTotalCountById(id);
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal=pageTotalCount/pageSize;
        if(pageTotalCount % pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);
        int begin=(page.getPageNo()-1)*pageSize;
        List<Orders> items=orderDao.queryPageItemsById(begin,pageSize,id);
        page.setItem(items);
        return page;
    }




}
