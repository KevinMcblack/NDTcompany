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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AddOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int userId = (Integer)session.getAttribute("userid");
        int companyId = Integer.parseInt(session.getAttribute("companyId").toString());
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        int amount = Integer.parseInt(request.getParameter("amount"));
        Double size = Double.parseDouble(request.getParameter("itemSize"));
        String status = "等待收件";
        String time = request.getParameter("availableTime");
        String time1= request.getParameter("availableTime1");
        time=time.replace("T"," ");
        time1=time1.replace("T"," ");
        OrderDAO dao = new OrderDAO();
        String sql = "insert into `order` (userid,companyid,departure,destination,itemamount,itemsize,status,availabletime,availabletime1) values"+
                "('"+userId+"','"+companyId+"','"+departure+"','"+destination+"','"+amount+"','"+size+"','"+status+"','"+time+"','"+time1+"')";
        dao.updateOrder(sql);
        response.getWriter().print("<script>alert('生成订单成功');</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
