/**
 * Sample Skeleton for 'MainWindow.fxml' Controller Class
 */

package appInterface;

import model.DataHandler;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import model.Diagnostic;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainWindowController {
    
    public List<Diagnostic> diagnostics = new ArrayList<>();
    public ObservableList<Diagnostic> observableDiagnostics;
    private DataHandler dh;
    
    @FXML // ResourceBundle that was given to the FXMLLoader
    private ResourceBundle resources;

    @FXML // URL location of the FXML file that was given to the FXMLLoader
    private URL location;

    @FXML
    private TableView<Diagnostic> tableView;

    @FXML
    private TableColumn<Diagnostic, Integer> DiagnosticIdCol;

    @FXML
    private TableColumn<Diagnostic, String> DiagnosticDescCol;

    @FXML
    private TableColumn<Diagnostic, Integer> TreatmentIdCol;
    
    @FXML
    private Button updateTableButton;

    @FXML
    private Button addRegistryButton;

    @FXML
    private Button removeRegistryButton;

    @FXML
    private Button updateRegistryButton;
    
    @FXML
    private AnchorPane mainPane;
    
    public void updateTableView(){
        tableView.refresh();
    }
    
    public void getDiagnostics(){
        
        ResultSet rset = null;
        try {
            rset = dh.getDiagnostics();
        } catch (SQLException ex) {
            return;
        }
        
        try {
            while(rset.next()){
                observableDiagnostics.add(new Diagnostic(rset.getInt("IDDiagnostico"),rset.getInt("MetodoTratamento"),rset.getString("DescricaoDiagnostico")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MainWindowController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void prepareTableView(){
        
        observableDiagnostics = FXCollections.observableArrayList(diagnostics);
        
        DiagnosticIdCol.setCellValueFactory(
                new PropertyValueFactory<>("id")
        );
        
        DiagnosticDescCol.setCellValueFactory(
                new PropertyValueFactory<>("desc")
        );
        
        TreatmentIdCol.setCellValueFactory(
                new PropertyValueFactory<>("fk")
        );
        
        tableView.setItems(observableDiagnostics);
    }
    
    @FXML
    void updateTable() {
        observableDiagnostics.clear();
        
        getDiagnostics();
        updateTableView();
    }
    
    @FXML
    void insertInTable() throws IOException, SQLException {
        
        Parent root;
        
        FXMLLoader editLoader = new FXMLLoader(getClass().getResource("fxml/EditWindow.fxml"));
        
        root = (Parent)editLoader.load();
        Stage stage = new Stage();
        stage.initModality(Modality.WINDOW_MODAL);
        stage.initOwner(mainPane.getScene().getWindow());
        stage.setTitle("Adicionar novo Registro");
        stage.setScene(new Scene(root));
        
        EditWindowController editController = editLoader.<EditWindowController>getController();
        editController.setValues(null, this, observableDiagnostics, dh);
        
        stage.show();
    }
    
    @FXML
    void removeTableSelection() throws SQLException{
        Diagnostic current = tableView.getSelectionModel().getSelectedItem();
        
        dh.deleteDiagnostic(current.getId());
        
        observableDiagnostics.remove(current);
    }
    
    @FXML
    void editSelectedRow() throws IOException, SQLException{
        
        Diagnostic current = tableView.getSelectionModel().getSelectedItem();
        
        if(current == null) return;
        
        Parent root;
        
        FXMLLoader editLoader = new FXMLLoader(getClass().getResource("fxml/EditWindow.fxml"));
        
        root = (Parent)editLoader.load();
        Stage stage = new Stage();
        stage.initModality(Modality.WINDOW_MODAL);
        stage.initOwner(mainPane.getScene().getWindow());
        stage.setTitle("Editar Registro");
        stage.setScene(new Scene(root));

        
        EditWindowController editController = editLoader.<EditWindowController>getController();
        editController.setValues(current, this, null,  dh);
        
        stage.show();
    }

    @FXML // This method is called by the FXMLLoader when initialization is complete
    void initialize() throws IOException, SQLException {
        
        this.diagnostics = new ArrayList<>();
        
        dh = new DataHandler();
        dh.getDBConnection();
        
        //prepara a tabela para exibir os dados de observableDiagnostics
        prepareTableView();
        
        //gerar dados para as tabelas
        getDiagnostics();

        
    }
}
