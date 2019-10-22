package CONTROLLER.DAO;

import CONTROLLER.DataBaseController;
import MODEL.CartModel;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class MySQLPurchaseDAO implements PurchaseDAO {


    @Override
    public void insertPurchases(String UserID, List<CartModel> Products) {

        DataBaseController.connect();

        for (CartModel x : Products) {
            try {
                for (int i = 0; i < x.getSelectedQuantity(); ++i) {
                    PreparedStatement ps = DataBaseController.getConnection().prepareStatement("INSERT INTO PURCHASE (USER, PRODUCT, PURCHASEDON) VALUES (?,?,SYSDATE())");
                    ps.setString(1, UserID);
                    ps.setString(2, x.getProductCode());
                    ps.executeUpdate();
                    ps.clearParameters();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        DataBaseController.disconnect();
    }
}
