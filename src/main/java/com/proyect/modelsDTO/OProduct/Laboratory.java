package com.proyect.modelsDTO.OProduct;

public class Laboratory {
    private int idLaboratory;
    private String nameL;

    public Laboratory() {
    }

    public int getIdLaboratory() {
        return idLaboratory;
    }

    public void setIdLaboratory(int idLaboratory) {
        this.idLaboratory = idLaboratory;
    }

    public String getNameL() {
        return nameL;
    }

    public void setNameL(String nameL) {
        this.nameL = nameL;
    }

    @Override
    public String toString() {
        return "Laboratory{" +
                "idLaboratory=" + idLaboratory +
                ", nameL='" + nameL + '\'' +
                '}';
    }
}
