package servlet;

import DAO.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/DeleteOrder2")
public class DeleteOrder2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String id=request.getParameter("id");
        String sql = "delete from `order` where orderid='"+id+"'";
        OrderDAO dao = new OrderDAO();
        dao.updateOrder(sql);
        out.print("<script>window.location.href='/user/showOrder2.jsp';alert('该信息删除成功！')</script>");
    }
}
