package com.dingzi.web;

import com.dingzi.pojo.*;
import com.dingzi.service.AddressService;
import com.dingzi.service.GoodsService;
import com.dingzi.service.UserService;
import com.dingzi.service.impl.AddressServiceImpl;
import com.dingzi.service.impl.GoodsServiceImpl;
import com.dingzi.service.impl.UserServiceImpl;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/goodsServlet")
public class GoodsServlet extends BaseServlet {
    private GoodsService goodsService=new GoodsServiceImpl();
    private UserService userService=new UserServiceImpl();

    public void showFiveHotGoodsForAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        List<Goods> hotGoods=goodsService.showFiveHotGoodsForAll();
        req.setAttribute("HotForAll",hotGoods);
    }

    public void showFiveHotGoodsForType(HttpServletRequest req,HttpServletResponse resp,String type) throws ServletException,IOException{
        List<Goods> hotGoods=goodsService.showFiveHotGoodsForType(type);
        req.setAttribute("HotForType",hotGoods);
    }
    //显示商品详情页
    public void showGoodsForId(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        HttpSession session=req.getSession();
        System.out.println(session);
        System.out.println(session.toString());
        int userid=0;
        if(session.getAttribute("userid")!=null){//userid作用域有值时才进行获取
            userid=(int)session.getAttribute("userid");
            System.out.println(userid);
        }
        Goods goodsDetails=goodsService.showGoodsForId(id);
        goodsService.addOneHot(id);//每点击一次增加一次商品热度
        List<Address> addressList=userService.queryAddressByUser(userid);
        System.out.println(addressList);
        List<Parts> partsList=goodsService.showPartById(id);
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
        Collections.sort(sizeList);//大小进行排序，以便在前端按顺序显示
        req.setAttribute("userAddress",userAddress);
        req.setAttribute("color",colorList);
        req.setAttribute("size",sizeList);
        req.setAttribute("image",imageList);
        req.setAttribute("goodsDetails",goodsDetails);
        req.setAttribute("addressList",addressList);
        req.getRequestDispatcher("/pages/order/goods_details.jsp").forward(req,resp);
    }


    protected void page(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int pageNo=Integer.valueOf(req.getParameter("pageNo"));
        int pageSize=Integer.valueOf(req.getParameter("pageSize"));
        String type=new String(req.getParameter("type").getBytes("iso-8859-1"), "utf-8");
        Page<Goods> page=null;
        if(type.equals("全部商品")){
            page=goodsService.allpage(pageNo,pageSize);
        }else if(type.equals("搜索商品")){
            String name=req.getParameter("name");
            page=goodsService.searchpage(pageNo,pageSize,name);
            req.setAttribute("name",name);
        }else{
            page=goodsService.typepage(pageNo,pageSize,type);
        }
        req.setAttribute("page",page);
        req.setAttribute("type",type);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/order/all_goods.jsp").forward(req,resp);
    }

    protected void showAllGoods(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int pageNo=Integer.valueOf(req.getParameter("pageNo"));
        int pageSize=Integer.valueOf(req.getParameter("pageSize"));
        String type=new String(req.getParameter("type").getBytes("iso-8859-1"), "utf-8");
        Page<Goods> page=null;
        if(type.equals("全部商品")){
            page=goodsService.allpage(pageNo,pageSize);
        }else if(type.equals("搜索商品")){
            String name=req.getParameter("name");
            page=goodsService.searchpage(pageNo,pageSize,name);
            req.setAttribute("name",name);
        }else{
            page=goodsService.typepage(pageNo,pageSize,type);
        }
        req.setAttribute("page",page);
        req.setAttribute("type",type);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/good_m.jsp").forward(req,resp);
    }

    protected void modifyGood(HttpServletRequest req,HttpServletResponse resp)throws ServletException, IOException{
        HashMap<String,String> hashMap=new HashMap<String, String>();//保存表单值HashMap
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
                        if(fileItem.getSize()!=0){//传过来的文件不为空
                            Random random=new Random();
                            String filename=random.nextInt(1000000000)+".jpg";//数据库保存路径
                            fileItem.write(new File("C:/image/good/"+filename));
                            hashMap.put(fileItem.getFieldName(),filename);//保存图片路径到HashMap
                            System.out.println(fileItem.getFieldName());
                            System.out.println(fileItem.getName());
                            System.out.println("文件上传成功");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        int id=Integer.valueOf(hashMap.get("id"));
        String name=hashMap.get("goodname");
        int price=Integer.valueOf(hashMap.get("price"));
        String type=hashMap.get("type");
        String image=hashMap.get("image");
        if(image==null){//没有上传图片情况
            image=goodsService.queryImgById(id);
        }
        goodsService.modifyGoodById(id,name,price,type,image);
        int pageNo=1;
        int pageSize=10;
        Page<Goods> page=null;
        page=goodsService.allpage(pageNo,pageSize);
        req.setAttribute("type","全部商品");
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/good_m.jsp").forward(req,resp);
    }

    protected void deleteGoodById(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        goodsService.deleteGoodById(id);
        int pageNo=1;
        int pageSize=10;
        Page<Goods> page=null;
        page=goodsService.allpage(pageNo,pageSize);
        req.setAttribute("type","全部商品");
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/good_m.jsp").forward(req,resp);
    }

    protected void addGood(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        HashMap<String,String> hashMap=new HashMap<String, String>();//保存表单值HashMap
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
                        if(fileItem.getSize()!=0) {//传过来的文件不为空
                            Random random = new Random();
                            String filename = random.nextInt(1000000000) + ".jpg";//数据库保存路径
                            fileItem.write(new File("C:/image/good/" + filename));
                            hashMap.put(fileItem.getFieldName(), filename);//保存图片路径到HashMap
                            System.out.println(fileItem.getFieldName());
                            System.out.println(fileItem.getName());
                            System.out.println("文件上传成功");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        String name=hashMap.get("goodname");
        int price=Integer.valueOf(hashMap.get("price"));
        String type=hashMap.get("type");
        String image=hashMap.get("image");
        goodsService.addNewGood(new Goods(null,name,price,type,0,image,0));
        int pageNo=1;
        int pageSize=10;
        Page<Goods> page=null;
        page=goodsService.allpage(pageNo,pageSize);
        req.setAttribute("type","全部商品");
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/good_m.jsp").forward(req,resp);
    }

    protected void addPart(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
        HashMap<String,String> hashMap=new HashMap<String, String>();//保存表单值HashMap
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
                        if(fileItem.getSize()!=0){
                            Random random=new Random();
                            String filename=random.nextInt(1000000000)+".jpg";//数据库保存路径
                            fileItem.write(new File("C:/image/good/"+filename));
                            hashMap.put(fileItem.getFieldName(),filename);//保存图片路径到HashMap
                            System.out.println(fileItem.getFieldName());
                            System.out.println(fileItem.getName());
                            System.out.println("文件上传成功");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        int id=Integer.valueOf(hashMap.get("id"));
        String size=hashMap.get("size");
        String color=hashMap.get("color");
        String image=hashMap.get("image");
        goodsService.addPart(id,size,color,image);
        int pageNo=1;
        int pageSize=10;
        Page<Goods> page=null;
        page=goodsService.allpage(pageNo,pageSize);
        req.setAttribute("type","全部商品");
        req.setAttribute("page",page);
        req.setAttribute("pageSize",pageSize);
        req.getRequestDispatcher("/pages/manager/good_m.jsp").forward(req,resp);
    }

}
