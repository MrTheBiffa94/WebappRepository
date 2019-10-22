package CONTROLLER.DAO;

import MODEL.UserModel;

public interface UserDAO {

    UserModel getName(String Usercode);

    UserModel getUser(String Username, String Password);

    void insertUser(UserModel User);

    String getPassword(String Username);

    String getUserId(String Username);

    boolean userExists(String User);

    boolean CfExists(String Cf);
}
