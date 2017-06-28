/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.pool.OracleDataSource;

/**
 *
 * @author jureg
 */
public class DataHandler{

    private final static String JDBCURL = "jdbc:oracle:thin:9293693/shugochara1!@grad.icmc.usp.br:15215:orcl";
    // private final static String JDBCURL = "jdbc:oracle:@grad.icmc.usp.br:15215:orcl";
    private final static String USER = "9293693";
    private final static String PASSWORD = "shugochara1!";
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

            System.out.println("Connection succeded.");

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
    
    public ResultSet getDiagnostics() throws SQLException{
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        return stmt.executeQuery("SELECT IDDiagnostico, descricaodiagnostico, metodotratamento FROM diagnostico d JOIN tratamento t ON d.IDDiagnostico = t.Diagnostico");
    }
    
    public ResultSet getTreatments() throws SQLException{
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        return stmt.executeQuery("SELECT * FROM metodoTratamento");
    }
    
    public void updateDiagnostic(int id, int newId, int fk, String Desc) throws SQLException{
        
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        stmt.execute("UPDATE " + "");
    }
    
    public void deleteDiagnostic(int id) throws SQLException{
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        System.out.println("DELETE FROM diagnostico WHERE iddiagnostico = " + id);
        stmt.execute("DELETE FROM diagnostico WHERE iddiagnostico = " + id);
    }
    
    public boolean insertDiagnostic(int newId, int fk, String desc) throws SQLException{
        
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        try {
            System.out.println("INSERT INTO Diagnostico VALUES (" + newId + ", '" + desc + "')");
            stmt.execute("INSERT INTO Diagnostico VALUES (" + newId + ", '" + desc + "')");
            
            System.out.println("INSERT INTO Diagnostico VALUES (" + newId + ", '" + desc + "')");
            stmt.execute("INSERT INTO Tratamento VALUES (" + newId + ", '" + fk + "')");
        } catch (SQLException ex) {
            return false;
        }
        
        return true;
    }
}
