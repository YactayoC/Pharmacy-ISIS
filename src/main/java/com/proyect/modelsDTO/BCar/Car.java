package com.proyect.modelsDTO.BCar;

public class Car {
    int item;
    int idProducts;
    String namePP;
    Double prices;
    int cant;
    Double subTotal;
    boolean button;
    private String urlPhotos;

    public Car() {
    }

    public Car(int item, int idProducts, String namePP, Double prices, int cant, Double subTotal, boolean button, String urlPhotos) {
        this.item = item;
        this.idProducts = idProducts;
        this.namePP = namePP;
        this.prices = prices;
        this.cant = cant;
        this.subTotal = subTotal;
        this.button = button;
        this.urlPhotos = urlPhotos;
    }

    public int getItem() {return item;}

    public void setItem(int item) {this.item = item; }

    public int getIdProducts() {return idProducts;}

    public void setIdProducts(int idProducts) {this.idProducts = idProducts;}

    public String getNamePP() {return namePP;}

    public void setNamePP(String namePP) {this.namePP = namePP;}

    public Double getPrices() {return prices;}

    public void setPrices(Double prices) {this.prices = prices;}

    public int getCant() {return cant;}

    public void setCant(int cant) {this.cant = cant;}

    public Double getSubTotal() {return subTotal;}

    public void setSubTotal(Double subTotal) {this.subTotal = subTotal;}

    public boolean getButton() {return button;}

    public void setButton(boolean button) {this.button = button;}

    public String getUrlPhotos() {return urlPhotos;}

    public void setUrlPhotos(String urlPhotos) {this.urlPhotos = urlPhotos;}

    @Override
    public String toString() {
        return "Car{" +
                "item=" + item +
                ", idProducts=" + idProducts +
                ", namePP='" + namePP + '\'' +
                ", prices=" + prices +
                ", cant=" + cant +
                ", subTotal=" + subTotal +
                ", button=" + button +
                ", urlPhoto='" + urlPhotos + '\'' +
                '}';
    }
}

