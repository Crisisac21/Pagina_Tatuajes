<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login - Christian Labrys</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>

    <nav>
        <ul>
        	<li><a href="index.jsp">Inicio</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="categoria.jsp">Categoria</a></li>
           
        </ul>
    </nav>

    <header>
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo Christian Labrys">
        <h1>Christian Labrys</h1>
    </header>

    <main class="login-container">
        <section class="login-box">
            <h2>Iniciar Sesión</h2>

            <% 
            HttpSession sesion = request.getSession();
            String mensajeError = (String) sesion.getAttribute("mensajeError");
            if (mensajeError != null) {
            %>
                <p style="color: red; font-weight: bold;"><%= mensajeError %></p>
                <%
                sesion.removeAttribute("mensajeError"); // Eliminar mensaje después de mostrarlo
                %>
            <%
            }
            %>

            <form action="validarLogin.jsp" method="post">
                <label for="usuario">Usuario</label>
                <input type="text" id="usuario" name="usuario" required>

                <label for="clave">Contraseña</label>
                <input type="password" id="clave" name="clave" required>

                <button type="submit">Ingresar</button>
            </form>
            <p>¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Christian Labrys - Derechos reservados</p>
        <div class="social-icons">
            <a href="https://facebook.com"><img src="Iconos/facebook.png" alt="Facebook"></a>
            <a href="https://instagram.com"><img src="Iconos/instagram.png" alt="Instagram"></a>
            <a href="https://wa.me/5491234567890"><img src="Iconos/whatsapp.png" alt="WhatsApp"></a>
            <a href="https://linkedin.com/in/christian-isac-hidalgo-murillo-88a574325"><img src="Iconos/linkedin.png" alt="LinkedIn"></a>
        </div>
    </footer>

</body>
</html>
