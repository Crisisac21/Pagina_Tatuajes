package com.producto.negocio;

import java.util.ArrayList;
import java.util.List;

public class Carrito {
    private List<ItemCarrito> items;

    public Carrito() {
        items = new ArrayList<>();
    }

    public void agregarProducto(Product producto, int cantidad) {
        
        for (ItemCarrito item : items) {
            if (item.getProducto().getId() == producto.getId()) {
                item.setCantidad(item.getCantidad() + cantidad);
                return;
            }
        }
       
        items.add(new ItemCarrito(producto, cantidad));
    }

    public List<ItemCarrito> getItems() {
        return items;
    }

    public double getTotal() {
        double total = 0;
        for (ItemCarrito item : items) {
            total += item.getSubtotal();
        }
        return total;
    }

    public void vaciarCarrito() {
        items.clear();
    }

    public boolean estaVacio() {
        return items.isEmpty();
    }
}
