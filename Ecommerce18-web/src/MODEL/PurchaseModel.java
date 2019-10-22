package MODEL;

public class PurchaseModel {

    private String PurchaseCode;
    private String User;
    private String Product;
    private String PurchaseDate;


    public PurchaseModel(String user, String product, String purchaseDate) {
        User = user;
        Product = product;
        PurchaseDate = purchaseDate;
    }

    public String getPurchaseCode() {
        return PurchaseCode;
    }

    public void setPurchaseCode(String purchaseCode) {
        PurchaseCode = purchaseCode;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }

    public String getProduct() {
        return Product;
    }

    public void setProduct(String product) {
        Product = product;
    }

    public String getPurchaseDate() {
        return PurchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        PurchaseDate = purchaseDate;
    }
}
