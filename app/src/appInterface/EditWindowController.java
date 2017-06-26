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
import javafx.scene.text.TextFlow;
import javafx.stage.Stage;
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
    
    public void getFks(){
        
        fks = new ArrayList<>();
        
        int i = 0;
        for(i = 0; i < 10; i++){
            fks.add(new Treatment(i,"Tratamento do item " + i,"Recuperação do item " + i));
        }
    }
    
    public void setValues(Diagnostic d, MainWindowController m, ObservableList<Diagnostic> diagnostics){
        this.diags = diagnostics;
        this.setValues(d,m);
    }
    
    public void setValues(Diagnostic d, MainWindowController m){
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
        
        ArrayList<String> tmp = new ArrayList<>();
        
        System.out.println(fks);
        for(int i = 0; i < fks.size();  i++){
            tmp.add(i,fks.get(i).toString());
        }
        
        comboFk.getItems().addAll(tmp);
        if(this.current.getDesc().length() > 0){
            comboFk.getSelectionModel().selectFirst();
        }
    }
        
    
    public void closeWindow(){
        mainWindow.updateTableView();
        Stage stage = (Stage)discartChanges.getScene().getWindow();
        System.out.println(stage);
        stage.close();
    }
    
    @FXML
    public void discart(ActionEvent event) {
        closeWindow();
    }

    @FXML
    public void save(ActionEvent event) {
        
        
        current.setId(Integer.parseInt(idTextBox.getText()));
        current.setDesc(descTextBox.getText());
        current.setFk(Integer.parseInt(comboFk.getValue()));
        
        if(inserting){
            diags.add(current);
        }
        
        closeWindow();
    }
    
    @FXML
    void updateTreatmentGridValues(ActionEvent event) {
        int id = Integer.parseInt(comboFk.getValue());
        System.out.println(id);
        
        treatmentId.setText(fks.get(id).toString());
        treatmentDesc.setText(fks.get(id).getDesc());
        recoveryDesc.setText(fks.get(id).getRecv());
    }

    /**
     * Initializes the controller class.
     */
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        getFks();
    }    
    
}
