package CONTROLLER.DAO;

import CONTROLLER.DataBaseController;
import MODEL.CartModel;
import MODEL.ProductModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class MySQLProductDAO implements ProductDAO {

    @Override
    public void updateProductQuantity(List<CartModel> Cart) {
        DataBaseController.connect();
        try {
            for (CartModel x : Cart) {
                PreparedStatement ps = DataBaseController.getConnection().prepareStatement("UPDATE PRODUCT SET QUANTITY = QUANTITY - ? WHERE PRODUCTCODE = ?");
                ps.setInt(1, x.getSelectedQuantity());
                ps.setString(2, x.getProductCode());
                ps.executeUpdate();
                ps.clearParameters();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
    }


    @Override
    public List<ProductModel> searchByKeywords(List<String> Keys) {

        Set<String> MyProductCodes = new TreeSet<>();
        List<ProductModel> MyProduct = new ArrayList<>();

        for (String x : Keys) {
            MyProductCodes.addAll(this.getProductCodesByKeyCode(x));
        }

        for (String x : MyProductCodes) {
            MyProduct.add(this.getProductById(x));
        }
        return MyProduct;
    }

    @Override
    public List<ProductModel> searchByCategory(String Category) {

        List<ProductModel> MyProducts = new ArrayList<>();
        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT* FROM PRODUCT WHERE CATEGORYCODE = ?");
            ps.setString(1, Category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MyProducts.add(new ProductModel(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return MyProducts;
    }

    @Override
    public List<ProductModel> searchByKeysAndCategory(List<String> Keys, String Category) {

        List<ProductModel> Products = this.searchByKeywords(Keys);
        List<ProductModel> FilteredProducts = new ArrayList<>();
        for (ProductModel x : Products) {
            if (x.getCategory().equals(Category))
                FilteredProducts.add(x);
        }
        return FilteredProducts;
    }


    @Override
    public ProductModel getProductById(String ProductId) {
        ProductModel ret = null;
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT* FROM PRODUCT WHERE PRODUCTCODE = ?");
            ps.setString(1, ProductId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ret = new ProductModel(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }

    @Override
    public List<String> getProductCodesByKeyCode(String KeyCode) {
        List<String> codes = new ArrayList<>();
        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT PRODUCTCODE FROM KEYWORD_PRODUCT WHERE KEYCODE = ?");
            ps.setString(1, KeyCode);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                codes.add(rs.getString(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        DataBaseController.disconnect();
        return codes;
    }

    @Override
    public List<ProductModel> getCarouselItems() {
        List<ProductModel> Carousel = new ArrayList<>();
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT PRODUCTCODE,IMAGEURL FROM PRODUCT ORDER BY PRODUCTCODE DESC");
            ResultSet rs = ps.executeQuery();
            for (int i = 0; i < 7 && rs.next(); ++i) {
                Carousel.add(new ProductModel(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        DataBaseController.disconnect();
        return Carousel;
    }

    @Override
    public List<ProductModel> getAllProducts() {
        List<ProductModel> allProducts = new ArrayList<>();
        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT* FROM PRODUCT");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductModel pm = new ProductModel(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                allProducts.add(pm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allProducts;
    }


}
