package servlet;

import DAO.CompanyDAO;
import JavaBean.CarBean;
import JavaBean.EmployeeBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/company/AddCar")
public class AddCar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int compnayid= (int) session.getAttribute("companyid");
        int driverid=Integer.parseInt(request.getParameter("driverid"));
        String kind=request.getParameter("kind");
        String number =request.getParameter("number");
        CarBean carBean=new CarBean();
        carBean.setCompanyid(compnayid);
        carBean.setKind(kind);
        carBean.setNumber(number);
        carBean.setDriverid(driverid);
        CompanyDAO companyDAO=new CompanyDAO();
        companyDAO.insertCar(carBean);
        out.print("<script>window.location.href='/company/showCar.jsp';alert('添加成功！')</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
