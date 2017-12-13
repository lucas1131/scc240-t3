/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.SimpleBooleanProperty;
import java.util.Date;

/**
 *
 * @author Giovanna
 * @author Lucas
 * @author mrPips
 * @author Rina
 * @credits Jureg
 */
public class PersonMidia {

    public SimpleStringProperty title;
    public SimpleStringProperty name;
    public SimpleBooleanProperty actor;
    public SimpleBooleanProperty director;


    public PersonMidia(String title, String name, boolean actor,
    											  boolean director) {

        this.title = new SimpleStringProperty(title);
        this.name = new SimpleStringProperty(name);
        this.actor = new SimpleBooleanProperty(actor);
        this.director = new SimpleBooleanProperty(director);
    }

    public void setTitle(String title){ this.name.set(title); }
    public void setName(String name){ this.name.set(name); }
    public void setActor(String actor){ this.name.set(actor); }
    public void setDirector(String director){ this.name.set(director); }

    public String getTitle(){ return title.get(); }
    public String getName(){ return name.get(); }
    public boolean getActor(){ return actor.get(); }
    public boolean getDirector(){ return director.get(); }
    
    public String getRole() {
        String role;
    	role = getActor() ? "T" : "F";
        role += ", ";
        role += getDirector() ? "T" : "F";

        return role;
    }

    public void parseRole(String role) {
    	String[] roles = role.split(",");

    	if(roles[0].contains("T")) {
    		setActor(true);
    	} else {
    		setActor(false);
    	}

    	if(roles[1].contains("T")) {
    		setDirector(true);
    	} else {
    		setDirector(false);
    	}
    }
}
