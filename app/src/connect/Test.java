package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.sql.DataSource;
import javax.sql.*;
import oracle.jdbc.pool;
import oracle.jdbc.pool.*;
import oracle.jdbc.pool.OracleDataSource;

public class Test {

	public static final String USER = "9293265";
	public static final String PASSWORD = "a";
	public static final String SERVER_NAME = "grad.icmc.usp.br";
	public static final String DB_NAME = "orcl";
	public static final int PORT = 15251;

	public static void stabilishConnection() {

		OracleDataSource ds = new OracleDataSource();
		ds.setUser(USER);
		ds.setPassword(PASSWORD);
		ds.setServerName(SERVER_NAME);
		ds.setDatabaseName(DB_NAME);
		ds.setPortNumber(PORT);

		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT ID FROM USERS");

		rs.close();
		stmt.close();
		conn.close();

		// final String url = "jdbc:oracle://grad.icmc.usp.br:15215/ORCL";
		// final String username = "9293265";
		// final String password = "a";

		// System.out.println("Connecting database...");

		// try{
		// 	Class.forName("com.oracle.jdbc.Driver").newInstance();
		// } catch(Exception e){
		// 	e.printStackTrace();
		// }

		// try {
		// 	Connection connection = DriverManager.getConnection(url, username, password);
		//     System.out.println("Database connected!");
		// } catch (SQLException e) {
		// 	printSQLException(e);
		//     throw new IllegalStateException("Cannot connect the database!", e);
		// }
	}

	public static void printSQLException(SQLException ex) {

    	for (Throwable e : ex) {
        	if (e instanceof SQLException) {

                e.printStackTrace(System.err);
                System.err.println("SQLState: " +
                    ((SQLException)e).getSQLState());

                System.err.println("Error Code: " +
                    ((SQLException)e).getErrorCode());

                System.err.println("Message: " + e.getMessage());

                Throwable t = ex.getCause();
                while(t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}