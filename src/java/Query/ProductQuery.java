/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author hp
 */
public class ProductQuery {
    public String get = "SELECT * FROM product";
    public String create = "INSERT INTO product (name, " + 
            "stock, price, expired) VALUES (?, ?, ?, ?)";
    public String getByName = "SELECT * FROM product where name LIKE ?";
    public String getById = "SELECT * FROM product where id_product = ?";   
    public String update = "UPDATE product SET name = ?, "
            + "stock = ?, price = ?, expired = ? WHERE id_product = ?";
    public String delete = "DELETE FROM product WHERE id_product = ?";
    public String update_stock = "UPDATE product SET stock = ? WHERE id_product = ?";
}
