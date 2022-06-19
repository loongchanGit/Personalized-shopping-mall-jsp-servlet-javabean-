package com.dingzi.web;

import com.dingzi.pojo.Goods;
import com.dingzi.pojo.Page;
import com.dingzi.pojo.Type;
import com.dingzi.service.GoodsService;
import com.dingzi.service.TypeService;
import com.dingzi.service.impl.GoodsServiceImpl;
import com.dingzi.service.impl.TypeServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/typeServlet")
public class TypeServlet extends BaseServlet{
    private TypeService typeService=new TypeServiceImpl();

    public void showAllType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Type> allType=typeService.queryAllType();
        req.setAttribute("AllType",allType);
    }

    public void addType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=new String(req.getParameter("type").getBytes("iso-8859-1"), "utf-8");
        typeService.addNewType(name);
        int pageNo=1;
        int pageSize=10;
        Page<Goods> page=null;
        GoodsService goodsService=new GoodsServiceImpl();
        page=goodsService.allpage(pageNo,pageSize);
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        PrintWriter out = resp.getWriter();
        req.getRequestDispatcher("/pages/manager/good_m.jsp").forward(req,resp);
    }
}
