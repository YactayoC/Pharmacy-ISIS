package com.proyect.modelsDTO.UClient;

public class District {
    private Integer idDistrict;
    private String nameD;

    public District() {
    }

    public Integer getIdDistrict() {
        return idDistrict;
    }

    public void setIdDistrict(Integer idDistrict) {
        this.idDistrict = idDistrict;
    }

    public String getNameD() {
        return nameD;
    }

    public void setNameD(String nameD) {
        this.nameD = nameD;
    }

    @Override
    public String toString() {
        return "District{" +
                "idDistrict=" + idDistrict +
                ", nameD='" + nameD + '\'' +
                '}';
    }
}
