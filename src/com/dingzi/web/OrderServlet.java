package com.dingzi.web;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.dingzi.AlipayConfig;
import com.dingzi.pojo.*;
import com.dingzi.service.AddressService;
import com.dingzi.service.GoodsService;
import com.dingzi.service.OrderService;
import com.dingzi.service.UserService;
import com.dingzi.service.impl.AddressServiceImpl;
import com.dingzi.service.impl.GoodsServiceImpl;
import com.dingzi.service.impl.OrderServiceImpl;
import com.dingzi.service.impl.UserServiceImpl;
import com.sun.javafx.collections.MappingChange;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/orderServlet")
public class OrderServlet extends BaseServlet{
    private OrderService orderService=new OrderServiceImpl();
    private GoodsService goodsService=new GoodsServiceImpl();
    HashMap<String,String> hashMap=new HashMap<String, String>();//保存表单值HashMap
    public void gain(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        if(ServletFileUpload.isMultipartContent(req)){
            //创建FileItemFactory工厂实现类
            FileItemFactory fileItemFactory=new DiskFileItemFactory();
            //创建用于解析上传数据的工具类
            ServletFileUpload servletFileUpload=new ServletFileUpload(fileItemFactory);
            servletFileUpload.setHeaderEncoding("UTF-8");
            int i=0;
            try {
                //解析上传数据，得到每一个表单项FileItem
                List<FileItem> list=servletFileUpload.parseRequest(req);
                //判断每一个上传的文件类型
                for (FileItem fileItem:list) {
                    if(fileItem.isFormField()){//普通表单项
                        hashMap.put(fileItem.getFieldName(),fileItem.getString("UTF-8"));//保存表单项到HashMap中
                        System.out.println(fileItem.getFieldName());
                        System.out.println(fileItem.getString("UTF-8"));
                    }else{//上传的文件
                        Random random=new Random();
                        String filename=random.nextInt(1000000000)+".jpg";//数据库保存路径
                        fileItem.write(new File("C:/image/order/"+filename));
                        hashMap.put(fileItem.getFieldName(),filename);//保存图片路径到HashMap
                        System.out.println(fileItem.getFieldName());
                        System.out.println(fileItem.getName());
                        System.out.println("文件上传成功");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    //添加购物车方法
    public void add(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        gain(req, resp);
        System.out.println("添加购物车");
    }
    //直接购买方法
    public void buy(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException, AlipayApiException {
        gain(req, resp);
        Calendar c = Calendar.getInstance();
        //订单id由年+月+日+时+分+秒+毫秒组成
        long id=Long.parseLong(String.valueOf(c.get(Calendar.YEAR))+c.get(Calendar.MONTH)+c.get(Calendar.DATE)+c.get(Calendar.HOUR)+c.get(Calendar.HOUR_OF_DAY)+c.get(Calendar.SECOND));
        int goodid=Integer.valueOf(hashMap.get("good_id"));
        int userid=Integer.valueOf(hashMap.get("user_id"));
        String address=hashMap.get("address");
        System.out.println(address);
        String size=hashMap.get("size");
        String color=hashMap.get("color");
        String image=hashMap.get("image");
        int money=Integer.valueOf(hashMap.get("money"));
        String telephone=hashMap.get("telephone");
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date=df.format(day);
        Orders orders=new Orders(id,goodid,userid,address,size,color,image,money,telephone,date,"定制中");
        String goodname=goodsService.showGoodsForId(goodid).getName();
        req.setAttribute("goodname",goodname);
        req.setAttribute("orders",orders);
        req.getRequestDispatcher("/pages/order/paypage.jsp").forward(req,resp);//跳到支付页面
        orderService.addNewOrder(orders);
        goodsService.addOneSale(goodid);
        System.out.println("直接购买");
    }

    //订单分页
    protected void showAllOrder(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int pageNo=Integer.valueOf(req.getParameter("pageNo"));
        int pageSize=Integer.valueOf(req.getParameter("pageSize"));
        Page<Orders> page=null;
        page=orderService.page(pageNo,pageSize);
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/order_m.jsp").forward(req,resp);
    }
    //显示个人订单
    protected void showPersonalOrder(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int pageNo=Integer.valueOf(req.getParameter("pageNo"));
        int pageSize=Integer.valueOf(req.getParameter("pageSize"));
        int id=Integer.valueOf(req.getParameter("id"));
        Page<Orders> page=null;
        page=orderService.PsersonalPage(pageNo,pageSize,id);
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/order/myorder.jsp").forward(req,resp);
    }

    protected void deleteOrder(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        orderService.deleteOrder(id);
        int pageNo=1;
        int pageSize=10;
        Page<Orders> page=null;
        page=orderService.page(pageNo,pageSize);
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/order_m.jsp").forward(req,resp);
    }

    protected void modifyOrder(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        String address = new String(req.getParameter("address").getBytes("iso-8859-1"), "utf-8");
        String telephone=new String(req.getParameter("telephone").getBytes("iso-8859-1"), "utf-8");
        String size=new String(req.getParameter("size").getBytes("iso-8859-1"), "utf-8");
        String color=new String(req.getParameter("color").getBytes("iso-8859-1"), "utf-8");
        String state=new String(req.getParameter("state").getBytes("iso-8859-1"), "utf-8");
        orderService.modifyOrder(id,address,telephone,size,color,state);
        int pageNo=1;
        int pageSize=10;
        Page<Orders> page=null;
        page=orderService.page(pageNo,pageSize);
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/order_m.jsp").forward(req,resp);
    }

    protected void addAddress(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        int goodid=Integer.valueOf(req.getParameter("goodid"));
        String address = new String(req.getParameter("address").getBytes("iso-8859-1"), "utf-8");
        orderService.addAddress(id,address);
        HttpSession session=req.getSession();
        System.out.println(session);
        System.out.println(session.toString());
        int userid=0;
        if(session.getAttribute("userid")!=null){//userid作用域有值时才进行获取
            userid=(int)session.getAttribute("userid");
            System.out.println(userid);
        }
        Goods goodsDetails=goodsService.showGoodsForId(goodid);
        goodsService.addOneHot(id);//每点击一次增加一次商品热度
        UserService userService=new UserServiceImpl();
        List<Address> addressList=userService.queryAddressByUser(userid);
        System.out.println(addressList);
        List<Parts> partsList=goodsService.showPartById(goodid);
        List<String> colorList=new ArrayList<>();
        List<String> sizeList=new ArrayList<>();
        List<String> imageList=new ArrayList<>();
        Iterator<Parts> it=partsList.iterator();
        while(it.hasNext()){
            Parts p=it.next();
            if(!colorList.contains(p.getColor())){//相同颜色属性只出现一次，图片也只保存一种
                colorList.add(p.getColor());
                imageList.add(p.getImage());
            }
            if(!sizeList.contains(p.getSize())){//相同大小属性只出现一次
                sizeList.add(p.getSize());
            }
        }
        AddressService addressService=new AddressServiceImpl();
        Address userAddress=addressService.showDefaultAddressByUser(userid);
        req.setAttribute("userAddress",userAddress);
        req.setAttribute("color",colorList);
        req.setAttribute("size",sizeList);
        req.setAttribute("image",imageList);
        req.setAttribute("goodsDetails",goodsDetails);
        req.setAttribute("addressList",addressList);
        req.getRequestDispatcher("/pages/order/goods_details.jsp").forward(req,resp);
    }
    ///下载图片
    protected void download(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
        int id=Integer.valueOf(req.getParameter("id"));
        Orders orders=orderService.queryOrderById(id);
        String downloadFileName=orders.getGood_image();//下载文件名
        //读取下载的文件内容
        InputStream inputStream=new FileInputStream("C:/image/order/"+downloadFileName);
        //以附件下载文件
        resp.setHeader("Content-Disposition","attachment;filename="+downloadFileName);
        OutputStream outputStream=resp.getOutputStream();
        //读取输入流中全部的数据，复制给输出流，输出给客户端
        IOUtils.copy(inputStream,outputStream);
    }

    protected void deleteMore(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
        String ids = req.getParameter("ids");
        orderService.deleteMore(ids);
    }
    //确认收货
    protected void confirm(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
        long id=Long.parseLong(req.getParameter("id"));
        int userid=Integer.valueOf(req.getParameter("userid"));
        orderService.confirm(id);
        int pageNo=1;
        int pageSize=10;
        Page<Orders> page=null;
        page=orderService.PsersonalPage(pageNo,pageSize,userid);
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/order/myorder.jsp").forward(req,resp);

    }





}
