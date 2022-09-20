package com.proyect.modelsDTO.BCar;

import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modelsDTO.OProduct.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ListCard {
    private List<ItemCard> items;
    public ListCard() {
        this.items = new ArrayList<>();
    }
    public List<ItemCard> getItems() {
        return items;
    }

    public void addItemCard(ItemCard itemCard) {
        if (items.contains(itemCard)) {
            Optional<ItemCard> optionalItemCard = items.stream()
                    .filter(i -> i.equals(itemCard))
                    .findAny();
            if (optionalItemCard.isPresent()) {
                ItemCard item = optionalItemCard.get();
                item.setQuantity(item.getQuantity() + 1);
            }
        } else {
            this.items.add(itemCard);
        }
    }

    public void getstockTotal() {
        for (int i = 0; i < items.size(); i++) {
            Product pr = new Product();
            int quantity = items.get(i).getQuantity();
            int idProduct = items.get(i).getProduct().getIdProduct();
            int stockt = items.get(i).getProduct().getStock();
            ProductDAO aO = new ProductDAO();
            pr = aO.byId(idProduct);
            int stock = stockt - quantity;
            int stock0 = stockt * 0;
            //Accion
            if (stock > 0) {
                aO.updateStock(idProduct,stock);
            } else {
                aO.updateStock(idProduct,stock0);
            }
        }
    }

    public double getTotal() {
        return items.stream().mapToDouble(ItemCard::getSubtotal).sum();
    }

    public void removeItem(int idProduct) {
        items.removeIf(item -> item.getProduct().getIdProduct() == idProduct);
    }
}
