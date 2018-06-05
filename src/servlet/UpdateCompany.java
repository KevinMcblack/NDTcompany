package servlet;

import DAO.CompanyDAO;
import JavaBean.CompanyBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/company/UpdateCompany")
public class UpdateCompany extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setHeader("content-type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("UTF-8");
            int companyid = Integer.parseInt(request.getParameter("companyid"));
            String loginname = request.getParameter("loginname");
            String secret = request.getParameter("secret");
            String companyname = request.getParameter("companyname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            CompanyBean companyBean = new CompanyBean();
            companyBean.setCompanyid(companyid);
            companyBean.setSecret(secret);
            companyBean.setLoginname(loginname);
            companyBean.setCompanyname(companyname);
            companyBean.setAddress(address);
            companyBean.setPhone(phone);
            companyBean.setEmail(email);
            CompanyDAO companyDAO = new CompanyDAO();
            companyDAO.updateCompany(companyBean);
            out.print("<script>window.location.href='/company/showCompany.jsp';alert('修改成功！')</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
