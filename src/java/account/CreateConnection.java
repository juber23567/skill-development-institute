package account;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class CreateConnection {
    public static Connection intializeDatabase() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
    String driver="com.mysql.jdbc.Driver";
    String username="root";
    String password="";
    String database="jdbc:mysql://localhost:3306/sdi";
    Class.forName(driver).newInstance();
    Connection conn= DriverManager.getConnection(database,username,password);
    return conn;
    }}