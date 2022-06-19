package com.dingzi.web;

import com.dingzi.utils.LocationUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/locationServlet")
public class LocationServlet extends BaseServlet {
    protected Map getLocation(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        Map map=new HashMap();
        map.put("ip",LocationUtils.getIp(req));
        System.out.println(LocationUtils.getIp(req));
        return map;
    }
}
