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

import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.*;
import org.apache.pdfbox.pdmodel.font.*;

/**
 * @author Rafael Augusto Monteiro - 9293095
 * @author Giovanna Oliveira Guimarães - 9293693
 * @author Lucas Alexandre Soares - 9293265
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

        // Test.stabilishConnection();
        
        DataHandler dh = new DataHandler();
        dh.getDBConnection();
                
        //createPdf("reports/teste.pdf", "Teste doc.");
        launch(args);
    }

 /*   public static void createPdf(String path, String text) throws Exception {
        
        PDDocument doc = new PDDocument();
        PDPage pg = new PDPage();
        doc.addPage(pg);

        PDPageContentStream contentStream = new PDPageContentStream(doc, pg);

        contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);

        contentStream.beginText();
        contentStream.newLineAtOffset(25, 700);

        contentStream.showText(text);

        contentStream.endText();
        contentStream.close();

        doc.save(path);
        doc.close();
    }*/
}
