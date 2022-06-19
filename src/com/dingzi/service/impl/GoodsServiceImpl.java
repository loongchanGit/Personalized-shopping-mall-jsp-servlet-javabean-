package com.dingzi.service.impl;

import com.dingzi.dao.GoodsDao;
import com.dingzi.dao.impl.GoodsDaoImpl;
import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Page;
import com.dingzi.pojo.Parts;
import com.dingzi.pojo.Type;
import com.dingzi.service.GoodsService;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {
    private GoodsDao goodsDao=new GoodsDaoImpl();
    @Override
    public List<Goods> showFiveHotGoodsForAll() {
        return goodsDao.queryAllGoodByFiveHot();
    }

    @Override
    public List<Goods> showFiveHotGoodsForType(String type) {
        return goodsDao.queryTypeGoodByFiveHot(type);
    }

    @Override
    public Goods showGoodsForId(int id) {
        return goodsDao.queryGoodById(id);
    }

    @Override
    public int addOneHot(int id) {
        return goodsDao.addOneHot(id);
    }

    @Override
    public List<Parts> showPartById(int id) {
        return goodsDao.queryPartById(id);
    }

    @Override
    public Page<Goods> allpage(int pageNo, int pageSize) {
        Page<Goods> page= new Page<>();
        page.setPageNo(pageNo);
        Integer pageTotalCount=goodsDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal=pageTotalCount/pageSize;
        if(pageTotalCount % pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);
        int begin=(page.getPageNo()-1)*pageSize;
        List<Goods> items=goodsDao.queryPageItems(begin,pageSize);
        page.setItem(items);
        return page;
    }

    @Override
    public Page<Goods> typepage(int pageNo, int pageSize, String type) {
        Page<Goods> page= new Page<>();
        page.setPageNo(pageNo);
        Integer pageTotalCount=goodsDao.queryPageTotalCountForType(type);
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal=pageTotalCount/pageSize;
        if(pageTotalCount % pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);
        int begin=(page.getPageNo()-1)*pageSize;
        List<Goods> items=goodsDao.queryPageItemsForType(begin,pageSize,type);
        page.setItem(items);
        return page;
    }

    @Override
    public Page<Goods> searchpage(int pageNo, int pageSize, String name) {
        Page<Goods> page= new Page<>();
        page.setPageNo(pageNo);
        Integer pageTotalCount=goodsDao.queryPageTotalCountForName(name);
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal=pageTotalCount/pageSize;
        if(pageTotalCount % pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);
        int begin=(page.getPageNo()-1)*pageSize;
        List<Goods> items=goodsDao.queryPageItemsForName(begin,pageSize,name);
        page.setItem(items);
        return page;
    }

    @Override
    public int modifyGoodById(int id, String name, int price, String type, String image) {
        return goodsDao.modifyGoodById(id,name,price,type,image);
    }

    @Override
    public int deleteGoodById(int id) {
        return goodsDao.deleteGoodById(id);
    }

    @Override
    public int addNewGood(Goods goods) {
        return goodsDao.addNewGood(goods);
    }

    @Override
    public int addPart(int id, String size, String color,String image) {
        goodsDao.addPart(id,size,color);
        return goodsDao.addPartImg(id,color,image);
    }

    @Override
    public int addOneSale(int id) {
        return goodsDao.addOneSale(id);
    }

    @Override
    public List<Goods> showGoodsForType(String type) {
        return goodsDao.showGoodsForType(type);
    }

    @Override
    public String queryImgById(int id) {
        return goodsDao.queryImgById(id);
    }


}
