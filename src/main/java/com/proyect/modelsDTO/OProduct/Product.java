package com.proyect.modelsDTO.OProduct;

public class Product {
    private Integer idProduct;
    private String nameP;
    private double price;
    private int stock;
    private String urlPhoto;
    private String detail;
    private Laboratory laboratory;
    private Category category;
    private Presentation presentation;

    public Product() {
    }
    public Product(int idProduct) {this.idProduct = idProduct;}

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameP() {
        return nameP;
    }

    public void setNameP(String nameP) {
        this.nameP = nameP;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getUrlPhoto() {
        return urlPhoto;
    }

    public void setUrlPhoto(String urlPhoto) {
        this.urlPhoto = urlPhoto;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Laboratory getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(Laboratory laboratory) {
        this.laboratory = laboratory;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Presentation getPresentation() {
        return presentation;
    }

    public void setPresentation(Presentation presentation) {
        this.presentation = presentation;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idProduct=" + idProduct +
                ", nameP='" + nameP + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", urlPhoto='" + urlPhoto + '\'' +
                ", detail='" + detail + '\'' +
                ", laboratory=" + laboratory +
                ", category=" + category +
                ", presentation=" + presentation +
                '}';
    }
}
