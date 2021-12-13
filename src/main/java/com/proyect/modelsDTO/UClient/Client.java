package com.proyect.modelsDTO.UClient;

import com.proyect.modelsDTO.BCar.Receipt;
import com.proyect.modelsDTO.General.User;

public class Client {
    private Integer idClient;
    private String username;
    private String name;
    private String surname;
    private String docIdentity;
    private String address;
    private int idDistrict;
    private String phone;
    private User user;
    private District district;
    private Receipt Receipt;

    public Client() {
    }

    public Client(Integer idClient, String address, int idDistrict) {
        this.idClient = idClient;
        this.address = address;
        this.idDistrict = idDistrict;
    }

    public int getIdDistrict() {return idDistrict;}

    public void setIdDistrict(int idDistrict) {this.idDistrict = idDistrict;}

    public Client(int idClient) {this.idClient = idClient;}

    public Integer getIdClient() {return idClient;}

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getDocIdentity() {
        return docIdentity;
    }

    public void setDocIdentity(String docIdentity) {
        this.docIdentity = docIdentity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public Receipt getReceipt() {return Receipt;}

    public void setReceipt(Receipt receipt) {Receipt = receipt;}

    @Override
    public String toString() {
        return "Client{" +
                "idClient=" + idClient +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", docIdentity='" + docIdentity + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", user=" + user +
                ", district=" + district +
                ", Receipt=" + Receipt +
                '}';
    }
}
