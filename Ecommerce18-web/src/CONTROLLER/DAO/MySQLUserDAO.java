package CONTROLLER.DAO;

import CONTROLLER.DataBaseController;
import MODEL.UserModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQLUserDAO implements UserDAO {

    @Override
    public UserModel getName(String Usercode) {
        UserModel ret = null;

        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT FIRSTNAME FROM USER WHERE USERCODE = ? ");

            ps.setString(1, Usercode);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ret = new UserModel(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;

    }

    @Override
    public UserModel getUser(String Username, String Password) {
        UserModel ret = null;

        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT USERCODE,EMAIL,PASSWORD FROM USER WHERE EMAIL = ? AND BINARY PASSWORD = ?");

            ps.setString(1, Username);
            ps.setString(2, Password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ret = new UserModel(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;
    }

    @Override
    public void insertUser(UserModel User) {

        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("INSERT INTO USER (EMAIL,PASSWORD,FIRSTNAME,LASTNAME,FISCALCODE,GENDER,ADDRESS,BIRTHPLACE,BIRTHDATE) VALUES (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, User.getEmail());
            ps.setString(2, User.getPassword());
            ps.setString(3, User.getFirstName());
            ps.setString(4, User.getLastName());
            ps.setString(5, User.getFiscalCode());
            ps.setString(6, User.getGender());
            ps.setString(7, User.getAddress());
            ps.setString(8, User.getBirthPlace());
            ps.setString(9, User.getBirthDate());
            ps.executeUpdate();
            DataBaseController.disconnect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getPassword(String Username) {

        String pass = "";

        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT PASSWORD FROM USER WHERE EMAIL = ?");
            ps.setString(1, Username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                pass = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return pass;
    }

    @Override
    public String getUserId(String Username) {
        String ret = null;

        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT USERCODE FROM USER WHERE EMAIL = ?");

            ps.setString(1, Username);

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
    public boolean userExists(String User) {
        boolean ret = false;

        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT EMAIL FROM USER WHERE EMAIL = ?");

            ps.setString(1, User);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ret = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }

    @Override
    public boolean CfExists(String Cf) {
        boolean ret = false;

        DataBaseController.connect();

        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT FISCALCODE FROM USER WHERE FISCALCODE = ?");

            ps.setString(1, Cf);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ret = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }


}
