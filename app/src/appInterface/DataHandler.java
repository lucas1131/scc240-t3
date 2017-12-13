/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appInterface;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import oracle.jdbc.pool.OracleDataSource;

/**
 *
 * @author Rafael Augusto Monteiro - 9293095
 * @author Giovanna Oliveira Guimarães - 9293693
 * @author Lucas Alexandre Soares - 9293265
 */
public class DataHandler{

    // private final static String JDBCURL = "jdbc:oracle:thin:9293265/a@grad.icmc.usp.br:15215:orcl";
    private final static String JDBCURL = "jdbc:oracle:thin:9293693/a@grad.icmc.usp.br:15215:orcl";
    // private final static String JDBCURL = "jdbc:oracle:@grad.icmc.usp.br:15215:orcl";
    private final static String USER = "9293265";
    private final static String PASSWORD = "a";
    Connection conn;

    public DataHandler(){
    }

    public void getDBConnection() throws SQLException{
        OracleDataSource ds;

        ds = new OracleDataSource();
        ds.setURL(JDBCURL);

        try {
            System.out.println("Attempting connection!");
            this.conn = ds.getConnection(USER, PASSWORD);
        } catch (SQLException e) {
            
            System.out.println("Failed to connect.");
            printSQLException(e);
            
            throw e;
        }
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
