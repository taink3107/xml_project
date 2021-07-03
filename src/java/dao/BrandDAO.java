/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Brand;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author taink
 */
public class BrandDAO {

    Brand getOneById(int aInt) {
        String query = "SELECT * FROM production.brands as prd\n"
                + "WHERE prd.brand_id = ?";

        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, aInt);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Brand brand = new Brand();
                    brand.setBrand_id(rs.getInt("brand_id"));
                    brand.setBrand_name(rs.getString("brand_name"));
                    return brand;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

}
