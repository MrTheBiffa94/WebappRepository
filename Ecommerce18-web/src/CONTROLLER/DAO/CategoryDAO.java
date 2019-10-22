package CONTROLLER.DAO;

import MODEL.CategoryModel;

import java.util.List;

public interface CategoryDAO {

    List<CategoryModel> allCategories();

    String getCategoryIdByName(String Name);

    String getCategoryNameById(String Id);

}
