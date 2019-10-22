package CONTROLLER.DAO;

import MODEL.CartModel;

import java.util.List;

public interface CartDAO {

    void insertInCart(CartModel cm);

    List<CartModel> getCart(String UserCode);

    void updateQuantity(String ProductCode, String UserCode, int newQuantity);

    void deleteProductOnTheCart(String ProductCode, String UserCode);

    void deleteCart(String UserCode);

    int countCart(String UserCode);

    CartModel getCartItemByIds(String ProductCode, String UserCode);

}
