package DAO;

import JavaBean.EvaluationBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EvaluationDAO {
    /*
    遍历查询结果集到ArrayList中
     */
    public ArrayList<EvaluationBean> getAllEvaluation() {
        String sql = "select * from evaluation";
        DBUtil dbUtil = new DBUtil("ndt");
        ResultSet rs = dbUtil.query(sql);
        ArrayList<EvaluationBean> arrayList = new ArrayList<>();
        try {
            while (rs.next()) {
                EvaluationBean evaluationBean = new EvaluationBean();
                evaluationBean.setEvaluationId(rs.getInt("evaluationId"));
                evaluationBean.setUserId(rs.getInt("userId"));
                evaluationBean.setCompanyId(rs.getInt("companyId"));
                evaluationBean.setOrderId(rs.getInt("orderId"));
                evaluationBean.setTime(rs.getDate("time"));
                evaluationBean.setTitle(rs.getString("title"));
                evaluationBean.setContent(rs.getString("content"));
                evaluationBean.setPhoto1(rs.getString("photo1"));


                arrayList.add(evaluationBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.close();
        return arrayList;
    }
    /*
    删除评价
     */
    public void deleteEvaluation(EvaluationBean evaluationBean){
        String sql = "delete from evaluation where evaluationid = '"+evaluationBean.getEvaluationId()+"'";
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
    /*
    增加评价
     */
    public void insertEvaluation(EvaluationBean evaluationBean) {
        String sql = "insert into evaluation(userid,companyid,orderid,title,content,photo1) values ('" + evaluationBean.getUserId() + "'," +
                "'" + evaluationBean.getCompanyId() + "','" + evaluationBean.getOrderId() + "','" + evaluationBean.getTitle() + "'" +
                ",'" + evaluationBean.getContent() + "','" + evaluationBean.getPhoto1() + "')";
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
}
