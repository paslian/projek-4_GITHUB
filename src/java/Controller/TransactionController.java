/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Helper.StringHelper;
import Model.TransactionModel;
import Query.TransactionQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hp
 */
public class TransactionController extends BaseController {

    TransactionQuery query = new TransactionQuery ();

    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }

        public boolean create(TransactionModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getCustomer());
        map.put(2, model.getId_product());
        map.put(3, model.getTotalorder());
        map.put(4, model.getTotalamount());
        
        String sql = this.query.create;
        
        return this.preparedStatement(map, sql);
    }

    public ResultSet getByName(String name) {
        String sql = this.query.getByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(name));
        
        return this.getWithParameter(map, sql);
    }
}
