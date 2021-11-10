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
    private Category oldPcateg;
    private Category newPcateg;
    private Laboratory oldPlab;
    private Laboratory newPlab;
    private Presentation oldPpresent;
    private Presentation newPpresent;
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

    public Category getOldPcateg() {return oldPcateg;}

    public void setOldPcateg(Category oldPcateg) {this.oldPcateg = oldPcateg;}

    public Category getNewPcateg() {return newPcateg;}

    public void setNewPcateg(Category newPcateg) {this.newPcateg = newPcateg;}

    public Laboratory getOldPlab() {return oldPlab;}

    public void setOldPlab(Laboratory oldPlab) {this.oldPlab = oldPlab;}

    public Laboratory getNewPlab() {return newPlab;}

    public void setNewPlab(Laboratory newPlab) {this.newPlab = newPlab;}

    public Presentation getOldPpresent() {return oldPpresent;}

    public void setOldPpresent(Presentation oldPpresent) {this.oldPpresent = oldPpresent;}

    public Presentation getNewPpresent() {return newPpresent;}

    public void setNewPpresent(Presentation newPpresent) {this.newPpresent = newPpresent;}

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