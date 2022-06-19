package com.dingzi.web;

import com.dingzi.dao.UserDao;
import com.dingzi.dao.impl.UserDaoImpl;
import com.dingzi.pojo.User;
import com.dingzi.service.UserService;
import com.dingzi.service.impl.UserServiceImpl;
import com.dingzi.utils.WebUtils;
import com.dingzi.utils.md5Utils;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.util.Iterator;
import java.util.List;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {
    private UserService userService=new UserServiceImpl();
    /**
     * 处理登录的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String password=md5Utils.convertMD5(req.getParameter("password"));
        String code=req.getParameter("code");
        String token=(String)req.getSession().getAttribute(KAPTCHA_SESSION_KEY);//获取kaptcha保存在session中随机生成的验证码
        User loginUser= userService.login(new User(null,username,password,null,null,null));
        if(code.equalsIgnoreCase(token)){
            if(loginUser==null){//失败
                req.setAttribute("msg","用户名或密码错误");
                req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            }else{//成功
                if(loginUser.getState().equals("未激活")){
                    PrintWriter out = resp.getWriter();
                    out.print("<script>alert('账号未激活，请激活后再登录!');window.location.href='pages/user/login.jsp'</script>");
                }else{
                    req.setAttribute("msg","登陆成功");
                    HttpSession session=req.getSession();
                    session.setAttribute("username",username);//保存用户名到session作用域
                    session.setAttribute("telephone",loginUser.getTelephone());
                    session.setAttribute("userid",loginUser.getId());
                    req.getRequestDispatcher("/pages/index.jsp").forward(req,resp);
                }
            }
        }else{
            req.setAttribute("msg","验证码错误！");
            req.setAttribute("username",username);//保存属性以便回显操作
            req.setAttribute("password",password);
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);//跳回注册页面
        }

    }

    /**
     * 处理注册的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, GeneralSecurityException, MessagingException {
        String username=req.getParameter("username");
        String password=new String(md5Utils.convertMD5(req.getParameter("password")).getBytes("iso-8859-1"), "utf-8");
        String telephone=req.getParameter("telephone");
        String email=req.getParameter("email");
        User user=new User(null,username,password,telephone,email,"未激活");
            if(userService.existsUsername(username)){
                req.setAttribute("msg","用户名"+username+"已存在");
                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req,resp);//跳回注册页面
            }else{
                userService.regisUser(user);
                int id=userService.queryIdByUsername(username);
                UserServiceImpl.sendEmail(user.getEmail(),id);
                resp.getWriter().write("请验证邮箱完成账号注册");
            }

    }

    public void showAllUser(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        List<User> userlist=userService.showAllUser();
        for(int i=0;i<userlist.size();i++){
            String password=md5Utils.convertMD5(userlist.get(i).getPassword());
            userlist.get(i).setPassword(password);
        }
        req.setAttribute("userlist",userlist);
        req.getRequestDispatcher("/pages/manager/user_m.jsp").forward(req,resp);
    }

    protected void signOut(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        HttpSession session=req.getSession();
        session.setAttribute("username","");//清除username作用域
        req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
    }

    protected void deleteUser(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        PrintWriter out = resp.getWriter();
        userService.deleteUserById(id);
        showAllUser(req,resp);
    }

    protected void modifyUser(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        String username=req.getParameter("username");
        String password=md5Utils.convertMD5(req.getParameter("password"));
        String telephone=req.getParameter("telephone");
        userService.modifyUserById(id,username,password,telephone);
        showAllUser(req,resp);
    }

    protected void queryAddressByUser(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        int id=Integer.valueOf(req.getParameter("id"));
        userService.queryAddressByUser(id);
    }
    //激活邮箱servlet
    protected void active(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String id=req.getParameter("id");
        userService.activate(id);
        PrintWriter out = resp.getWriter();
        out.print("<script>alert('激活账号成功，请使用激活成功账号登录!');window.location.href='pages/user/login.jsp'</script>");
    }

}
