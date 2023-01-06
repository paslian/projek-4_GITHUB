/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author hp
 */
public class TransactionQuery {
        public String create = "INSERT INTO transaction ( customer_name, id_product , total_order"
                            + ", total_amount ) VALUES (?,?,?,?)";

    public String get = "SELECT * FROM relasi";
    public String getByName = "SELECT * FROM relasi where customer_name LIKE ?";
}
