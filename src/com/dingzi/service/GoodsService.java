package com.dingzi.service;

import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Page;
import com.dingzi.pojo.Parts;
import com.dingzi.pojo.Type;

import java.awt.print.Book;
import java.util.List;

public interface GoodsService {
    /**
     * 展示前五热门商品
     * @return
     */
    public List<Goods> showFiveHotGoodsForAll();

    /**
     * 展示指定类型前五热门商品
     * @param type
     * @return
     */
    public List<Goods> showFiveHotGoodsForType(String type);

    /**
     * 根据id查询商品信息
     * @param id
     * @return
     */
    public Goods showGoodsForId(int id);

    /**
     * 指定商品id热度+1
     * @param id
     * @return
     */
    public int addOneHot(int id);

    /**
     * 显示指定ID的商品可选择部分
     * @param id
     * @return
     */
    public List<Parts> showPartById(int id);

    /**
     * 显示所有商品分页
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Goods> allpage(int pageNo, int pageSize);

    /**
     * 根据类别显示商品分页
     * @param pageNo
     * @param pageSize
     * @param type
     * @return
     */
    public Page<Goods> typepage(int pageNo, int pageSize, String type);

    /**
     * 搜索商品显示商品分页
     * @param pageNo
     * @param pageSize
     * @param name
     * @return
     */
    Page<Goods> searchpage(int pageNo, int pageSize, String name);

    /**
     * 根据id修改商品
     * @param id
     * @param goodname
     * @param price
     * @param type
     * @param image
     */
    public int modifyGoodById(int id, String goodname, int price, String type, String image);

    /**
     * 根据id删除商品
     * @param id
     * @return
     */
    public int deleteGoodById(int id);

    /**
     * 添加新商品
     * @param goods
     */
    public int addNewGood(Goods goods);

    /**
     * 添加商品规格
     * @param id
     * @param size
     * @param color
     * @return
     */
    public int addPart(int id, String size, String color,String image);

    /**
     * 指定商品销售额+1
     * @param id
     * @return
     */
    public int addOneSale(int id);

    /**
     * 显示指定类型的商品
     * @param type
     * @return
     */
    public List<Goods> showGoodsForType(String type);

    /**
     * 查询指定商品图片地址
     * @param id
     * @return
     */
    public String queryImgById(int id);
}
