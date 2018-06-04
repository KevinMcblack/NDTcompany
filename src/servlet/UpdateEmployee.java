package servlet;

import DAO.CompanyDAO;
import JavaBean.EmployeeBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/company/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setHeader("content-type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("UTF-8");
            int employeeid = Integer.parseInt(request.getParameter("employeeid"));
            int companyid = Integer.parseInt(request.getParameter("companyid"));
            String name = request.getParameter("name");
            String position = request.getParameter("position");
            String phone = request.getParameter("phone");
            EmployeeBean employeeBean=new EmployeeBean();
            employeeBean.setEmployeeid(employeeid);
            employeeBean.setCompanyid(companyid);
            employeeBean.setPosition(position);
            employeeBean.setName(name);
            employeeBean.setPhone(phone);
            CompanyDAO companyDAO=new CompanyDAO();
            companyDAO.updateemployee(employeeBean);
            out.print("<script>window.location.href='/company/showemployee.jsp';alert('修改成功！')</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
