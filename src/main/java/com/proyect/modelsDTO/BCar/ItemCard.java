package com.proyect.modelsDTO.BCar;

import com.proyect.modelsDTO.OProduct.Product;

import java.util.Objects;

public class ItemCard {
    private int quantity;
    private Product product;

    public ItemCard(int quantity, Product product) {
        this.quantity = quantity;
        this.product = product;
    }

    public int getQuantity() {return quantity;}

    public void setQuantity(int quantity) {this.quantity = quantity;}

    public Product getProduct() {return product;}

    public void setProduct(Product product) {this.product = product;}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemCard itemCard = (ItemCard) o;
        return Objects.equals(product.getIdProduct(), itemCard.product.getIdProduct())
                && Objects.equals(product.getNameP(), itemCard.product.getNameP());
    }

    public double getSubtotal() {
        int stockTotal;
        stockTotal = product.getStock() - quantity;
        if (quantity > product.getStock()) {
            return product.getStock() * product.getPrice();
        }else{
            return quantity * product.getPrice();
        }
    }
/*
//Cuando da clic a un producto le resta al stock total
    public int getstockTotal() {
        int stock;
        stock = product.getStock() - quantity;
        if (stock > 0) {
            return product.getStock() - quantity;
        } else {
            return product.getStock() * 0;
        }
    }
*/
// Es como un limitador, para que no pase la cantidad en el carrito
    public int getQuantity2() {
        int stockTotal;
        stockTotal = product.getStock() - quantity;
        if (quantity > product.getStock()) {
            return product.getStock();
        }else{
            return quantity;
        }
    }

}
