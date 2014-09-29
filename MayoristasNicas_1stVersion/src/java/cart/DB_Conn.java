<<<<<<< HEAD
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.sql.*;
/*
 *
 * @author Chirag
 */
public class DB_Conn {

    //private String database="saikiran enterprises", username = "chirag", password = "1234567";
    //private String database="saikiran_enterprises", username = "root", password = "Pa$$wd22";
    private String database="mayoristasnic", username = "root", password = "Pa$$w0rd";
    private Connection con;
    
    public Connection getConnection() throws SQLException, ClassNotFoundException  {
        Class.forName("com.mysql.jdbc.Driver"); 
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database+"",""+username+"",""+password+""); 
       // stm=con.createStatement(); 
        return con;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
=======
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.sql.*;
/*
 *
 * @author MayoristasNicas
 */
public class DB_Conn {

    //private String database="saikiran enterprises", username = "chirag", password = "1234567";
    //private String database="saikiran_enterprises", username = "root", password = "Pa$$wd22";
    private String database="mayoristasnic", username = "root", password = "Pa$$wd22";
    private Connection con;
    
    public Connection getConnection() throws SQLException, ClassNotFoundException  {
        Class.forName("com.mysql.jdbc.Driver"); 
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database+"",""+username+"",""+password+""); 
       // stm=con.createStatement(); 
        return con;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
>>>>>>> 57c1f9fb2ecc87f8bb004d1c9541021a7197fd22
