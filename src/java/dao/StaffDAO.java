/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Customer;
import entity.Staff;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author taink
 */
public class StaffDAO {
    
    StoreDAO dAO = new StoreDAO();
    
    public Staff getById(int id) {
        String query = "SELECT * FROM sales.staffs as staff\n"
                + "WHERE staff.staff_id = ?";
        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                Staff c = new Staff();
                while (rs != null && rs.next()) {
                    c.setActive(rs.getString("active"));
                    c.setEmail(rs.getString("email"));
                    c.setFirst_name(rs.getString("first_name"));
                    c.setLast_name(rs.getString("last_name"));
                    c.setManager_id(rs.getInt("manager_id"));
                    c.setPhone(rs.getString("phone"));
                    c.setStaff_id(rs.getInt("staff_id"));
                    c.setStore(dAO.getById(rs.getInt("store_id")));
                }
                return c;
            }
            
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        StaffDAO dAO = new StaffDAO();
        System.out.println(dAO.getById(1));
    }
}
