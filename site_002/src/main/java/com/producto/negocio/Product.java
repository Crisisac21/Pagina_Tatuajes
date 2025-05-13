package com.producto.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.producto.datos.Conexion;

public class Product {
    private int id;
    private int id_cat;
    private String nombre;
    private int cantidad;
    private double precio;
    private String directorio;

    public Product() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getId_cat() { return id_cat; }
    public void setId_cat(int id_cat) { this.id_cat = id_cat; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }
    public String getDirectorio() { return directorio; }
    public void setDirectorio(String directorio) { this.directorio = directorio; }

    public String consultarTodo() {
        String sql = "SELECT * FROM tb_productos ORDER BY id_pr";
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);

        if (rs == null) {
            System.out.println("Error: El ResultSet es nulo.");
            return "<p>Error al obtener productos</p>";
        }

        StringBuilder tabla = new StringBuilder("<table border='2'><tr><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th></tr>");
        try {
            while (rs.next()) {
                tabla.append("<tr><td>").append(rs.getInt("id_pr")).append("</td>")
                     .append("<td>").append(rs.getString("nombre_pr")).append("</td>")
                     .append("<td>").append(rs.getInt("cantidad_pr")).append("</td>")
                     .append("<td>").append(rs.getDouble("precio_pr")).append("</td></tr>");
            }
        } catch (SQLException e) {
            System.out.println("Error al procesar resultados: " + e.getMessage());
            return "<p>Error al procesar los datos</p>";
        }

        tabla.append("</table>");
        return tabla.toString();
    }

    public String buscarProductoCategoria(int cat) {
        String sentencia = "SELECT nombre_pr, precio_pr FROM tb_productos WHERE id_cat=" + cat;
        Conexion con = new Conexion();
        ResultSet rs = null;
        String resultado = "<table border='3'><tr><th>Nombre</th><th>Precio</th></tr>";
        try {
            rs = con.Consulta(sentencia);
            while (rs.next()) {
                resultado += "<tr><td>" + rs.getString(1) + "</td>"
                           + "<td>" + rs.getDouble(2) + "</td></tr>";
            }
            resultado += "</table>";
        } catch (SQLException e) {
            System.out.println("Error al buscar productos: " + e.getMessage());
            return "<p>Error al buscar productos</p>";
        }
        return resultado;
    }
}
