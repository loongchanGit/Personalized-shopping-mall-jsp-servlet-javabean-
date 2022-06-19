package com.dingzi.web;

import com.dingzi.pojo.Goods;
import com.dingzi.service.GoodsService;
import com.dingzi.service.impl.GoodsServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/chartsServlet")
public class ChartsServlet extends BaseServlet{
    protected void type(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String type=new String(req.getParameter("type").getBytes("iso-8859-1"), "utf-8");
        GoodsService goodsService=new GoodsServiceImpl();
        List<Goods> Data =goodsService.showGoodsForType(type);
        Gson  gson = new Gson();
        String json = gson.toJson(Data);//转换为json对象
        System.out.println(json);
        resp.getWriter().write(json);
    }

    protected void hot(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        GoodsService goodsService=new GoodsServiceImpl();
        String type=new String(req.getParameter("type").getBytes("iso-8859-1"), "utf-8");
        List<Goods> Data =goodsService.showFiveHotGoodsForType(type);
        Gson  gson = new Gson();
        String json = gson.toJson(Data);//转换为json对象
        System.out.println(json);
        resp.getWriter().write(json);
    }


}
