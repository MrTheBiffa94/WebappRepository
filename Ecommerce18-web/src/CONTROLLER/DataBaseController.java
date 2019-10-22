package CONTROLLER;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseController {

    private static final String Url = "jdbc:mysql://178.238.236.7/jalapeno";
    private static final String users = "jalapeno";
    private static final String pass = "bEc7cNGDfB3F509biZ30Ycj68A6bF8NZm6f";
    private static Connection Connection;

    public static void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection = DriverManager.getConnection(Url, users, pass);
        } catch (Exception e) {
            System.out.println(e + "\nConnessione non eseguita.");
        }
    }

    public static Connection getConnection() {
        return Connection;
    }

    public static void disconnect() {
        try {
            Connection.close();
        } catch (SQLException e) {
            System.out.println(e + "\nErrore durante la chiusura.");
        }
    }
}
