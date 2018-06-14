package servlet;

import DAO.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/DeleteCompany")
public class DeleteCompany extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM company WHERE companyid = " + id;
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
        out.print("<script>window.location.href='/admin/showgongsi.jsp';alert('该信息删除成功！')</script>");
    }
}
