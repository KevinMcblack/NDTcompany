package DAO;

import JavaBean.OrderBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class OrderDAO {
    DBUtil dbUtil;
    /**插入订单*/
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
        String sql = "insert into `order` (userid,companyid,departure,destination,itemamount,itemsize,status,availabletime,availabletime1) values"+
                "('"+userID+"','"+companyID+"','"+departure+"','"+destination+"','"+amount+"','"+size+"','"+status+"','"+time+"','"+time1+"')";
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
            bean.setDeliveryTime(resultSet.getTimestamp(8));
            bean.setFinishtime(resultSet.getTimestamp(9));
            bean.setAmount(resultSet.getInt(10));
            bean.setItemSize(resultSet.getDouble(11));
            bean.setPrice(resultSet.getDouble(12));
            bean.setStatus(resultSet.getString(13));
            bean.setAvailableTime(resultSet.getDate(14));
            bean.setAvailableTime1(resultSet.getTime(15));
            return bean;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    /** 查询订单*/
    public OrderBean selectOrder(String orderID){
        dbUtil = new DBUtil("ndt");
        String sql="select * from `order` where orderid='"+orderID+"'";
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
    /** 查询所有订单返回转化后的结果*/
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
    /** 删除订单*/
    public void deleteOrder(String orderID){
        dbUtil = new DBUtil("ndt");
        String sql = "delete from `order` where orderid = '"+orderID+"'";
        dbUtil.update(sql);
        dbUtil.close();
    }
    /** 更新订单
     * 根据参数中的code和目标订单的状态决定可修改的字段
     * 当code=0，status=等待收件，公司用户点击发货，可修改deliverytime（当前时间）,carid,status,price
     * 当code=0,status=已发货，公司确认货物送达
     * 当code=1，status=等待收件，公司修改目的地destination
     * 当code=2，status=等待收件，用户修改订单基本信息
     * 当code=3，status=已发货，用户确认收货*/
    public int updateOrder(int code,String orderID,OrderBean bean){
        dbUtil = new DBUtil("ndt");
        String sql = "select status from `order` where orderid='"+orderID+"'";
        ResultSet resultSet = dbUtil.query(sql);
        try {
            String status = resultSet.getString(1);
            if(!status.equals("等待收件"))
                return 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        switch (code){
            case 0:sql="update `order` set deliverytime=now()";
                break;
            case 1:
                break;
            case 2:
                break;
            default: return 0;
        }
        return 1;
    }
}
