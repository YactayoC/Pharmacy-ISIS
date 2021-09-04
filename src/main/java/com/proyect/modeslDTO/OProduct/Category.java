package com.proyect.modeslDTO.OProduct;

public class Category {
    private int idCategory;
    private String nameC;
    private String urlCateg;
    private String description;

    public Category() {
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameC() {
        return nameC;
    }

    public void setNameC(String nameC) {
        this.nameC = nameC;
    }

    public String getUrlCateg() {
        return urlCateg;
    }

    public void setUrlCateg(String urlCateg) {
        this.urlCateg = urlCateg;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Category{" +
                "idCategory=" + idCategory +
                ", nameC='" + nameC + '\'' +
                ", urlCateg='" + urlCateg + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
