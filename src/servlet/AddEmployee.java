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

@WebServlet("/company/AddEmployee")
public class AddEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        int employeeid = Integer.parseInt(request.getParameter("employeeid"));
        int compnayid=Integer.parseInt(request.getParameter("companyid"));
        String name=request.getParameter("name");
        String position =request.getParameter("position");
        String phone=request.getParameter("phone");
        EmployeeBean employeeBean=new EmployeeBean();
        employeeBean.setPhone(phone);
        employeeBean.setName(name);
        employeeBean.setPosition(position);
        employeeBean.setCompanyid(compnayid);
        employeeBean.setEmployeeid(employeeid);
        CompanyDAO companyDAO=new CompanyDAO();
        companyDAO.insertEmployee(employeeBean);
        out.print("<script>window.location.href='/company/showEmployee.jsp';alert('添加成功！')</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
