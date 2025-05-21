<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.*, com.producto.seguridad.Usuario, com.producto.seguridad.Pagina" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
    <script>
        function validarFormulario() {
            let claveAnterior = document.getElementById("claveAnterior").value;
            let claveNueva = document.getElementById("claveNueva").value;
            let repetirClaveNueva = document.getElementById("repetirClaveNueva").value;

            let mensajeError = "";

            if (claveAnterior.trim() === "") {
                mensajeError += "Debe ingresar la clave anterior.\n";
            }

            if (claveNueva.length < 6) {
                mensajeError += "La nueva clave debe tener al menos 6 caracteres.\n";
            }

            if (claveNueva !== repetirClaveNueva) {
                mensajeError += "Las claves nuevas no coinciden.\n";
            }

            if (mensajeError !== "") {
                alert(mensajeError);
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <nav>
        <ul>
            <li><a href="">Productos</a></li>
            <li><a href="bitacora.jsp">Bitácora</a></li>
            <li><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>
        </ul>
    </nav>

    <header>
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda">
        <h1>Christian Labrys</h1>
    </header>

    <section>
        <h2>Cambiar Contraseña</h2>
        <form action="respuesta.jsp" method="post" onsubmit="return validarFormulario();">
            <table border="1">
                <tr>
                    <th><label for="claveAnterior">Clave Anterior:</label></th>
                    <td><input type="password" name="claveAnterior" id="claveAnterior" required></td>
                </tr>
                <tr>
                    <th><label for="claveNueva">Nueva Clave:</label></th>
                    <td><input type="password" name="claveNueva" id="claveNueva" required></td>
                </tr>
                <tr>
                    <th><label for="repetirClaveNueva">Repetir Nueva Clave:</label></th>
                    <td><input type="password" name="repetirClaveNueva" id="repetirClaveNueva" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Cambiar Contraseña">
                    </td>
                </tr>
            </table>
            <%
    String mensaje = "";
    Usuario usuario = new Usuario();

    String claveAnterior = request.getParameter("claveAnterior");
    String claveNueva = request.getParameter("claveNueva");
    String repetirClaveNueva = request.getParameter("repetirClaveNueva");
    String correo = (String) session.getAttribute("correoUsuario"); // Obtener correo de sesión

    if (claveAnterior != null && claveNueva != null && repetirClaveNueva != null) {
        // Verificar si la clave anterior es válida
        if (!usuario.verificarClave(claveAnterior)) {
            mensaje = "Error: La clave anterior es incorrecta.";
        } else if (!usuario.coincidirClaves(claveNueva, repetirClaveNueva)) {
            mensaje = "Error: Las nuevas claves no coinciden.";
        } else {
            // Cambiar la clave
            if (usuario.CambiarClave(correo, claveNueva)) {
                mensaje = "Contraseña cambiada correctamente.";
            } else {
                mensaje = "Error al cambiar la contraseña.";
            }
        }
    }
%>
        </form>
    </section>

    <footer>
        <p>2025 Christian Labrys - Derechos reservados</p>
    </footer>
</body>
</html>
