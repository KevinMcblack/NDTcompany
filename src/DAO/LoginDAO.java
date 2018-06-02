package DAO;

import java.sql.ResultSet;

public class LoginDAO {
    private static DBUtil db= new DBUtil("ndt");
    public LoginDAO() {

    }
    public static ResultSet login(String sql){
       return db.query(sql);
    }
}
