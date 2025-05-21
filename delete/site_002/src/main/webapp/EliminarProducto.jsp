<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.producto.negocio.Product" %>

<%
    String idProducto = request.getParameter("id");
    Product pr = new Product();
    String resultado = pr.eliminarProducto(idProducto);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Confirmación de Eliminación</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Confirmación de Eliminación</h2>
    <p><%= resultado %></p>
    <a href="productos.jsp" class="btn btn-primary">Volver al listado</a>
</div>

</body>
</html>