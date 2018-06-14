package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import  DAO.UserDAO;
import JavaBean.UserBean;

@WebServlet("/user/DeleteUser")
public class DeleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            response.setCharacterEncoding("GBK");
            PrintWriter out=response.getWriter();
            request.setCharacterEncoding("UTF-8");
            int id=Integer.parseInt(request.getParameter("id"));

            UserBean userBean = new UserBean();
            userBean.setUserId(id);
            UserDAO dao1 = new UserDAO();
            dao1.deleteUser(userBean);
            out.print("<script>window.location.href='/user/showUser.jsp';alert('该信息删除成功！')</script>");

        }catch(Exception e){
        }
    }
}
