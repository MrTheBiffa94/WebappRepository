package CONTROLLER.DAO;

import CONTROLLER.DataBaseController;
import MODEL.CartModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLCartDAO implements CartDAO {
    @Override
    public void insertInCart(CartModel cm) {
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("INSERT INTO CART VALUES(?,?,?)");
            ps.setString(1, cm.getProductCode());
            ps.setString(2, cm.getUserCode());
            ps.setInt(3, cm.getSelectedQuantity());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
    }

    @Override
    public List<CartModel> getCart(String UserCode) {
        List<CartModel> MyCart = new ArrayList<>();
        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT PRODUCTCODE,SELECTEDQUANTITY FROM CART WHERE USERCODE = ?");
            ps.setString(1, UserCode);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MyCart.add(new CartModel(rs.getString(1), rs.getInt(2), UserCode));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        DataBaseController.disconnect();
        return MyCart;
    }

    @Override
    public void updateQuantity(String ProductCode, String UserCode, int newQuantity) {
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("UPDATE CART SET SELECTEDQUANTITY = ? WHERE PRODUCTCODE = ? AND USERCODE = ?");
            ps.setInt(1, newQuantity);
            ps.setString(2, ProductCode);
            ps.setString(3, UserCode);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
    }

    @Override
    public void deleteProductOnTheCart(String ProductCode, String UserCode) {
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("DELETE FROM CART WHERE PRODUCTCODE = ? AND USERCODE = ?");
            ps.setString(1, ProductCode);
            ps.setString(2, UserCode);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
    }

    @Override
    public void deleteCart(String UserCode) {
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("DELETE FROM CART WHERE USERCODE = ?");
            ps.setString(1, UserCode);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
    }

    @Override
    public int countCart(String UserCode) {
        int elem = 0;
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT COUNT(*) FROM CART WHERE USERCODE = ?");
            ps.setString(1, UserCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                elem = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return elem;

    }

    @Override
    public CartModel getCartItemByIds(String ProductCode, String UserCode) {
        DataBaseController.connect();
        CartModel ret = null;
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT* FROM CART WHERE PRODUCTCODE = ? AND USERCODE = ?");
            ps.setString(1,ProductCode);
            ps.setString(2,UserCode);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                ret = new CartModel(rs.getString(1),rs.getInt(3),rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }
}
