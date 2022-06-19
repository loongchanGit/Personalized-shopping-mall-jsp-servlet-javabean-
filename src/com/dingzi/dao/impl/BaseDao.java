package com.dingzi.dao.impl;

import com.dingzi.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {
    private QueryRunner queryRunner=new QueryRunner();

    /**
     *
     * @param sql
     * @param args
     * @return 修改成功返回影响的行数，失败返回-1
     */
    public int update(String sql,Object ... args){//可变长参数
        Connection connection= JdbcUtils.getConnection();
        try {
            return queryRunner.update(connection,sql,args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(connection);
        }
        return -1;
    }

    /**
     * 查询返回一个JavaBean
     * @param type 返回对象的类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回类型的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type,String sql,Object ... args){
        Connection con=JdbcUtils.getConnection();
        try {
            return queryRunner.query(con,sql,new BeanHandler<T>(type),args);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close(con);
        }
        return null;
    }
    /**
     * 查询返回多个JavaBean
     * @param type 返回对象的类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回类型的泛型
     * @return
     */
    public <T> List<T> queryForList(Class<T> type, String sql, Object ... args){
        Connection con=JdbcUtils.getConnection();
        try {
            List list=queryRunner.query(con,sql,new BeanListHandler<>(type),args);
            return queryRunner.query(con,sql,new BeanListHandler<>(type),args);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close(con);
        }
        return null;
    }

    /**
     * 返回一行一列
     * @param sql
     * @param args
     * @return
     */
    public Object queryForSingleValue(String sql,Object ... args){
        Connection conn=JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn,sql,new ScalarHandler(),args);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close(conn);
        }
        return null;
    }
}
