package DAO;

import JavaBean.OrderBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {
    private DBUtil dbUtil;

    public void insertOrder(String sql){
        dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
    private OrderBean addBean(ResultSet resultSet){
        OrderBean bean = new OrderBean();
        try {
            bean.setOrderId(resultSet.getInt(1));
            bean.setUserId(resultSet.getInt(2));
            bean.setCompanyID(resultSet.getInt(3));
            bean.setCarId(resultSet.getInt(4));
            bean.setDeparture(resultSet.getString(5));
            bean.setDestination(resultSet.getString(6));
            bean.setTime(resultSet.getTimestamp(7));
            bean.setDeliveryTime(resultSet.getString(8));
            bean.setFinishtime(resultSet.getString(9));
            bean.setAmount(resultSet.getInt(10));
            bean.setItemSize(resultSet.getDouble(11));
            bean.setPrice(resultSet.getDouble(12));
            bean.setStatus(resultSet.getString(13));
            bean.setAvailableTime(resultSet.getString(14));
            bean.setAvailableTime1(resultSet.getString(15));
            return bean;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public OrderBean selectOrder(String sql){
        dbUtil = new DBUtil("ndt");
        ResultSet resultSet=dbUtil.query(sql);
        try {
            if(resultSet.next()){
                OrderBean bean = addBean(resultSet);
                resultSet.close();
                dbUtil.close();
                return bean;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<OrderBean> selectAllOrder(){
        dbUtil = new DBUtil("ndt");
        ArrayList<OrderBean> arrayList = new ArrayList<>();
        String sql = "select * from `order`";
        ResultSet resultSet=dbUtil.query(sql);
        try {
            while(resultSet.next()){
                OrderBean bean = addBean(resultSet);
                arrayList.add(bean);
            }
            resultSet.close();
            dbUtil.close();
            return arrayList;
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void deleteOrder(String sql){
        dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }

    public void updateOrder(String sql){
        dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
}
