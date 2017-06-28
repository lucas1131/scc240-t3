/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appInterface;

import model.DataHandler;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 *
 * @author jureg
 */
public class main extends Application {
    
    @Override
    public void start(Stage stage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("fxml/MainWindow.fxml"));
        Scene scene = new Scene(root);
        
        setUserAgentStylesheet(STYLESHEET_MODENA);
        
        stage.setScene(scene);
        stage.show();
    }

    /**
     * @param args the command line arguments
     * @throws java.lang.Exception
     */
    public static void main(String[] args) throws Exception {
                
        launch(args);
    }
}
