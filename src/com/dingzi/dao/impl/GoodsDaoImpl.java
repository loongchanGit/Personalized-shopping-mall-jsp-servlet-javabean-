package com.dingzi.dao.impl;

import com.dingzi.dao.GoodsDao;
import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Parts;
import com.dingzi.pojo.Type;

import java.util.List;

public class GoodsDaoImpl extends BaseDao implements GoodsDao {
    @Override
    public List<Goods> queryAllGoodByFiveHot() {
        String sql="select * from tb_goods order by hot desc limit 5";
        return queryForList(Goods.class,sql);
    }

    @Override
    public List<Goods> queryTypeGoodByFiveHot(String type) {
        String sql="select * from tb_goods where type=? order by hot desc limit 5";
        return queryForList(Goods.class,sql,type);
    }

    @Override
    public Goods queryGoodById(int id) {
        String sql="select * from tb_goods where id=?";
        return queryForOne(Goods.class,sql,id);
    }

    @Override
    public int addOneHot(int id) {
        String sql="update tb_goods set hot=hot+1 where id=?";
        return update(sql,id);
    }

    @Override
    public List<Parts> queryPartById(int id) {
        String sql="select a.good_id,color,size,image from tb_good_part a join tb_good_color_img b on a.good_id=b.good_id and a.color=b.good_color where a.good_id=?";
        return queryForList(Parts.class,sql,id);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql="select count(*) from tb_goods";
        Number count=(Number)queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public Integer queryPageTotalCountForType(String type) {
        String sql="select count(*) from tb_goods a join tb_type b where a.type=b.id and type_name=?";
        Number count=(Number)queryForSingleValue(sql,type);
        return count.intValue();
    }

    @Override
    public List<Goods> queryPageItems(int begin, int pageSize) {
        String sql="select * from tb_goods limit ?,?";
        return queryForList(Goods.class,sql,begin,pageSize);
    }

    @Override
    public List<Goods> queryPageItemsForType(int begin, int pageSize, String type) {
        String sql="select * from tb_goods where type=? limit ?,?";
        return queryForList(Goods.class,sql,type,begin,pageSize);
    }

    @Override
    public Integer queryPageTotalCountForName(String name) {
        String sql="select count(*) from tb_goods where name LIKE concat('%',?,'%')";
        Number count=(Number)queryForSingleValue(sql,name);
        return count.intValue();
    }

    @Override
    public List<Goods> queryPageItemsForName(int begin, int pageSize, String name) {
        String sql="select * from tb_goods where name like concat('%',?,'%') limit ?,?";
        return queryForList(Goods.class,sql,name,begin,pageSize);
    }

    @Override
    public int modifyGoodById(int id, String name, int price, String type, String image) {
        String sql="update tb_goods set name=?,price=?,type=?,path=? where id=?";
        return update(sql,name,price,type,image,id);
    }

    @Override
    public int deleteGoodById(int id) {
        String sql="delete from tb_goods where id=?";
        return update(sql,id);
    }

    @Override
    public int addNewGood(Goods goods) {
        String sql="insert into tb_goods values(?,?,?,?,?,?,?)";
        return update(sql,goods.getId(),goods.getName(),goods.getPrice(),goods.getType(),goods.getHot(),goods.getPath(),goods.getSale());
    }

    @Override
    public int addPart(int id, String size, String color) {
        String sql="insert into tb_good_part values(?,?,?)";
        return update(sql,id,color,size);
    }

    @Override
    public int addPartImg(int id, String color, String image) {
        String sql="insert into tb_good_color_img values(?,?,?)";
        return update(sql,id,color,image);
    }
    @Override
    public int addOneSale(int id) {
        String sql="update tb_goods set sale=sale+1 where id=?";
        return update(sql,id);
    }

    @Override
    public List<Goods> showGoodsForType(String type) {
        String sql="select * from tb_goods where type=?";
        return queryForList(Goods.class,sql,type);
    }

    @Override
    public String queryImgById(int id) {
        String sql="select path from tb_goods where id=?";
        return (String) queryForSingleValue(sql,id);
    }
}
