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
 * @author Giovanna
 * @author Lucas
 * @author mrPips
 * @author Rina
 * @credits Jureg
 */
public class Person {

    public SimpleStringProperty name;

    public Person(String name) {
        this.name = new SimpleStringProperty(name);
    }

    public void setName(String name){ this.name.set(name); }
    public String getRecv(){ return name.get(); }
}
