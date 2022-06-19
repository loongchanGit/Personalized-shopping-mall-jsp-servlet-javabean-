package com.dingzi.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addorderServlet")
public class AddOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //method=alipay.trade.page.pay.return
//        String method=req.getParameter("method");
//        if(method.equals("alipay.trade.page.pay.return")){
//
//        }
        req.getRequestDispatcher("/pages/index.jsp").forward(req,resp);//跳到支付页面
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
