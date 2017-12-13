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
    private ArrayList<Person> fkp;
    private ArrayList<Midia> fkm;
    private PersonMidia current;
    private ObservableList<PersonMidia> observableRelation;
    private DataHandler dh;
    MainWindowController mainWindow;
    
    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private GridPane gridTable;

    @FXML
    private TextField titleTextBox;

    @FXML
    private TextField nameTextBox;

    @FXML
    private TextField roleTextBox;

    //@FXML
    //private TextField fkTextBox;

    @FXML
    private Button saveChanges;

    @FXML
    private Button discardChanges;
    
    @FXML
    private ComboBox<String> comboFkp;

    @FXML
    private ComboBox<String> comboFkm;

    @FXML
    private Label pessoaNome;

    @FXML
    private Label midiaTitulo;

/* -- REVER ISSO, NAO SEI PARA QUE SERVE NO MOMENTO --    

    @FXML
    private Text treatmentDesc;

    @FXML
    private Text recoveryDesc;

    @FXML
    private Label treatmentId;
*/
    
    public void getFkp() throws SQLException{
        
        ResultSet rset = dh.getPerson();
        
        fkp = new ArrayList<>();
        
        int i = 0;
        while(rset.next()){
            fkp.add(new Person(rset.getString("Nome")));
        }
    }

    public void getFkm() throws SQLException{
        
        ResultSet rset = dh.getMidia();
        
        fkm = new ArrayList<>();
        
        int i = 0;
        while(rset.next()){
            fkm.add(new Midia(rset.getString("Titulo"), rset.getString("Tipo"), rset.getString("Thumbnail"), rset.getString("Sinopse"), rset.getInt("Duracao"), NULL, rset.getInt("Classificacao")));
        }
    }
    
    public void setValues(PersonMidia p, MainWindowController m, ObservableList<PersonMidia> pmidia, DataHandler dh) throws SQLException{
        this.dh = dh;
        this.setValues(p,m,pmidia);
    }
    
    public void setValues(PersonMidia p, MainWindowController m, ObservableList<PersonMidia> pmidia) throws SQLException{
        this.observableRelation = pmidia;
        this.setValues(p,m);
    }
    
    public void setValues(PersonMidia p, MainWindowController m) throws SQLException{
        
        this.current = p;
        if(this.current == null){
            inserting = true;
            this.current = new PersonMidia("","",false, false);
        } else {
            inserting = false;
        }
        this.mainWindow = m;
        
        current.getTitle();
        titleTextBox.setText("" + current.getTitle());
        nameTextBox.setText(current.getName());
        roleTextBox.setText(current.getRole());
        
        getFkp();
        getFkm();
        ArrayList<String> tmpp = new ArrayList<>();
        ArrayList<String> tmpm = new ArrayList<>();
        
        for(int i = 0; i < fkp.size();  i++){
            tmpp.add(i,fkp.get(i).toString());
        }

        for(int i = 0; i < fkm.size();  i++){
            tmpm.add(i,fkm.get(i).toString());
        }
        
        comboFkp.getItems().addAll(tmpp);
        if(this.current.getName().length() > 0){
            comboFkp.getSelectionModel().selectFirst();
        }

        comboFkm.getItems().addAll(tmpm);
        if(this.current.getTitle().length() > 0){
            comboFkm.getSelectionModel().selectFirst();
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
        
        // VER SE NAO DEIXEI MAIS CURRENT.GETFK()
        current.parseRole(roleTextBox.getText());
        
        current.setName(comboFkp.getValue());
        current.setTitle(comboFkm.getValue());
        
        if(inserting) {
            System.out.println("Inserting " + current.getTitle() + " " + current.getName());
            dh.insertPersonMidia(current.getTitle(), current.getName(), current.parseRole());
        }

        closeWindow();
    }
    
    @FXML
    void updateTreatmentGridValues(ActionEvent event) {
        String title = comboFkm.getValue();
        String name = comboFkp.getValue();
        
        int i = 0;

        for(i = 0; i < fkm.size(); i++) {
            if(fkm.get(i).getTitle() == title) break;
        }

        mediaTitle.setText(fkm.get(i).getTitle());

        for(i = 0; i < fkp.size(); i++) {
            if(fkp.get(i).getName() == name) break;
        }

        // Namoral, eu nao tenho ideia do que ta contecendo aqui,
        // muito menos do porque eu fiz isso, mas pareceu o mais certo
        // pls, send halp

        personName.setText(fkp.get(i).getName());

        // A essa hora, eu sou incapaz de descobrir o que sao estas tres desgracas
        // (inclusive os dois de cima)
        // personRole.setText(fk.get(i).getRecv());
    }

    /**
     * Initializes the controller class.
     */
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }    
    
}
