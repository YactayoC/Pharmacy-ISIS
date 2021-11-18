package com.proyect.modelsDTO.BCar;

import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UClient.District;
import com.proyect.modelsDTO.UEemployee.Employee;

import java.util.Date;

public class Receipt {
    private int idReceipt;
    private String serialN;
    private String dateP;
    private String paySt;
    private Client client;
    private Employee employee;
    private District District;
    private MetPay metPay;
    private MetSale metSale;
    private ReceiptDetail ReceiptDetail;
    public Receipt() {
    }

    public int getIdReceipt() {return idReceipt;}

    public void setIdReceipt(int idReceipt) {this.idReceipt = idReceipt;}

    public String getSerialN() {return serialN;}

    public void setSerialN(String serialN) {this.serialN = serialN;}

    public String getDateP() {return dateP;}

    public void setDateP(String dateP) {this.dateP = dateP;}

    public String getPaySt() {return paySt;}

    public void setPaySt(String paySt) {this.paySt = paySt;}

    public Client getClient() { return client;}

    public void setClient(Client client) { this.client = client;}

    public Employee getEmployee() {return employee;}

    public void setEmployee(Employee employee) {this.employee = employee;}

    public com.proyect.modelsDTO.UClient.District getDistrict() {return District;}

    public void setDistrict(com.proyect.modelsDTO.UClient.District district) {District = district;}

    public MetSale getMetSale() {return metSale;}

    public void setMetSale(MetSale metSale) {this.metSale = metSale;}

    public MetPay getMetPay() {return metPay;}

    public void setMetPay(MetPay metPay) {this.metPay = metPay;}

    public com.proyect.modelsDTO.BCar.ReceiptDetail getReceiptDetail() {return ReceiptDetail;}

    public void setReceiptDetail(com.proyect.modelsDTO.BCar.ReceiptDetail receiptDetail) {ReceiptDetail = receiptDetail;}
}

