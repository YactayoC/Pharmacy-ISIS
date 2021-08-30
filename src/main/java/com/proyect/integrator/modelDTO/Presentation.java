package com.proyect.integrator.modelDTO;

public class Presentation {
    private int idPresentation;
    private String namePr;

    public Presentation() {
    }

    public int getIdPresentation() {
        return idPresentation;
    }

    public void setIdPresentation(int idPresentation) {
        this.idPresentation = idPresentation;
    }

    public String getNamePr() {
        return namePr;
    }

    public void setNamePr(String namePr) {
        this.namePr = namePr;
    }

    @Override
    public String toString() {
        return "Presentation{" +
                "idPresentation=" + idPresentation +
                ", namePr='" + namePr + '\'' +
                '}';
    }
}
