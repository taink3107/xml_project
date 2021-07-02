/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Customer;
import entity.Order;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author taink
 */
public class CustomerDAO {

    public Customer getById(int id) {
        String query = "SELECT * FROM sales.customers as cus\n"
                + "WHERE cus.customer_id = ?";
        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                Customer c = new Customer();
                while (rs != null && rs.next()) {
                    c.setCustomer_id(rs.getInt("customer_id"));
                    c.setEmail(rs.getString("email"));
                    c.setFirst_name(rs.getString("first_name"));
                    c.setLast_name(rs.getString("last_name"));
                    c.setPhone(rs.getString("phone"));
                    c.setState(rs.getString("state"));
                    c.setStreet(rs.getString("street"));
                    c.setZip_code(rs.getString("zip_code"));
                }
                return c;
            }

        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        CustomerDAO dAO = new CustomerDAO();
        System.out.println(dAO.getById(94));
    }
}
