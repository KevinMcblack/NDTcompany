package servlet;

import DAO.CompanyDAO;
import DAO.UserDAO;
import JavaBean.CompanyBean;
import JavaBean.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Registered")
public class Registered extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String loginname = request.getParameter("loginname");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String kind = request.getParameter("kind");
        String sql;
        if(loginname.equals("")||password.equals("")||name.equals("")||phone.equals("")||email.equals("")||kind.equals("")){
            response.getWriter().print("<script>alert('请完善或勾选所有信息');history.go(-1);</script>");
            return;
        }
        if(kind.equals("user")){
            sql="select * from user where loginname='"+loginname+"'";
            UserDAO dao = new UserDAO();
            UserBean bean = dao.queryUser(sql);
            if (bean!=null){
                response.getWriter().print("<script>alert('用户用户名已存在');history.go(-1);</script>");
                return;
            }
            sql = "insert into user (loginname,secret,username,phone,email) values('"+loginname+"','"+password+"','"+name+"','"+phone+"','"+email+"')";
            dao.updateUser(sql);
            response.getWriter().print("<script>alert('用户注册成功');window.location='login.jsp'</script>");
        } else {
            sql ="select * from company where loginname='"+loginname+"'";
            CompanyDAO dao = new CompanyDAO();
            CompanyBean bean = dao.getCompany(sql);
            if (bean!=null){
                response.getWriter().print("<script>alert('公司用户名已存在');history.go(-1);</script>");
                return;
            }
            sql = "insert into company (loginname,secret,companyname,phone,email) values('"+loginname+"','"+password+"','"+name+"','"+phone+"','"+email+"')";
            dao.updateCompany(sql);
            response.getWriter().print("<script>alert('公司注册成功');window.location='login.jsp'</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
