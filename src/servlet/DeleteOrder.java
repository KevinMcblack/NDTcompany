package servlet;

import DAO.OrderDAO;
import com.sun.org.apache.xpath.internal.operations.Or;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id=request.getParameter("id");
        String sql = "delete from `order` where orderid='"+id+"'";
        OrderDAO dao = new OrderDAO();
        dao.updateOrder(sql);
        request.getSession().setAttribute("page",0);
        response.getWriter().print("<script>window.location.href='../ShowOrder';alert('删除订单成功');</script>");
    }
}
