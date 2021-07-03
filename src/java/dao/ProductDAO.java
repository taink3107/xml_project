/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Year;

/**
 *
 * @author taink
 */
public class ProductDAO {

    BrandDAO brandDAO = new BrandDAO();
    CategoryDAO cateDAO = new CategoryDAO();

    Product getOneProduct(int aInt) {
        String query = "SELECT * FROM production.products as prd\n"
                + "WHERE prd.product_id = ? ";

        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, aInt);
                ResultSet rs = ps.executeQuery();
                Product p = new Product();
                while (rs != null && rs.next()) {
                     p.setProduct_id(rs.getInt("product_id"));
                    p.setProduct_name(rs.getString("product_name")); 
                    p.setBrand(brandDAO.getOneById(rs.getInt("brand_id")));
                    p.setCategory(cateDAO.getOneById(rs.getInt("category_id")));
                    p.setList_price(rs.getDouble("list_price"));
                    p.setModel_year(rs.getInt("model_year"));
                }
                 return p;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        ProductDAO dAO = new ProductDAO();
        System.out.println(dAO.getOneProduct(1));
    }

}
