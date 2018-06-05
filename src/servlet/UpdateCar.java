package servlet;

import DAO.CompanyDAO;
import JavaBean.CarBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/company/UpdateCar")
public class UpdateCar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setHeader("content-type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("UTF-8");
            int carid = Integer.parseInt(request.getParameter("carid"));
            int driverid = Integer.parseInt(request.getParameter("driverid"));
            String kind = request.getParameter("kind");
            String number = request.getParameter("number");
            CarBean carBean = new CarBean();
            carBean.setDriverid(driverid);
            carBean.setCarid(carid);
            carBean.setNumber(number);
            carBean.setKind(kind);
            CompanyDAO companyDAO = new CompanyDAO();
            companyDAO.updateCar(carBean);
            out.print("<script>window.location.href='/company/showCar.jsp';alert('修改成功！')</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
