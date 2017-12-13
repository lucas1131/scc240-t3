/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import java.util.Date;

/**
 *
 * @author Giovanna
 * @author Lucas
 * @author mrPips
 * @author Rina
 * @credits Jureg
 */
public class Midia {

    public SimpleStringProperty title;
    public SimpleStringProperty type;
    public SimpleStringProperty thumbnail;
    public SimpleStringProperty sinopse;
    public SimpleIntegerProperty rating;
    public SimpleIntegerProperty duration;
    public SimpleStringProperty launchDate;
    public Date date;

    public Midia(String title, String type, String thumbnail,
                 String sinopse, int rating, int duration, Date date) {
        
        this.title = new SimpleStringProperty(title);
        this.type = new SimpleStringProperty(type);
        this.thumbnail = new SimpleStringProperty(thumbnail);
        this.sinopse = new SimpleStringProperty(sinopse);
        this.rating = new SimpleIntegerProperty(rating);
        this.duration = new SimpleIntegerProperty(duration);
        this.launchDate = new SimpleStringProperty(date.toString());
    }

    public void setTitle(String title) {this.title.set(title); }
    public void setType(String type) {this.type.set(type); }
    public void setThumbnail(String thumbnail) {this.thumbnail.set(thumbnail); }
    public void setSinopse(String sinopse) {this.sinopse.set(sinopse); }
    public void setRating(int rating) {this.rating.set(rating); }
    public void setDuration(int duration) {this.duration.set(duration); }

    public String getTitle() {return title.get(); }
    public String getType() {return type.get(); }
    public String getThumbnail() {return thumbnail.get(); }
    public String getSinopse() {return sinopse.get(); }
    public int getRating() {return rating.get(); }
    public int getDuration() {return duration.get(); }
}
