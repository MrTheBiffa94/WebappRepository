package MODEL;

public class ProductModel {

    private String ProductCode;
    private String Name;
    private double Price;
    private int Quantity;
    private String Description;
    private String ImageUrl;
    private String Category;


    public ProductModel(String productCode, String imageUrl) {
        ProductCode = productCode;
        ImageUrl = imageUrl;
    }

    public ProductModel(String productCode) {
        ProductCode = productCode;
    }

    public ProductModel(String name, double price) {
        Name = name;
        Price = price;
    }

    public ProductModel(String name, double price, int quantity) {
        Name = name;
        Price = price;
        Quantity = quantity;
    }

    public ProductModel(String productCode, String name, double price, int quantity) {
        ProductCode = productCode;
        Name = name;
        Price = price;
        Quantity = quantity;
    }

    public ProductModel(String name, double price, int quantity, String imageUrl) {
        Name = name;
        Price = price;
        Quantity = quantity;
        ImageUrl = imageUrl;
    }

    public ProductModel(String name, double price, String imageUrl) {
        Name = name;
        Price = price;
        ImageUrl = imageUrl;
    }

    public ProductModel(String productCode, String name, double price, int quantity, String description, String imageUrl, String category) {
        ProductCode = productCode;
        Name = name;
        Price = price;
        Quantity = quantity;
        Description = description;
        ImageUrl = imageUrl;
        Category = category;
    }

    public String getProductCode() {
        return ProductCode;
    }

    public void setProductCode(String productCode) {
        ProductCode = productCode;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getImageUrl() {
        return ImageUrl;
    }

    public void setImageUrl(String imageUrl) {
        ImageUrl = imageUrl;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
    }
}
