<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.producto.seguridad.Usuario, com.producto.seguridad.EstadoCivil, com.producto.seguridad.Perfil" %>

<%
    String mensaje = "";

    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String correo = request.getParameter("txtCorreo");
    String perfilStr = request.getParameter("cmbperfil");
    String estadoCivilStr = request.getParameter("cmbECivil");

    Usuario usuario = new Usuario();
    EstadoCivil estadoCivil = null;
    Perfil perfil = null;

    if (nombre != null && cedula != null && correo != null && perfilStr != null && estadoCivilStr != null) {
        try {
            Integer perfilId = Integer.parseInt(perfilStr);
            int estadoCivilId = Integer.parseInt(estadoCivilStr);

            // Registrar usuario
            boolean resultado = usuario.IngresarEmpleado(perfilId, estadoCivilId, cedula, nombre, correo);

            if (resultado) {
                mensaje = "Usuario registrado correctamente.";

                estadoCivil = new EstadoCivil(estadoCivilId, ""); 
                perfil = new Perfil(perfilId, "");

                mensaje += "<br>" + estadoCivil.mostrarEstadoCivil();
                mensaje += "<br>" + perfil.mostrarPerfil();
            } else {
                mensaje = " Error al registrar el usuario.";
            }
        } catch (NumberFormatException e) {
            mensaje = " Error en los valores ingresados.";
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <nav>
        <ul>
            <li><a href="">Gestión Usuario</a></li>
            <li><a href="bitacora.jsp">Bitácora</a></li>
            <li><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>
        </ul>
    </nav>

    <header>
        <h1>Gestión de Usuarios</h1>
    </header>

    <section>
        <!-- Mostrar mensajes de error o éxito -->
        <p style="color: red;"><%= mensaje %></p>

        <form action="usuarios.jsp" method="post">
            <table border="1" style="width: 100%; text-align: left;">
                <tr>
                    <th colspan="2" style="text-align: center;">Datos del Usuario</th>
                </tr>
                <tr>
                    <th><label for="txtNombre">Nombre:</label></th>
                    <td><input type="text" name="txtNombre" id="txtNombre" required></td>
                </tr>
                <tr>
                    <th><label for="txtCedula">Cédula:</label></th>
                    <td><input type="text" name="txtCedula" id="txtCedula" maxlength="10" required></td>
                </tr>
                <tr>
                    <th><label for="txtCorreo">Correo Electrónico:</label></th>
                    <td><input type="email" name="txtCorreo" id="txtCorreo" required></td>
                </tr>
                <tr>
                  
                </tr>
                <tr>
                    <th><label for="cmbperfil">Tipo de Perfil:</label></th>
                    <td>
                        <select name="cmbperfil" id="cmbperfil" required>
                            <option value="">Seleccione</option>
                            <option value="1">Administrador</option>
                            <option value="3">Vendedor</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="cmbECivil">Estado Civil:</label></th>
                    <td>
                        <select name="cmbECivil" id="cmbECivil" required>
                            <option value="">Seleccione</option>
                            <option value="2">Soltero</option>
                            <option value="1">Casado</option>
                            <option value="3">Divorciado</option>
                            <option value="4">Viudo</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Registrar Usuario">
                    </td>
                </tr>
            </table>
        </form>
    </section>

    <footer>
        <p>2025 Christian Labrys - Derechos reservados</p>
    </footer>
</body>
</html>
