package MODEL;

public class KeyWordModel {
    private String KeyCode;
    private String KeyName;

    public KeyWordModel(String keyCode, String keyName) {
        KeyCode = keyCode;
        KeyName = keyName;
    }

    public String getKeyCode() {
        return KeyCode;
    }

    public void setKeyCode(String keyCode) {
        KeyCode = keyCode;
    }

    public String getKeyName() {
        return KeyName;
    }

    public void setKeyName(String keyName) {
        KeyName = keyName;
    }
}
