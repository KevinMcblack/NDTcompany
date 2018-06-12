package DAO;

import JavaBean.CarBean;
import JavaBean.CompanyBean;
import JavaBean.EmployeeBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CompanyDAO {
    private CompanyBean init(ResultSet rs){
        CompanyBean companyBean = new CompanyBean();
        try {
            if (rs.next()) {
                int companyid = rs.getInt("companyid");
                String loginname = rs.getString("loginname");
                String secret = rs.getString("secret");
                String companyname = rs.getString("companyname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                companyBean.setCompanyid(companyid);
                companyBean.setLoginname(loginname);
                companyBean.setSecret(secret);
                companyBean.setCompanyname(companyname);
                companyBean.setAddress(address);
                companyBean.setPhone(phone);
                companyBean.setEmail(email);
            } else {
                return null;
            }
            return companyBean;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updateCompany(String sql){
        DBUtil dbUtil;
        dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
    public CompanyBean getCompany(int companyId) {
        String sql = "select * from company where companyid='" + companyId + "'";
        DBUtil dbUtil = new DBUtil("ndt");
        ResultSet rs = dbUtil.query(sql);
        return init(rs);
    }

    public ArrayList<CompanyBean> getAllCompany() {
        String sql = "select * from company";
        DBUtil dbUtil = new DBUtil("ndt");
        ResultSet rs = dbUtil.query(sql);
        ArrayList<CompanyBean> arrayList = new ArrayList<>();
        try {
            while (rs.next()) {
                CompanyBean companyBean = new CompanyBean();
                int companyid = rs.getInt("companyid");
                String loginname = rs.getString("loginname");
                String secret = rs.getString("secret");
                String companyname = rs.getString("companyname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                companyBean.setCompanyid(companyid);
                companyBean.setLoginname(loginname);
                companyBean.setSecret(secret);
                companyBean.setCompanyname(companyname);
                companyBean.setAddress(address);
                companyBean.setPhone(phone);
                companyBean.setEmail(email);
                arrayList.add(companyBean);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        dbUtil.close();
        return arrayList;
    }

    public ArrayList<EmployeeBean> getCompanyEmployee(int companyid) {
        String sql = "select * from employee where companyid=" + companyid;
        DBUtil dbUtil = new DBUtil("ndt");
        ResultSet rs = dbUtil.query(sql);
        ArrayList<EmployeeBean> arrayList = new ArrayList<>();
        try {
            while (rs.next()) {
                EmployeeBean employeeBean = new EmployeeBean();
                int employeeid = rs.getInt("employeeid");
                String name = rs.getString("name");
                String position = rs.getString("position");
                String phone = rs.getString("phone");
                employeeBean.setName(name);
                employeeBean.setPhone(phone);
                employeeBean.setPosition(position);
                employeeBean.setCompanyid(companyid);
                employeeBean.setEmployeeid(employeeid);
                arrayList.add(employeeBean);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        dbUtil.close();
        return arrayList;
    }

    public CompanyBean getCompany(String sql){
        DBUtil dbUtil = new DBUtil("ndt");
        ResultSet rs = dbUtil.query(sql);
       return init(rs);
    }
    public ArrayList<CarBean> getCompanyCar(int companyid) {
        String sql = "select * from car where companyid=" + companyid;
        DBUtil dbUtil = new DBUtil("ndt");
        ResultSet rs = dbUtil.query(sql);
        ArrayList<CarBean> arrayList = new ArrayList<>();
        try {
            while (rs.next()) {
                CarBean carBean = new CarBean();
                int carid = rs.getInt("carid");
                int driverid = rs.getInt("driverid");
                String kind = rs.getString("kind");
                String number = rs.getString("number");
                carBean.setKind(kind);
                carBean.setNumber(number);
                carBean.setCarid(carid);
                carBean.setDriverid(driverid);
                arrayList.add(carBean);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        dbUtil.close();
        return arrayList;
    }

    public void updateCompany(CompanyBean companyBean) {
        System.out.println(companyBean.getCompanyid());
        String sql = "update company set loginname='" + companyBean.getLoginname() + "',secret='" + companyBean.getSecret() + "'," +
                "companyname='" + companyBean.getCompanyname() + "',address='" + companyBean.getAddress() + "',phone='" + companyBean.getPhone() + "'," +
                "email='" + companyBean.getEmail() + "' where companyid=" + companyBean.getCompanyid();
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }

    public void updateEmployee(EmployeeBean employeeBean) {
        String sql = "update employee set name='" + employeeBean.getName() + "'," +
                "position='" + employeeBean.getPosition() + "',phone='" + employeeBean.getPhone() + "' where employeeid=" + employeeBean.getEmployeeid();
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }

    public void updateCar(CarBean carBean) {
        String sql = "update car set carid='" + carBean.getCarid() + "',driverid='" + carBean.getDriverid() + "'," +
                "kind='" + carBean.getKind() + "',number='" + carBean.getNumber() + "' where carid=" + carBean.getCarid();
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }

    public void insertEmployee(EmployeeBean employeeBean) {
        String sql = "insert into employee values (null,'" + employeeBean.getCompanyid() + "'," +
                "'" + employeeBean.getName() + "','" + employeeBean.getPosition() + "','" + employeeBean.getPhone() + "')";
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }

    public void insertCar(CarBean carBean) {
        String sql = "insert into car values (null,'" + carBean.getDriverid() + "','" + carBean.getCompanyid() + "','" + carBean.getKind() + "'" +
                ",'" + carBean.getNumber() + "')";
        DBUtil dbUtil = new DBUtil("ndt");
        dbUtil.update(sql);
        dbUtil.close();
    }
}
