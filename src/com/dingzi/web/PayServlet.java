package com.dingzi.web;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.dingzi.AlipayConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/payServlet")
public class PayServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            //沙箱支付
            //获得初始化的AlipayClient
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
            //设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            alipayRequest.setReturnUrl(AlipayConfig.return_url);
            alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

            //商户订单号，商户网站订单系统中唯一订单号，必填
            String out_trade_no = new String(req.getParameter("order_id").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额，必填
            String total_amount = new String(req.getParameter("order_money").getBytes("ISO-8859-1"),"UTF-8");
            //订单名称，必填
            String subject = new String(req.getParameter("order_name").getBytes("ISO-8859-1"),"UTF-8");
            //商品描述，可空
            String body = new String(req.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求
            String result = null;
            try {
                result = alipayClient.pageExecute(alipayRequest).getBody();
            } catch (AlipayApiException e) {
                e.printStackTrace();
            }
        resp.setContentType("text/html;charset=UTF-8");
            //输出
        resp.getWriter().write(result);

    }

}
