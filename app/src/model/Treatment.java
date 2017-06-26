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
public class Treatment {
//    
    public SimpleIntegerProperty id;
    public SimpleStringProperty desc;
    public SimpleStringProperty recv;
//
    public Treatment(int id, String desc, String recv){
        this.id = new SimpleIntegerProperty(id);
        this.desc = new SimpleStringProperty(desc);
        this.recv = new SimpleStringProperty(recv);
    }
//
    public void setId(int id){ this.id.set(id) ;}
    public void setDesc(String desc){ this.desc.set(desc) ;}
    public void setRecv(String recv){ this.recv.set(recv) ;}
//
    public int getId(){ return id.get() ;}
    public String getDesc(){ return desc.get() ;}
    public String getRecv(){ return recv.get() ;}
//    
    @Override
    public String toString(){
        return "" + getId();
    }
}
