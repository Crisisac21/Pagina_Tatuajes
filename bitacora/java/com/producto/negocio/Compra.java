package com.producto.negocio;

import java.util.Date;
import java.util.List;
import com.producto.negocio.Product;

public class Compra {
    private Date fecha;
    private List<Product> productos;
    private double total;

    public Compra() {}

    public Compra(Date fecha, List<Product> productos, double total) {
        this.fecha = fecha;
        this.productos = productos;
        this.total = total;
    }

    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }

    public List<Product> getProductos() { return productos; }
    public void setProductos(List<Product> productos) { this.productos = productos; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
}
