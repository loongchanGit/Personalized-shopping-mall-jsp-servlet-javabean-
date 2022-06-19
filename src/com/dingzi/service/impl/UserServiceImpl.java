package com.dingzi.service.impl;

import com.dingzi.dao.UserDao;
import com.dingzi.dao.impl.UserDaoImpl;
import com.dingzi.pojo.Address;
import com.dingzi.pojo.User;
import com.dingzi.service.UserService;
import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Properties;

public class UserServiceImpl implements UserService {
    private UserDao userDao=new UserDaoImpl();

    public static void sendEmail(String args,int id) throws MessagingException, GeneralSecurityException {
        String Email="1462187972@qq.com";
        String Code="rfhwswopotfsfjbi";
        Properties prop=new Properties();
        prop.setProperty("mail.host","smtp.qq.com");///设置QQ邮件服务器
        prop.setProperty("mail.transport.protocol","smtp");///邮件发送协议
        prop.setProperty("mail.smtp.auth","true");//需要验证用户密码
        //QQ邮箱需要设置SSL加密
        MailSSLSocketFactory sf=new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable","true");
        prop.put("mail.smtp.ssl.socketFactory",sf);
        //使用javaMail发送邮件的5个步骤
        //1.创建定义整个应用程序所需要的环境信息的session对象
        Session session= Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Email,Code);
            }
        });
        //开启session的debug模式，这样可以查看到程序发送Email的运行状态
        session.setDebug(true);
        //2.通过session得到transport对象
        Transport ts=session.getTransport();
        //3.使用邮箱的用户名和授权码连上邮件服务器
        ts.connect("smtp.qq.com",Email,Code);
        //4.创建邮件：写文件
        //注意需要传递session
        MimeMessage message=new MimeMessage(session);
        //指明邮件的发件人
        message.setFrom(new InternetAddress(Email));
        //指明邮件的收件人
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(args));
        //邮件标题
        message.setSubject("钉子网激活账户");
        //邮件的文本内容
        message.setContent("<a href='http://localhost:8080/Mall/userServlet?action=active&id="+id+"'>点击激活</a>","text/html;charset=UTF-8");
        //5.发送邮件
        ts.sendMessage(message,message.getAllRecipients());
        //6.关闭连接
        ts.close();

    }
    @Override
    public void regisUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.queryUserByUsernameAndPassword(user.getUsername(),user.getPassword());
    }

    @Override
    public boolean existsUsername(String username) {
        if(userDao.queryUserByUsername(username)==null){
            return false;
        }else{
            return true;
        }
    }

    @Override
    public List<User> showAllUser() {
        return userDao.queryAllUser();
    }

    @Override
    public int deleteUserById(int id) {
        return userDao.deleteUserById(id);
    }

    @Override
    public int modifyUserById(int id, String username, String password, String telephone) {
        return userDao.modifyUserById(id,username,password,telephone);
    }

    @Override
    public List<Address> queryAddressByUser(int id) {
        return userDao.queryAddressByUser(id);
    }

    @Override
    public User queryUserByActiveToken(String activetoken) {
        return userDao.queryUserByActiveToken(activetoken);
    }

    @Override
    public int queryIdByUsername(String username) {
        return userDao.queryIdByUsername(username);
    }

    @Override
    public int activate(String id) {
        return userDao.activate(id);
    }


}
