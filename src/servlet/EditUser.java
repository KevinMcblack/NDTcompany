package servlet;

import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql="update user set ";
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id=request.getSession().getAttribute("id").toString();
        String username = request.getParameter("username");
        sql=sql+"username='"+username+"'";
        String password = request.getParameter("password");
        String password1;
        if (!password.equals("")){
            password1=request.getParameter("password1");
            if(!password.equals(password1))
                response.getWriter().print("<script>alert('密码不一致');window.history.back(-1);</script>");
            else
                sql=sql+",secret='"+password+"'";
        }
        String phone=request.getParameter("phone");
        sql=sql+",phone='"+phone+"'";
        String sex=request.getParameter("sex");
        sql=sql+",sex='"+sex+"'";
        String email=request.getParameter("email");
        sql=sql+",email='"+email+"' where userid='"+id+"'";
        UserDAO dao = new UserDAO();
        dao.updateUser(sql);
        response.getWriter().print("");
        response.getWriter().print("<script>alert('信息更新成功');</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
