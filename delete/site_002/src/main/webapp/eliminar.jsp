<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.producto.negocio.Product" %>

<%
    String idProducto = request.getParameter("id");
    Product pr = new Product();
    String productoInfo = pr.buscarProductoPorId(idProducto);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Eliminar Producto</h2>
    <p><strong>Detalles del producto:</strong></p>
    <%= productoInfo %>

    <form action="EliminarProducto.jsp" method="post">
        <input type="hidden" name="id" value="<%= idProducto %>">
        <p class="mt-3">¿Estás seguro de que deseas eliminar este producto?</p>
        <button type="submit" class="btn btn-danger">Eliminar</button>
        <a href="productos.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

</body>
</html>