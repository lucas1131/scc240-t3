/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

/**
 *
 * @author jureg
 */
public class Diagnostic {
        
    public SimpleIntegerProperty id;
    public SimpleIntegerProperty fk;
    public SimpleStringProperty desc;

    public Diagnostic(int id, int fkId, String desc){
        this.id = new SimpleIntegerProperty(id);
        this.fk = new SimpleIntegerProperty(fkId);
        this.desc = new SimpleStringProperty(desc);
    }

    public void setId(int id){ this.id.set(id) ;}
    public void setFk(int fkId){ this.fk.set(fkId) ;}
    public void setDesc(String desc){ this.desc.set(desc) ;}

    public int getId(){ return id.get() ;}
    public int getFk(){ return fk.get() ;}
    public String getDesc(){ return desc.get() ;}
}
