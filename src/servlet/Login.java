package servlet;

import DAO.LoginDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (password.equals("") || username.equals("")) {
            response.getWriter().print("<script>alert('用户名或密码不能为空');window.location='login.jsp'</script>");
            return;
        }
        String kind = request.getParameter("kind");
        if (kind == null) {
            response.getWriter().print("<script>alert('请选择用户类型');window.location='login.jsp'</script>");
            return;
        }
        HttpSession session = request.getSession();
        String sql;
        try {
            ResultSet rs;
            if (kind.equals("user")) {
                session.removeAttribute("companyid");
                sql = "select secret,userid from user where loginname='" + username + "'";
                rs = LoginDAO.login(sql);
                if (rs.next()) {
                    if (password.equals(rs.getString(1))) {
                        session.setAttribute("name", username);//在session中设置用户名
                        session.setAttribute("kind", kind);//设置用户类型
                        System.out.println("kind=" + kind);
                        session.setAttribute("userid", rs.getInt("userid"));//在session中设置id
                        response.sendRedirect(kind + ".jsp");
                    } else {
                        response.getWriter().print("<script>alert('密码错误');window.location='login.jsp'</script>");
                    }
                } else {
                    response.getWriter().print("<script>alert('用户不存在，请先注册'));window.location='login.jsp'</script>");
                }
            } else {
                session.removeAttribute("userid");
                sql = "select secret,companyid from company where loginname='" + username + "'";
                rs = LoginDAO.login(sql);
                if (rs.next()) {
                    if (password.equals(rs.getString(1))) {
                        session.setAttribute("name", username);//在session中设置用户名
                        session.setAttribute("kind", kind);//设置用户类型
                        System.out.println("kind=" + kind);
                        session.setAttribute("companyid", rs.getInt("companyid"));//在session中设置id
                        response.sendRedirect(kind + ".jsp");
                    } else {
                        response.getWriter().print("<script>alert('密码错误');window.location='login.jsp'</script>");
                    }
                } else {
                    response.getWriter().print("<script>alert('用户不存在，请先注册'));window.location='login.jsp'</script>");
                }
            }
            System.out.println("kind=" + kind);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("<script>alert('登录出错，请重试'));window.location='login.jsp'</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
