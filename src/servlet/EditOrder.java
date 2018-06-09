package servlet;

import DAO.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EditOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String kind = session.getAttribute("kind").toString();
        int code = Integer.parseInt(request.getParameter("code"));
        String id=request.getParameter("id");//获取订单id
        OrderDAO dao = new OrderDAO();
        System.out.println("enter servlet");
        if(kind.equals("user")){
            if(code==1){
                String page = request.getParameter("page");
                String destination = request.getParameter("destination");
                String amount = request.getParameter("amount");
                String size = request.getParameter("itemSize");
                String availableTime = request.getParameter("availableTime");
                String availableTime1 = request.getParameter("availableTime1");
                String sql = "update `order` set destination='"+destination+"',itemamount='"+amount+"',itemsize='"+size+"'," +
                        "availableTime='"+availableTime+"',availableTime1='"+availableTime1+"' where orderid='"+id+"'";
                dao.updateOrder(sql);
                session.setAttribute("page",page);
                response.getWriter().print("<script>alert('修改订单成功');</script>");
                response.sendRedirect("../ShowOrder");
            } else if(code == 2){
                String status = "已完成";
                String sql = "update `order` set status = '"+status+"' where orderid='"+id+"'";
                dao.updateOrder(sql);
                response.getWriter().print("<script>alert('确认收货成功');</script>");
            }
        } else {
            if(code==1){
                String status = "已发货";
                String carid= request.getParameter("carid");
                String price=request.getParameter("price");
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                String deliveryTime = format.format(new Date());
                String sql = "update `order` set status = '"+status+"',carid='"+carid+"',price='"+price+"',deliverytime='"+deliveryTime+"' where orderid='"+id+"'";
                dao.updateOrder(sql);
                response.getWriter().print("<script>alert('发货成功');</script>");
            } else if(code==2){
                String status = "已送达";
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                String finishtime = format.format(new Date());
                String sql = "update `order` set status = '"+status+"',finishtime='"+finishtime+"' where orderid='"+id+"'";
                dao.updateOrder(sql);
                response.getWriter().print("<script>alert('送达成功');</script>");
            } else if(code ==3){

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
