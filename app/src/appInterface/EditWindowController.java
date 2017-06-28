/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appInterface;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Text;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.stage.Stage;
import model.DataHandler;
import model.Diagnostic;
import model.Treatment;

/**
 * FXML Controller class
 *
 * @author jureg
 */
public class EditWindowController implements Initializable {
    
    boolean inserting;
    private ArrayList<Treatment> fks;
    private Diagnostic current;
    private ObservableList<Diagnostic> diags;
    private DataHandler dh;
    MainWindowController mainWindow;
    
    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private GridPane gridTable;

    @FXML
    private TextField idTextBox;

    @FXML
    private TextField descTextBox;

    @FXML
    private TextField fkTextBox;

    @FXML
    private Button saveChanges;

    @FXML
    private Button discartChanges;
    
    @FXML
    private ComboBox<String> comboFk;

    @FXML
    private Text treatmentDesc;

    @FXML
    private Text recoveryDesc;

    @FXML
    private Label treatmentId;
    
    public void getFks() throws SQLException{
        
        ResultSet rset = dh.getTreatments();
        
        fks = new ArrayList<>();
        
        int i = 0;
        while(rset.next()){
            fks.add(new Treatment(rset.getInt("IdMetodo"), rset.getString("DescricaoMetodo"), rset.getString("DescricaoEfetividade")));
        }
    }
    
    public void setValues(Diagnostic d, MainWindowController m, ObservableList<Diagnostic> diagnostics, DataHandler dh) throws SQLException{
        this.dh = dh;
        this.setValues(d,m,diagnostics);
    }
    
    public void setValues(Diagnostic d, MainWindowController m, ObservableList<Diagnostic> diagnostics) throws SQLException{
        this.diags = diagnostics;
        this.setValues(d,m);
    }
    
    public void setValues(Diagnostic d, MainWindowController m) throws SQLException{
        
        this.current = d;
        if(this.current == null){
            inserting = true;
            this.current = new Diagnostic(0,0,"");
        } else {
            inserting = false;
        }
        this.mainWindow = m;
        
        current.getId();
        idTextBox.setText("" + current.getId());
        descTextBox.setText(current.getDesc());
        
        getFks();
        ArrayList<String> tmp = new ArrayList<>();
        
        for(int i = 0; i < fks.size();  i++){
            tmp.add(i,fks.get(i).toString());
        }
        
        comboFk.getItems().addAll(tmp);
        if(this.current.getDesc().length() > 0){
            comboFk.getSelectionModel().selectFirst();
        }
    }
        
    
    public void closeWindow(){
        mainWindow.updateTable();
        Stage stage = (Stage)discartChanges.getScene().getWindow();
        stage.close();
    }
    
    @FXML
    public void discart(ActionEvent event) {
        closeWindow();
    }

    @FXML
    public void save(ActionEvent event) throws SQLException {
        
        int oldId = Integer.parseInt(idTextBox.getText());
        
        
        current.setId(Integer.parseInt(idTextBox.getText()));
        current.setDesc(descTextBox.getText());
        current.setFk(Integer.parseInt(comboFk.getValue()));
        
        if(inserting){
            System.out.println("Inserting " + current.getId() + " " + current.getDesc());
            dh.insertDiagnostic(current.getId(), current.getFk(), current.getDesc());
        } else {
            
        }
        
        
        
        closeWindow();
    }
    
    @FXML
    void updateTreatmentGridValues(ActionEvent event) {
        int id = Integer.parseInt(comboFk.getValue());
        
        int i = 0;
        for(i = 0; i < fks.size(); i++){
            if(fks.get(i).getId() == id) break;
        }
        treatmentId.setText(fks.get(i).toString());
        treatmentDesc.setText(fks.get(i).getDesc());
        recoveryDesc.setText(fks.get(i).getRecv());
    }

    /**
     * Initializes the controller class.
     */
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }    
    
}
