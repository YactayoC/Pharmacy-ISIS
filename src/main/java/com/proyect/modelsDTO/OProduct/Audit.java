package com.proyect.modelsDTO.OProduct;

import java.util.Date;

public class Audit {
    private Integer idAudit;
    private Date registD;
    private String hour;
    private String newPhoto;
    private String oldPhoto;
    private String oldPname;
    private String newPname;
    private double oldPprice;
    private double newPprice;
    private String oldPcateg;
    private String newPcateg;
    private String oldPlab;
    private String newPlab;
    private String oldPpresent;
    private String newPpresent;
    private Action action;
    private String avatarE;
    private String employee;

    public Audit() {
    }

    public Integer getIdAudit() {return idAudit;}

    public void setIdAudit(Integer idAudit) {this.idAudit = idAudit;}

    public Date getRegistD() {return registD;}

    public void setRegistD(Date registD) {this.registD = registD;}

    public String getHour() {return hour;}

    public void setHour(String hour) {this.hour = hour;}

    public String getNewPhoto() {return newPhoto;}

    public void setNewPhoto(String newPhoto) {this.newPhoto = newPhoto;}

    public String getOldPhoto() {return oldPhoto;}

    public void setOldPhoto(String oldPhoto) {this.oldPhoto = oldPhoto;}

    public String getOldPname() {return oldPname;}

    public void setOldPname(String oldPname) {this.oldPname = oldPname;}

    public String getNewPname() {return newPname;}

    public void setNewPname(String newPname) {this.newPname = newPname;}

    public double getOldPprice() {return oldPprice;}

    public void setOldPprice(double oldPprice) {this.oldPprice = oldPprice;}

    public double getNewPprice() {return newPprice;}

    public void setNewPprice(double newPprice) {this.newPprice = newPprice;}

    public String getOldPcateg() {return oldPcateg;}

    public void setOldPcateg(String oldPcateg) {this.oldPcateg = oldPcateg;}

    public String getNewPcateg() {return newPcateg;}

    public void setNewPcateg(String newPcateg) {this.newPcateg = newPcateg;}

    public String getOldPlab() {return oldPlab;}

    public void setOldPlab(String oldPlab) {this.oldPlab = oldPlab;}

    public String getNewPlab() {return newPlab;}

    public void setNewPlab(String newPlab) {this.newPlab = newPlab;}

    public String getOldPpresent() {return oldPpresent;}

    public void setOldPpresent(String oldPpresent) {this.oldPpresent = oldPpresent;}

    public String getNewPpresent() {return newPpresent;}

    public void setNewPpresent(String newPpresent) {this.newPpresent = newPpresent;}

    public Action getAction() {return action;}

    public void setAction(Action action) {this.action = action;}

    public String getAvatarE() {return avatarE;}

    public void setAvatarE(String avatarE) {this.avatarE = avatarE;}

    public String getEmployee() {return employee;}

    public void setEmployee(String employee) {this.employee = employee;}

    @Override
    public String toString() {
        return "Audit{" +
                "idAudit=" + idAudit +
                ", registD='" + registD + '\'' +
                ", hour=" + hour +
                ", oldPhoto=" + oldPhoto +
                ", newPhoto='" + newPhoto + '\'' +
                ", oldPname='" + oldPname + '\'' +
                ", newPname=" + newPname +
                ", oldPprice='" + oldPprice + '\'' +
                ", newPprice'" + newPprice + '\'' +
                ", oldPcateg'" + oldPcateg + '\'' +
                ", newPcateg='" + newPcateg + '\'' +
                ", oldPlab='" + oldPlab + '\'' +
                ", newPlab='" + newPlab + '\'' +
                ", oldPpresent='" + oldPpresent + '\'' +
                ", newPpresent='" + newPpresent + '\'' +
                ", action='" + action + '\'' +
                ", avatarE='" + avatarE + '\'' +
                ", employee='" + employee + '\'' +
                '}';
    }
}