package CONTROLLER;

import CONTROLLER.DAO.MySQLProductDAO;
import MODEL.CartModel;
import MODEL.ProductModel;

import java.util.ArrayList;
import java.util.List;

public class CartController {


    public double getTotal(List<CartModel> Cart) {
        MySQLProductDAO pm = new MySQLProductDAO();
        double sum = 0;
        for (CartModel x : Cart) {
            ProductModel product = pm.getProductById(x.getProductCode());
            sum = sum + (product.getPrice() * x.getSelectedQuantity());
        }
        return Math.round(sum*100.0)/100.0;
    }

    public double getPriceProduct(double price, int quantity) {
        return Math.round(price*quantity*100.0)/100.0;
    }
}
