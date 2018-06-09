package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import JavaBean.EvaluationBean;
import DAO.EvaluationDAO;
@WebServlet("/evaluation/DeleteEvaluation")
public class DeleteEvaluation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            response.setCharacterEncoding("GBK");
            PrintWriter out=response.getWriter();
            request.setCharacterEncoding("UTF-8");
            int id=Integer.parseInt(request.getParameter("id"));

            EvaluationBean evaluationBean = new EvaluationBean();
            evaluationBean.setEvaluationId(id);
            EvaluationDAO dao1 = new EvaluationDAO();
            dao1.deleteEvaluation(evaluationBean);

            out.print("删除成功");
            response.sendRedirect("/evaluation/showEvaluation.jsp");

        }catch(Exception e){
        }
    }
}
