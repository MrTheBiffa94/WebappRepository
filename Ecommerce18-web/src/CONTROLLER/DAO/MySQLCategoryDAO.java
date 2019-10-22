package CONTROLLER.DAO;

import CONTROLLER.DataBaseController;
import MODEL.CategoryModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoryDAO implements CategoryDAO {


    @Override
    public List<CategoryModel> allCategories() {

        List<CategoryModel> ret = new ArrayList<>();

        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT CATEGORYNAME FROM CATEGORY");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ret.add(new CategoryModel(rs.getString(1)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }

    @Override
    public String getCategoryIdByName(String Name) {
        DataBaseController.connect();
        String ret = "";
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT CATEGORYCODE FROM CATEGORY WHERE CATEGORYNAME=?");
            ps.setString(1, Name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }

    @Override
    public String getCategoryNameById(String Id) {
        DataBaseController.connect();
        String ret = "";
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT CATEGORYNAME FROM CATEGORY WHERE CATEGORYCODE=?");
            ps.setString(1,Id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                ret = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }
}
