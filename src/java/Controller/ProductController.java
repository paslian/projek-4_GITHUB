/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Helper.StringHelper;
import Model.ProductModel;
import Query.ProductQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hp
 */
public class ProductController extends BaseController {
    
    ProductQuery query = new ProductQuery();
    
    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }

    public boolean create(ProductModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getStock());
        map.put(3, model.getPrice());
        map.put(4, model.getExpired());
        
        String sql = this.query.create;
        
        return this.preparedStatement(map, sql);
    }
    public ResultSet getByName(String name) {
        String sql = this.query.getByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(name));
        
        return this.getWithParameter(map, sql);
    }
    public ResultSet getById(String id) {
        String sql = this.query.getById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean update(String id, ProductModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getStock());
        map.put(3, model.getPrice());
        map.put(4, model.getExpired());
        map.put(5, id);
        
        String sql = this.query.update;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean delete(String id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        String sql = this.query.delete;
        return this.preparedStatement(map, sql);
    }

    public boolean update_stock(String id, ProductModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getRemaining_stock());
        map.put(2, id);
        
        String sql = this.query.update_stock;
        
        return this.preparedStatement(map, sql);
    }
}
