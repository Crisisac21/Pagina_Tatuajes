<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.producto.negocio.Product, java.net.URLEncoder" %>
<%
    if (session.getAttribute("Usuario") == null) {
        response.sendRedirect("../site_002/login.jsp?error=" + URLEncoder.encode("Debe autenticarse primero", "UTF-8"));
        return;
    }

    String id = request.getParameter("id");
    String confirmar = request.getParameter("confirmar");

    if (id != null && "si".equals(confirmar)) {
        Product producto = new Product();
        String resultado = producto.eliminarProducto(id);

        if ("ok".equalsIgnoreCase(resultado)) {
            response.sendRedirect("productos.jsp?mensaje=" + URLEncoder.encode("Producto eliminado correctamente", "UTF-8"));
        } else {
            response.sendRedirect("productos.jsp?error=" + URLEncoder.encode("Error al eliminar: " + resultado, "UTF-8"));
        }
    } else {
        response.sendRedirect("productos.jsp?error=" + URLEncoder.encode("Parámetros inválidos o eliminación cancelada", "UTF-8"));
    }
%>
