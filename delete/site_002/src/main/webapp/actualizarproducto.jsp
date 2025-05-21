<%@ page import="com.producto.datos.Conexion" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    String nombre = request.getParameter("txtNombre");
    String categoria = request.getParameter("cmbCategoria");
    String cantidad = request.getParameter("txtCantidad");
    String precio = request.getParameter("txtPrecio");
    String foto = request.getParameter("txtFoto");

    if (id != null && nombre != null && categoria != null && cantidad != null && precio != null) {
        String sql = "UPDATE tb_productos SET nombre_pr='" + nombre + "', id_cat=" + categoria +
                     ", cantidad_pr=" + cantidad + ", precio_pr=" + precio + ", foto_pr='" + foto +
                     "' WHERE id_pr=" + id;

        Conexion con = new Conexion();
        String resultado = con.Ejecutar(sql);

        if ("ok".equalsIgnoreCase(resultado)) {
            response.sendRedirect("productos.jsp?mensaje=Producto actualizado correctamente");
        } else {
            response.sendRedirect("productos.jsp?error=Error al actualizar: " + resultado);
        }
    } else {
        response.sendRedirect("productos.jsp?error=Datos incompletos");
    }
%>
