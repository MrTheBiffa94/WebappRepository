package CONTROLLER.DAO;

import CONTROLLER.DataBaseController;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLKeyWordDAO implements KeyWordDAO {

    @Override
    public String getKeyCode(String KeyName) {
        String ret = "";
        DataBaseController.connect();
        try {
            PreparedStatement ps = DataBaseController.getConnection().prepareStatement("SELECT KEYCODE FROM KEYWORD WHERE KEYNAME LIKE ?");
            ps.setString(1, KeyName+"%");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ret = ret + rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DataBaseController.disconnect();
        return ret;
    }

    @Override
    public List<String> getKeyCodes(List<String> KeyNames) {
        List<String> KeyCodes = new ArrayList<>();
        for (String x : KeyNames) {
            KeyCodes.add(this.getKeyCode(x));
        }
        return KeyCodes;
    }
}
