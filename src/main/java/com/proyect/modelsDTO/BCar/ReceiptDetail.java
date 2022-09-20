package com.proyect.modelsDTO.BCar;

import com.proyect.modelsDTO.OProduct.Product;

public class ReceiptDetail {
    private int receiptDetail;
    private double price;
    private int quantity;
    private Product product;
    private Receipt receipt;

    public ReceiptDetail() {
    }

    public int getReceiptDetail() {
        return receiptDetail;
    }

    public void setReceiptDetail(int receiptDetail) {
        this.receiptDetail = receiptDetail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }

    @Override
    public String toString() {
        return "DetailReceipt{" +
                "idDetailReceipt=" + receiptDetail +
                ", receipt=" + receipt +
                ", price=" + price +
                ", product=" + product +
                ", quantity=" + quantity +
                '}';
    }
}
