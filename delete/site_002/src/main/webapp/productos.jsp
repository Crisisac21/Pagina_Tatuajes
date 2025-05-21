<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.producto.seguridad.Usuario, com.producto.seguridad.Pagina, com.producto.negocio.Product, com.producto.negocio.categoria" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>

<header class="text-center mb-4">
    <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda" style="max-height: 100px;">
    <h1 class="mt-2">Gestión de Productos</h1>
</header>
<div class="container">
    <h2>Formulario de Producto</h2>
    <form action="productos.jsp" method="get" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="txtNombre">
        </div>

     <div class="mb-3">
    <label for="categoria" class="form-label">Categoría</label>
      <% 
            categoria cat = new categoria();
            out.print(cat.mostrarCategoria()); 
        %>
  
</div>

        <div class="mb-3">
            <label for="Cantidad" class="form-label">Cantidad</label>
            <input type="text" class="form-control" id="Cantidad" name="txtCantidad">
        </div>

        <div class="mb-3">
            <label for="Precio" class="form-label">Precio</label>
            <input type="text" class="form-control" id="Precio" name="txtPrecio">
        </div>

        <div class="mb-3">
            <label for="Foto" class="form-label">Foto</label>
            <input class="form-control" type="file" id="Foto" name="txtFoto">
        </div>

        <button type="submit" class="btn btn-primary">Subir</button>
    </form>

    <hr>
    <h3>Listado de Productos</h3>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Producto</th>
                <th>Categoría</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Actualizar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <%
                Product pr = new Product();
                out.print(pr.reporteProducto());  
            %>
        </tbody>
    </table>
</div>

<!-- PIE DE PÁGINA -->
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
