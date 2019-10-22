package MODEL;

public class CartModel {

    private String ProductCode;
    private int SelectedQuantity;
    private String UserCode;
    private ProductModel AssociatedProduct;

    public CartModel(String productCode, int selectedQuantity, String userCode, ProductModel associatedProduct) {
        ProductCode = productCode;
        SelectedQuantity = selectedQuantity;
        UserCode = userCode;
        AssociatedProduct = associatedProduct;
    }

    public ProductModel getAssociatedProduct() {
        return AssociatedProduct;
    }

    public void setAssociatedProduct(ProductModel associatedProduct) {
        AssociatedProduct = associatedProduct;
    }

    public CartModel(String productCode, int selectedQuantity, String userCode) {
        ProductCode = productCode;
        SelectedQuantity = selectedQuantity;
        UserCode = userCode;
    }

    public String getProductCode() {
        return ProductCode;
    }

    public void setProductCode(String productCode) {
        ProductCode = productCode;
    }

    public int getSelectedQuantity() {
        return SelectedQuantity;
    }

    public void setSelectedQuantity(int selectedQuantity) {
        SelectedQuantity = selectedQuantity;
    }

    public String getUserCode() {
        return UserCode;
    }

    public void setUserCode(String userCode) {
        UserCode = userCode;
    }

    @Override
    public boolean equals(Object x){
        if(x == null){
            return false;
        }
        if(this.getClass()!= x.getClass()){
            return false;
        }

        CartModel cm = (CartModel) x;

        return this.ProductCode.equals(cm.ProductCode) && this.UserCode.equals(cm.UserCode);
    }
}
