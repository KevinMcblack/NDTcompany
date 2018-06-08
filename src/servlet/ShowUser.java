package servlet;

import DAO.UserDAO;
import JavaBean.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class ShowUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id = session.getAttribute("id").toString();
        String sql = "select * from user where userid='"+id+"'";
        UserDAO dao = new UserDAO();
        UserBean bean=dao.queryUser(sql);
        session.setAttribute("tempUserBean",bean);
        response.sendRedirect("/user/editPersonalInfo.jsp");
    }
}
