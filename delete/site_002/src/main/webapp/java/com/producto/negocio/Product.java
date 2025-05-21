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
            return "<p>Error al obtener productos: ResultSet nulo</p>";
        }

        StringBuilder tabla = new StringBuilder("<table border='2'><tr><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th></tr>");
        try {
            while (rs.next()) {
                tabla.append("<tr>")
                     .append("<td>").append(rs.getInt("id_pr")).append("</td>")
                     .append("<td>").append(rs.getString("nombre_pr")).append("</td>")
                     .append("<td>").append(rs.getInt("cantidad_pr")).append("</td>")
                     .append("<td>").append(rs.getDouble("precio_pr")).append("</td>")
                     .append("</tr>");
            }
        } catch (SQLException e) {
            return "<p>Error al procesar los datos: " + e.getMessage() + "</p>";
        }

        tabla.append("</table>");
        return tabla.toString();
    }

    public String buscarProductoCategoria(int cat) {
        String sql = "SELECT nombre_pr, precio_pr FROM tb_productos WHERE id_cat=" + cat;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);

        if (rs == null) {
            return "<p>Error al buscar productos: ResultSet nulo</p>";
        }

        StringBuilder resultado = new StringBuilder("<table border='3'><tr><th>Nombre</th><th>Precio</th></tr>");
        try {
            while (rs.next()) {
                resultado.append("<tr>")
                         .append("<td>").append(rs.getString("nombre_pr")).append("</td>")
                         .append("<td>").append(rs.getDouble("precio_pr")).append("</td>")
                         .append("</tr>");
            }
        } catch (SQLException e) {
            return "<p>Error al buscar productos: " + e.getMessage() + "</p>";
        }

        resultado.append("</table>");
        return resultado.toString();
    }

    public String reporteProducto() {
        String sql = "SELECT pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr " +
                     "FROM tb_productos pr INNER JOIN tb_categoria cat ON pr.id_cat = cat.id_cat";
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);

        if (rs == null) {
            return "<tr><td colspan='7'>Error: No se pudo recuperar los productos.</td></tr>";
        }

        StringBuilder tabla = new StringBuilder();
        try {
            while (rs.next()) {
                tabla.append("<tr>")
                     .append("<th scope='row'>").append(rs.getInt("id_pr")).append("</th>")
                     .append("<td>").append(rs.getString("nombre_pr")).append("</td>")
                     .append("<td>").append(rs.getString("descripcion_cat")).append("</td>")
                     .append("<td>").append(rs.getInt("cantidad_pr")).append("</td>")
                     .append("<td>").append(rs.getDouble("precio_pr")).append("</td>")
                     .append("<td><a href='actualizar.jsp?id=").append(rs.getInt("id_pr")).append("'>Actualizar</a></td>")
                     .append("<td><a href='eliminar.jsp?id=").append(rs.getInt("id_pr")).append("'>Eliminar</a></td>")
                     .append("</tr>");
            }
        } catch (SQLException e) {
            return "<tr><td colspan='7'>Error al procesar los datos: " + e.getMessage() + "</td></tr>";
        }

        return tabla.toString();
    }


    public String eliminarProducto(String id) {
        String sql = "DELETE FROM tb_productos WHERE id_pr = " + id;
        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }

    
    public String buscarProductoPorId(String id) {
        String sql = "SELECT pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr " +
                     "FROM tb_productos pr INNER JOIN tb_categoria cat ON pr.id_cat = cat.id_cat " +
                     "WHERE pr.id_pr = " + id;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);

        StringBuilder tabla = new StringBuilder("<table border='2'><tr><th>ID</th><th>Nombre</th><th>Categoría</th><th>Cantidad</th><th>Precio</th></tr>");

        try {
            if (rs != null && rs.next()) {
                tabla.append("<tr>")
                     .append("<td>").append(rs.getInt("id_pr")).append("</td>")
                     .append("<td>").append(rs.getString("nombre_pr")).append("</td>")
                     .append("<td>").append(rs.getString("descripcion_cat")).append("</td>")
                     .append("<td>").append(rs.getInt("cantidad_pr")).append("</td>")
                     .append("<td>").append(rs.getDouble("precio_pr")).append("</td>")
                     .append("</tr>");
            } else {
                tabla.append("<tr><td colspan='5'>Producto no encontrado</td></tr>");
            }
        } catch (SQLException e) {
            return "<p>Error al buscar producto: " + e.getMessage() + "</p>";
        }

        tabla.append("</table>");
        return tabla.toString();
    }
   
    }


