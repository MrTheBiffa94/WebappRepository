package CONTROLLER.DAO;

import java.util.List;

public interface KeyWordDAO {

    String getKeyCode(String KeyName);

    List<String> getKeyCodes(List<String> KeyNames);

}
