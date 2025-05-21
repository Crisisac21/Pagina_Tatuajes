<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="com.producto.negocio.Product, com.producto.datos.Conexion, java.sql.*" %>
<%
    String id = request.getParameter("id");
    Product pr = new Product();
    String nombre = "", categoria = "", foto = "";
    int id_cat = 0, cantidad = 0;
    double precio = 0.0;

    if (id != null && !id.trim().isEmpty()) {
        String sql = "SELECT * FROM tb_productos WHERE id_pr = " + id;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);
        if (rs != null && rs.next()) {
            nombre = rs.getString("nombre_pr");
            id_cat = rs.getInt("id_cat");
            cantidad = rs.getInt("cantidad_pr");
            precio = rs.getDouble("precio_pr");
            foto = rs.getString("foto_pr");
        } else {
            out.println("<div class='alert alert-danger'>Producto no encontrado</div>");
        }
    } else {
        out.println("<div class='alert alert-warning'>ID no proporcionado</div>");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>

<header class="text-center my-4">
    <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda" style="max-height: 100px;">
    <h1 class="mt-2">Actualizar Producto</h1>
</header>

<div class="container">
    <form action="actualizarproducto.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= id %>">

        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="txtNombre" name="txtNombre" value="<%= nombre %>" required>
        </div>

        <div class="mb-3">
            <label for="cmbCategoria" class="form-label">Categoría</label>
            <select class="form-select" id="cmbCategoria" name="cmbCategoria" required>
                <option value="">Seleccione una categoría</option>
                <option value="1" <%= (id_cat == 1 ? "selected" : "") %>>Tinta</option>
                <option value="2" <%= (id_cat == 2 ? "selected" : "") %>>Maquina</option>
                <option value="3" <%= (id_cat == 3 ? "selected" : "") %>>Agujas</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="txtCantidad" class="form-label">Cantidad</label>
            <input type="number" class="form-control" id="txtCantidad" name="txtCantidad" value="<%= cantidad %>" required>
        </div>

        <div class="mb-3">
            <label for="txtPrecio" class="form-label">Precio</label>
            <input type="text" class="form-control" id="txtPrecio" name="txtPrecio" value="<%= precio %>" required>
        </div>

        <div class="mb-3">
            <label for="txtFoto" class="form-label">Foto</label>
            <input type="file" class="form-control" id="txtFoto" name="txtFoto">
            <% if (foto != null && !foto.isEmpty()) { %>
                <p class="mt-2">Foto actual: <img src="imagenes_productos/<%= foto %>" width="100"></p>
            <% } %>
        </div>

        <button type="submit" class="btn btn-success">Actualizar</button>
        <a href="productos.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<footer class="text-center mt-5">
    <p>2025 Christian Labrys - Derechos reservados</p>
    <div class="d-flex justify-content-center gap-3">
        <a href="https://facebook.com">
            <img src="Iconos/facebook.png" alt="Facebook" width="32">
        </a>
        <a href="https://instagram.com">
            <img src="Iconos/instagram.png" alt="Instagram" width="32">
        </a>
        <a href="https://wa.me/5491234567890">
            <img src="Iconos/whatsapp.png" alt="WhatsApp" width="32">
        </a>
        <a href="https://www.linkedin.com/in/christian-isac-hidalgo-murillo-88a574325">
            <img src="Iconos/linkedin.png" alt="LinkedIn" width="32">
        </a>
    </div>
</footer>

</body>
</html>
