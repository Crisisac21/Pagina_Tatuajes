<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.producto.negocio.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos - Christian Labrys</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <nav>
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="producto.jsp">Productos</a></li>
            <li><a href="contacto.jsp">Contacto</a></li>
        </ul>
    </nav>

    <header>
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo Christian's Labrys">
        <h1>Christian Labrys</h1>
    </header>

    <main class="container mt-5">
        <h2 class="text-center text-danger mb-4">Nuestros Productos</h2>

        

        <div id="carouselExample" class="carousel slide mb-5" data-bs-ride="carousel">
            <div class="carousel-inner rounded-4 shadow">
                <div class="carousel-item active">
                    <img src="Imagenes/producto1.jpg" class="d-block w-100" alt="Imagen de máquina de tatuar">
                </div>
                <div class="carousel-item">
                    <img src="Imagenes/producto2.jpg" class="d-block w-100" alt="Imagen de un tatuador">
                </div>
                <div class="carousel-item">
                    <img src="Imagenes/producto3.jpg" class="d-block w-100" alt="Imagen de máquina clásica">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>

        <section class="productos text-center">
            <%
            try {
                // Captura el ID de la categoría seleccionada desde el formulario
                int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));

                // Instancia la clase Product y obtiene los productos de la categoría
                Product pr = new Product();
                String productosFiltrados = pr.buscarProductoCategoria(idCategoria);
                out.print(productosFiltrados);
            } catch (Exception e) {
                out.print("<p style='color:red;'>Error al cargar productos por categoría: " + e.getMessage() + "</p>");
            }
        %>
        </section>
    </main>

    <footer>
        <p>2025 Christian Labrys - Derechos reservados</p>
        <div class="social-icons">
            <a href="https://facebook.com"><img src="Iconos/facebook.png" alt="Facebook"></a>
            <a href="https://instagram.com"><img src="Iconos/instagram.png" alt="Instagram"></a>
            <a href="https://wa.me/5491234567890"><img src="Iconos/whatsapp.png" alt="WhatsApp"></a>
            <a href="https://linkedin.com/in/christian-isac-hidalgo-murillo-88a574325"><img src="Iconos/linkedin.png" alt="LinkedIn"></a>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
