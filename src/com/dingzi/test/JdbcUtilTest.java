package com.dingzi.test;

import com.dingzi.utils.JdbcUtils;
import org.junit.Test;

public class JdbcUtilTest {

    @Test
    public void testJdbcUtils(){
        System.out.println(JdbcUtils.getConnection());
    }
}
