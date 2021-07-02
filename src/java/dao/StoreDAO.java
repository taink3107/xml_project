/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Staff;
import entity.Store;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author taink
 */
public class StoreDAO {

    public Store getById(int id) {
        String query = "SELECT * FROM sales.stores as stos\n"
                + "WHERE stos.store_id = ?";
        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, id);
                ResultSet rs = ps.executeQuery();
                Store c = new Store();
                while (rs != null && rs.next()) {
                    c.setCity(rs.getString("city"));
                    c.setEmail(rs.getString("email"));
                    c.setPhone(rs.getString("phone"));
                    c.setState(rs.getString("state"));
                    c.setStore_id(rs.getInt("store_id"));
                    c.setStore_name(rs.getString("store_name"));
                    c.setStreet(rs.getString("street"));
                    c.setZip_code(rs.getString("zip_code"));
                }
                return c;
            }

        } catch (Exception e) {
        }
        return null;
    }
}
