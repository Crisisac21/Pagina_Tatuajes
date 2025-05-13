<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.producto.negocio.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Categoría - Christian Labrys</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <nav>
        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="producto.jsp">Productos</a></li>
            <li><a href="contacto.jsp">Contacto</a></li>
        </ul>
    </nav>

    <header class="text-center py-4">
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo Christian's Labrys" style="max-height: 100px;">
        <h1>Christian Labrys</h1>
    </header>

    <main class="container mt-5">
        <h2 class="text-center text-primary mb-4">Seleccione una Categoría</h2>

        <form action="producto.jsp" method="post" class="text-center">
            <div class="mb-3">
                <%
                    categoria cat = new categoria();
                    out.print(cat.mostrarCategoria());
                %>
            </div>
            <button type="submit" class="btn btn-success">Ver Productos</button>
        </form>
    </main>

    <footer class="text-center mt-5">
        <p>2025 Christian Labrys - Derechos reservados</p>
        <div class="social-icons">
            <a href="https://facebook.com"><img src="Iconos/facebook.png" alt="Facebook" style="width: 24px;"></a>
            <a href="https://instagram.com"><img src="Iconos/instagram.png" alt="Instagram" style="width: 24px;"></a>
            <a href="https://wa.me/5491234567890"><img src="Iconos/whatsapp.png" alt="WhatsApp" style="width: 24px;"></a>
            <a href="https://linkedin.com/in/christian-isac-hidalgo-murillo-88a574325"><img src="Iconos/linkedin.png" alt="LinkedIn" style="width: 24px;"></a>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
