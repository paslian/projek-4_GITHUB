/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hp
 */
public class TransactionModel {
    private String customer;
    private String id_product;
    private String totalorder;
    private String totalamount;

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getCustomer() {
        return customer;
    }

    public void setId_product(String id_produt) {
        this.id_product = id_produt;
    }

    public void setTotalamount(String totalamount) {
        this.totalamount = totalamount;
    }

    public void setTotalorder(String totalorder) {
        this.totalorder = totalorder;
    }

    public String getId_product() {
        return id_product;
    }

    public String getTotalamount() {
        return totalamount;
    }

    public String getTotalorder() {
        return totalorder;
    }


}
