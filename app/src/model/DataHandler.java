/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import oracle.jdbc.pool.OracleDataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
import model.Person;
import model.Midia;
import model.PersonMidia;

/**
 *
 * @author Giovanna
 * @author Lucas
 * @author mrPips
 * @author Rina
 * @credits Jureg
 */
public class DataHandler {

    private final static String JDBCURL = "jdbc:oracle:thin:9293693/a@grad.icmc.usp.br:15215:orcl";
    // private final static String JDBCURL = "jdbc:oracle:@grad.icmc.usp.br:15215:orcl";
    private final static String USER = "9293693";
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

    // DEVE ESTAR CERTO
    public boolean deletePersonMidia(String title, String name) {
        
        Statement stmt;
        
        name = generateStringWithAspas(name);
        title = generateStringWithAspas(title);

        
        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            System.out.println("DELETE FROM Pessoa_Participa_Midia WHERE Titulo_Midia = " + title + " AND Nome_Pessoa = " + name + ");");
            stmt.execute("DELETE FROM Pessoa_Participa_Midia WHERE Titulo_Midia = " + title + " AND Nome_Pessoa = " + name + ");");
        } catch(SQLException ex) {
            System.out.println("Deu ruim!");
            return false;
        }

        return true;
    }
    
    // DEVE ESTAR CERTO
    public ResultSet getPersonMidia() throws SQLException {
        
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        return stmt.executeQuery("SELECT * FROM Pessoa_Participa_Midia");
    }
    
    /*public ResultSet getTreatments() throws SQLException{
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        return stmt.executeQuery("SELECT * FROM metodoTratamento");
    }*/
    
    // DEVE ESTAR CERTO
    public void updatePersonMidia(String title, String name, boolean actor, boolean director) throws SQLException{
        
        Statement stmt;

        name = generateStringWithAspas(name);
        title = generateStringWithAspas(title); 

        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        stmt.execute("UPDATE Pessoa_Participa_Midia SET Diretor = " + director + ", Ator = " + actor + " WHERE Titulo_Midia = " + title + " AND Nome_Pessoa = " + name + ");");
    }

    public boolean insertPersonMidia(String title, String name, boolean actor, boolean director) throws SQLException{
        
        Statement stmt;

        //insere aspas na string
        title = generateStringWithAspas(title);
        // sinopse = generateStringWithAspas(sinopse);
        // thumbnail = generateStringWithAspas(thumbnail);
        // type = generateStringWithAspas(type);
        // String convertedDate = generateStringWithAspas(javaDateToSQLDate(date));
        name = generateStringWithAspas(name);

        char a = actor ? 'T' : 'F';
        char d = director ? 'T' : 'F';

        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        try {
            System.out.println("INSERT INTO Pessoa_Participa_Midia VALUES (" + title + ", " + name + ", " + actor + ", " + director + ");");
            stmt.execute("INSERT INTO Pessoa_Participa_Midia VALUES (" + title + ", " + name + ", " + actor + ", " + director + ");");
        } catch (SQLException ex) {
            System.out.println("Deu ruim!");
            return false;
        }
        
        return true;
    }

    public boolean insertMidia(String title, String type, String thumbnail, String sinopse, int duration, Date date, int rating) throws SQLException {
        
        Statement stmt;

        title = generateStringWithAspas(title);
        sinopse = generateStringWithAspas(sinopse);
        thumbnail = generateStringWithAspas(thumbnail);
        type = generateStringWithAspas(type);
        String convertedDate = generateStringWithAspas(javaDateToSQLDate(date));

        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        try {
            System.out.println("INSERT INTO Midia VALUES (" + title + ", " + type + ", " + thumbnail + ", " + convertedDate + ", " + duration + ", " + sinopse + ", " + rating + ");");
            stmt.execute("INSERT INTO Midia VALUES (" + title + ", " + type + ", " + thumbnail + ", " + convertedDate + ", " + duration + ", " + sinopse + ", " + rating + ");");
        } catch (SQLException ex) {
            System.out.println("Deu ruim!");
            return false;
        }
        
        return true;      
    }

    public boolean deleteMidia(String title) throws SQLException {
        
        Statement stmt;

        title = generateStringWithAspas(title);
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        try{
            System.out.println("DELETE FROM Midia WHERE Titulo = " + title + ");");
            stmt.execute("DELETE FROM Midia WHERE Titulo = " + title + ");");
        } catch(SQLException ex) {
            System.out.println("Deu ruim!");
            return false;
        }        

        return true;
    }

    public ResultSet getMidia() throws SQLException {
        
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        return stmt.executeQuery("SELECT * FROM Midia");
    }

    // DEVE ESTAR CERTO
    public void updateMidia(String title, String sinopse, String thumbnail, String type, int rating, int duration, Date date) throws SQLException{
        
        Statement stmt;

        title = generateStringWithAspas(title);
        sinopse = generateStringWithAspas(sinopse);
        thumbnail = generateStringWithAspas(thumbnail);
        type = generateStringWithAspas(type);
        String convertedDate = generateStringWithAspas(javaDateToSQLDate(date));
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        stmt.execute("UPDATE Pessoa_Participa_Midia SET Tipo = " + type + ", Thumbnail = " + thumbnail + ", Sinopse = " + sinopse + ", Duracao = " + duration + ", Classificacao = " + rating + ", Lancamento = " + convertedDate + " WHERE Titulo = " + title + ");");
    }

    public void deletePerson(String name) throws SQLException{
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        System.out.println("DELETE FROM Pesssoa WHERE Nome = " + name);
        stmt.execute("DELETE FROM Pesssoa WHERE Nome = " + name);
    }

    public void insertPerson(String name) throws SQLException{
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        System.out.println("INSERT INTO Pesssoa WHERE Nome = " + name);
        stmt.execute("INSERT INTO Pesssoa WHERE Nome = " + name);
    }

        public ResultSet getPerson() throws SQLException {
        
        Statement stmt;
        
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        return stmt.executeQuery("SELECT * FROM Pessoa");
    }

    public String generateStringWithAspas(String str){
        return "'" + str + "'";
    }

    public String javaDateToSQLDate(Date date){
        return "" + date.getDay() + "-" + date.getMonth() + "-" + date.getYear();
    }
}


