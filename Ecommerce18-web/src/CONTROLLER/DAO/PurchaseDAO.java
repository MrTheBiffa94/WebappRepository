package CONTROLLER.DAO;

import MODEL.CartModel;

import java.util.List;

public interface PurchaseDAO {

    void insertPurchases(String UserID, List<CartModel> Products);
}
