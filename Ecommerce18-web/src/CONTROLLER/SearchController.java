package CONTROLLER;

import java.util.ArrayList;
import java.util.List;

public class SearchController {
    private String Query;

    public SearchController(String query) {
        Query = query;
    }

    public String getQuery() {
        return Query;
    }

    public void setQuery(String query) {
        Query = query;
    }

    public List<String> getKeyNames(String Query) {
        List<String> KeyNames = new ArrayList<>();

        if (Query == null || Query.equals(""))
            return null;

        String tmp = Query;
        int offset;

        while (tmp.length() > 0) {
            offset = tmp.indexOf(" ");
            if (offset > 0) {
                String key = tmp.substring(0, offset);
                KeyNames.add(key);
                tmp = tmp.substring(offset + 1);
            } else {
                KeyNames.add(tmp);
                tmp = tmp.substring(tmp.length());
            }
        }
        return KeyNames;
    }
}
