package com.mytravel.app.ui.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class DicoverModel implements Serializable{

    @SerializedName("country")
    @Expose
    private String Coutry;

    @SerializedName("lat")
    @Expose
    private String lat;

    @SerializedName("lng")
    @Expose
    private String lng;

    @SerializedName("name")
    @Expose
    private String name;


    public String getCoutry() {
        return Coutry;
    }

    public void setCoutry(String coutry) {
        Coutry = coutry;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
