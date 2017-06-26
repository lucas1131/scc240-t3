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
 * @author jureg
 */
class DataHandler{

    String jdbcUrl = "jdbc:oracle:thin:9293095/a@grad.icmc.usp.br:15215:orcl";
    String userid = "9293095";
    String password = "a";
    Connection conn;

    public DataHandler(){
    }

    public void getDBConnection() throws SQLException{
        OracleDataSource ds;

        ds = new OracleDataSource();

        ds.setURL(jdbcUrl);
        try {
            System.out.println("Attempting cnnection!");
            this.conn = ds.getConnection(userid,password);
        } catch (SQLException ex) {
            System.out.println("Erro!");
        }
        
        Statement stmt = conn.createStatement();
    }
}
