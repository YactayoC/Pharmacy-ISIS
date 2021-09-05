package com.proyect.modelsDTO.UEemployee;

import com.proyect.modelsDTO.General.User;

public class Employee {
    private Integer idEmployee;
    private String name;
    private String surname;
    private String docIdentity;
    private String phone;
    private Role role;
    private User user;

    public Employee() {
    }

    public Integer getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(Integer idEmployee) {
        this.idEmployee = idEmployee;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "idEmployee=" + idEmployee +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", docIdentity='" + docIdentity + '\'' +
                ", phone='" + phone + '\'' +
                ", role=" + role +
                ", user=" + user +
                '}';
    }
}
