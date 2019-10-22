package CONTROLLER.DAO;

import MODEL.CartModel;
import MODEL.ProductModel;

import java.util.List;

public interface ProductDAO {


    void updateProductQuantity(List<CartModel> Cart);

    List<ProductModel> searchByKeywords(List<String> Keys);

    List<ProductModel> searchByCategory(String Category);

    List<ProductModel> searchByKeysAndCategory(List<String> Keys, String Category);


    ProductModel getProductById(String ProductId);

    List<String> getProductCodesByKeyCode(String KeyCode);

    List<ProductModel> getCarouselItems();

    List<ProductModel> getAllProducts();
}
