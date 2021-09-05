package com.proyect.modelsDTO.UEemployee;

public class Role {
    private int idRole;
    private String nameR;

    public Role() {
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public String getNameR() {
        return nameR;
    }

    public void setNameR(String nameR) {
        this.nameR = nameR;
    }

    @Override
    public String toString() {
        return "Role{" +
                "idRole=" + idRole +
                ", nameR='" + nameR + '\'' +
                '}';
    }
}
