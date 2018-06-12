package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import DAO.LoginDAO;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String adminname = request.getParameter("adminName");
        String password = request.getParameter("password");
        if (password.equals("") || adminname.equals("")) {
            response.getWriter().print("<script>alert('管理员名或密码不能为空');window.location='adminLogin.jsp'</script>");
            return;
        }
        HttpSession session = request.getSession();
        String sql = "select loginname,secret from administrator where loginname='" + adminname + "'";
        try {
                ResultSet rs;
                rs = LoginDAO.login(sql);
                if (rs.next()) {
                    if (password.equals(rs.getString(2))) {
                        session.setAttribute("name", adminname);//在session中设置用户名
                        response.sendRedirect("admin/index.jsp");
                    } else {
                        response.getWriter().print("<script>alert('密码错误');window.location='adminLogin.jsp'</script>");
                    }
                } else {
                    response.getWriter().print("<script>alert('无效管理员名'));window.location='adminLogin.jsp'</script>");
                }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("<script>alert('登录出错，请重试'));window.location='adminLogin.jsp'</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
