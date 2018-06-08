package DAO;

import JavaBean.OrderBean;
import JavaBean.UserBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    private DBUtil dbUtil;
    public void updateUser(String sql){
        dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
    private UserBean init(ResultSet resultSet){
        UserBean bean = new UserBean();
        try {
            bean.setUserId(resultSet.getInt("userid"));
            bean.setLoginName(resultSet.getString("loginname"));
            bean.setSecret(resultSet.getString("secret"));
            bean.setUsername(resultSet.getString("username"));
            bean.setPhone(resultSet.getString("phone"));
            bean.setSex(resultSet.getString("sex"));
            bean.setEmail(resultSet.getString("email"));
            return bean;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public UserBean queryUser(String sql){
        dbUtil=new DBUtil("ndt");
        ResultSet resultSet=dbUtil.query(sql);
        UserBean bean;
        try {
            if (resultSet.next()){
                bean=init(resultSet);
                return bean;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList<UserBean> queryAllUser(String sql) throws SQLException {
        dbUtil=new DBUtil("ndt");
        ResultSet resultSet=dbUtil.query(sql);
        ArrayList<UserBean> arrayList = new ArrayList<>();
        while(resultSet.next()){
            UserBean bean;
            bean=init(resultSet);
            arrayList.add(bean);
        }
        return arrayList;
    }
}
