package MODEL;

public class UserModel {
    private String Usercode;
    private String Email;
    private String Password;
    private String FirstName;
    private String LastName;
    private String FiscalCode;
    private String Gender;
    private String Address;
    private String BirthPlace;
    private String BirthDate;

    public UserModel(String firstName) {
        FirstName = firstName;
    }

    public UserModel(String firstName, String lastName, String gender, String birthPlace, String birthDate) {
        FirstName = firstName;
        LastName = lastName;
        Gender = gender;
        BirthPlace = birthPlace;
        BirthDate = birthDate;
    }

    public UserModel(String UserCode, String email, String password) {
        this.Usercode = UserCode;
        this.Email = email;
        this.Password = password;
    }

    public UserModel(String email, String password, String firstName, String lastName, String fiscalCode, String gender, String address, String birthPlace, String birthDate) {
        Email = email;
        Password = password;
        FirstName = firstName;
        LastName = lastName;
        FiscalCode = fiscalCode;
        Gender = gender;
        Address = address;
        BirthPlace = birthPlace;
        BirthDate = birthDate;
    }

    public String getUsercode() {
        return Usercode;
    }

    public void setUsercode(String usercode) {
        Usercode = usercode;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getFiscalCode() {
        return FiscalCode;
    }

    public void setFiscalCode(String fiscalCode) {
        FiscalCode = fiscalCode;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getBirthPlace() {
        return BirthPlace;
    }

    public void setBirthPlace(String birthPlace) {
        BirthPlace = birthPlace;
    }

    public String getBirthDate() {
        return BirthDate;
    }

    public void setBirthDate(String birthDate) {
        BirthDate = birthDate;
    }
}
