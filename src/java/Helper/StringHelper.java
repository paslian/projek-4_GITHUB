/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

/**
 *
 * @author hp
 */
public class StringHelper {
    public static String parseLikeQuery(String query) {
        return "%" + query + "%";
    }
public static String modifyDateIntoDatepicker(String expired) {
        String[] splitted = expired.split("-");
        expired = splitted[1] + "/" + splitted[2] + "/" +  splitted[0] ;
        
        return expired;
    }
}
