package servlet;

import DAO.OrderDAO;
import JavaBean.OrderBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class ShowOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();
        ArrayList<OrderBean> res;

        if (session.getAttribute("companyid") == null) {
            String id = session.getAttribute("userid").toString();
            String sql = "select * from `order` where userid=" + id;
            res = dao.selectAllOrder(sql);
        } else {
            String id = session.getAttribute("companyid").toString();
            String sql = "select * from `order` where companyid=" + id;
            res = dao.selectAllOrder(sql);
        }
        int page;
        if (session.getAttribute("page") == null) {
            session.setAttribute("page", 0);
            page = 0;
        } else {
            page = Integer.parseInt(session.getAttribute("page").toString());
        }
        session.setAttribute("res", res);
        if (session.getAttribute("companyid") == null) {
            response.sendRedirect("user/showOrder.jsp?page=" + page + "");
        } else {
            response.sendRedirect("company/showOrder.jsp?page=" + page + "");
        }
    }
}
