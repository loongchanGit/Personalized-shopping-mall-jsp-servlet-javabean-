package com.dingzi.dao;

import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Parts;
import com.dingzi.pojo.Type;

import java.awt.print.Book;
import java.util.List;

public interface GoodsDao {
    /**
     * 查找所有商品热门前五
     * @return
     */
    public List<Goods> queryAllGoodByFiveHot();

    /**
     * 查找指定类型商品热门前五
     * @param type
     * @return
     */
    public List<Goods> queryTypeGoodByFiveHot(String type);


    /**
     * 根据id查询商品详细信息
     * @return
     */
    public Goods queryGoodById(int id);

    /**
     * 指定商品热度+1
     * @param id
     */
    public int addOneHot(int id);

    /**
     * 根据商品ID查询商品可选择部分
     * @param id
     * @return
     */
    public List<Parts> queryPartById(int id);

    /**
     * 求分页总记录数
     * @return
     */
    public Integer queryForPageTotalCount();

    /**
     * 根据类别查找分页总记录数
     * @param type
     * @return
     */
    public Integer queryPageTotalCountForType(String type);

    /**
     * 查询当前页对象
     * @param begin
     * @param pageSize
     * @return
     */
    public List<Goods> queryPageItems(int begin, int pageSize);

    /**
     * 根据类别查询当前页对象
     * @param begin
     * @param pageSize
     * @param type
     * @return
     */
    public List<Goods> queryPageItemsForType(int begin,int pageSize,String type);

    /**
     * 根据名称模糊查询商品分页总记录数
     * @param name
     * @return
     */
    Integer queryPageTotalCountForName(String name);

    /**
     * 根据名称模糊查询商品当前页对象
     * @param begin
     * @param pageSize
     * @param name
     * @return
     */
    List<Goods> queryPageItemsForName(int begin, int pageSize, String name);

    /**
     * 修改指定id商品
     * @param id
     * @param name
     * @param price
     * @param type
     * @param image
     * @return
     */
    public int modifyGoodById(int id, String name, int price, String type, String image);

    /**
     * 删除指定id商品
     * @param id
     * @return
     */
    public int deleteGoodById(int id);

    /**
     * 添加新商品
     * @param goods
     */
    public int addNewGood(Goods goods);

    public int addPart(int id, String size, String color);

    public int addPartImg(int id,String color,String image);

    /**
     * 指定商品销售额+1
     * @param id
     * @return
     */
    public int addOneSale(int id);

    /**
     * 查询指定类型商品
     * @param type
     * @return
     */
    public List<Goods> showGoodsForType(String type);

    public String queryImgById(int id);
}
