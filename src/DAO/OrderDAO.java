package DAO;

import JavaBean.OrderBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class OrderDAO {
    DBUtil dbUtil;
    public void insertOrder(OrderBean bean){
        dbUtil = new DBUtil("ndt");
        int userID=bean.getUserId();
        int companyID=bean.getCompanyID();
        String departure=bean.getDeparture();
        String destination=bean.getDestination();
        int amount=bean.getAmount();
        Double size = bean.getItemSize();
        String status="等待收件";
        Date time=bean.getAvailableTime();
        Date time1=bean.getAvailableTime1();
        String sql = "insert into order (userid,companyid,departure,destination,itemamount,itemsize,status,availabletime,availabletime1) values"+
                "('"+userID+"','"+companyID+"','"+departure+"','"+destination+"','"+amount+"','"+size+"','"+status+"','"+time+"','"+time1+"')";
        dbUtil.update(sql);
        dbUtil.close();
    }
    public OrderBean selectOrder(String orderID){
        dbUtil = new DBUtil("ndt");
        OrderBean bean = new OrderBean();
        String sql="select * from order where orderid='"+orderID+"'";
        ResultSet resultSet=dbUtil.query(sql);
        try {
            if(resultSet.next()){
                bean.setOrderId(resultSet.getInt(1));
                bean.setUserId(resultSet.getInt(2));
                bean.setCompanyID(resultSet.getInt(3));
                bean.setDeparture(resultSet.getString(4));
                bean.setDestination(resultSet.getString(5));
                bean.setTime(resultSet.getTimestamp(6));
                bean.setDeliveryTime(resultSet.getTimestamp(7));
                bean.setAmount(resultSet.getInt(8));
                bean.setItemSize(resultSet.getDouble(9));
                bean.setPrice(resultSet.getDouble(10));
                bean.setStatus(resultSet.getString(11));
                bean.setAvailableTime(resultSet.getDate(12));
                bean.setAvailableTime1(resultSet.getTime(13));
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
    public ArrayList<OrderBean> selectAllOrder(String orderID){
        ArrayList<OrderBean> arrayList = new ArrayList<>();
        String sql = "select * from order";
        ResultSet resultSet=dbUtil.query(sql);
        try {
            while(resultSet.next()){
                OrderBean bean = new OrderBean();
                bean.setOrderId(resultSet.getInt(1));
                bean.setUserId(resultSet.getInt(2));
                bean.setCompanyID(resultSet.getInt(3));
                bean.setDeparture(resultSet.getString(4));
                bean.setDestination(resultSet.getString(5));
                bean.setTime(resultSet.getTimestamp(6));
                bean.setDeliveryTime(resultSet.getTimestamp(7));
                bean.setAmount(resultSet.getInt(8));
                bean.setItemSize(resultSet.getDouble(9));
                bean.setPrice(resultSet.getDouble(10));
                bean.setStatus(resultSet.getString(11));
                bean.setAvailableTime(resultSet.getDate(12));
                bean.setAvailableTime1(resultSet.getTime(13));
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
    public void deleteOrder(String orderID){
        dbUtil = new DBUtil("ndt");
        String sql = "delete from order where orderid = '"+orderID+"'";
        dbUtil.update(sql);
        dbUtil.close();
    }
    public void updateOrder(String orderID,OrderBean bean){
        dbUtil = new DBUtil("ndt");
        String sql = "select status from order where orderid='"+orderID+"'";
        ResultSet resultSet = dbUtil.query(sql);

    }
}
