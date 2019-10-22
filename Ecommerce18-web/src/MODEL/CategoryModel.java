package MODEL;

public class CategoryModel {
    private String Name;

    public CategoryModel(String name) {
        Name = name;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @Override
    public String toString() {
        return "CategoryModel{ Name=" + Name + "}";
    }
}
