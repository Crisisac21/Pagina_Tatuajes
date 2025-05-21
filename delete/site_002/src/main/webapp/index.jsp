<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.producto.negocio.Product" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Insumos de Tatuaje</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <nav>
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="categoria.jsp">Categoria</a></li>
            <li><a href="contacto.jsp">Contacto</a></li>
        </ul>
    </nav>

    <header>
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda">
        <h1>Christian Labrys</h1>
    </header>

    <section>
        <h2>Nuestra Misión</h2>
        <p>En Christian Labrys, nuestra misión es proporcionar insumos de tatuaje de alta calidad, impulsando la creatividad de los artistas y garantizando resultados excelentes. Nos comprometemos a ofrecer productos innovadores, seguros y accesibles junto con asesoría experta para fortalecer la industria del tatuaje y fomentar una comunidad apasionada por el arte corporal.</p>
    </section>

    <aside style="float: right; width: 30%;">
        <h2>Ubicación</h2>
        <p>Estamos en nuestro local. Usa el mapa interactivo para llegar más fácilmente.</p>
        <div class="mapa-container">
            <iframe src="https://www.google.com/maps/d/embed?mid=1NjSWlYhliUk5VbXJ9Jms_E9I7WxtywE" allowfullscreen loading="lazy"></iframe>
        </div>
        <<h2>Información del Desarrollador</h2>
<p>Teléfono: 0998493628</p>
<p>Email: Cristian.murillo369@outlook.com</p>
<p>LinkedIn: <a href="https://www.linkedin.com/in/christian-isac-hidalgo-murillo-88a574325?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank">Perfil en LinkedIn</a></p>
    </aside>

    <section class="productos" style="margin-right: 35%;">
        <h2>Nuestros Productos</h2>
        <%
            try {
                Product pr = new Product();
                String tabla = pr.consultarTodo();
                out.print(tabla);
            } catch (Exception e) {
                out.print("<p style='color:red;'>Error al cargar productos: " + e.getMessage() + "</p>");
            }
        %>
    </section>

    <footer>
        <p>2025 Christian Labrys - Derechos reservados</p>
        <div class="social-icons">
            <a href="https://facebook.com">
                <img src="Iconos/facebook.png" alt="Facebook">
            </a>
            <a href="https://instagram.com">
                <img src="Iconos/instagram.png" alt="Instagram">
            </a>
            <a href="https://wa.me/5491234567890">
                <img src="Iconos/whatsapp.png" alt="WhatsApp">
            </a>
            <a href="https://www.linkedin.com/in/christian-isac-hidalgo-murillo-88a574325?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app">
                <img src="Iconos/linkedin.png" alt="LinkedIn">
            </a>
        </div>
    </footer>
</body>
</html>
