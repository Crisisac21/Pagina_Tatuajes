<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*, com.producto.seguridad.Usuario, com.producto.seguridad.Pagina" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Respuesta del Registro</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header>
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo Christian Labrys">
        <h1>Christian Labrys</h1>
    </header>

    <nav>
        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="producto.jsp">Productos</a></li>
            <li><a href="contacto.jsp">Contacto</a></li>
        </ul>
    </nav>

    <section>
        <h2>Datos del Cliente Registrado</h2>

        <%
            String nombre = request.getParameter("txtNombre");
            String cedula = request.getParameter("txtCedula");
            String estadoCivil = request.getParameter("cmbECivil");
            String lugarResidencia = request.getParameter("rdResidencia");
            String mesAnioNacimiento = request.getParameter("mesAnioNacimiento");
            String colorFavorito = request.getParameter("colorFavorito");
            String correo = request.getParameter("txtCorreo");
            String clave = request.getParameter("txtClave"); 
        %>

        <table border="1">
            <tr>
                <th>Nombre:</th>
                <td><%= nombre %></td>
            </tr>
            <tr>
                <th>Cédula:</th>
                <td><%= cedula %></td>
            </tr>
            <tr>
                <th>Estado Civil:</th>
                <td><%= estadoCivil %></td>
            </tr>
            <tr>
                <th>Residencia:</th>
                <td><%= lugarResidencia %></td>
            </tr>
            <tr>
                <th>Mes y Año de Nacimiento:</th>
                <td><%= mesAnioNacimiento %></td>
            </tr>
            <tr>
                <th>Color Favorito:</th>
                <td><span style="color:<%= colorFavorito %>;">▉</span></td>
            </tr>
            <tr>
                <th>Correo Electrónico:</th>
                <td><%= correo %></td>
            </tr>
            <tr>
    <th>Clave:</th>
    <td><%= clave %></td> 
</tr>
<tr>
    <th>Imagen:</th>
    <td><img src="<%= request.getAttribute("imagen") %>" width="150" alt="Imagen del cliente"></td>
</tr>
        </table>
        
        <%
			Usuario user = new Usuario();
      
        user.setNombre(nombre);
        user.setCedula(cedula);
        user.setEstadoCivil(Integer.parseInt(estadoCivil));
        user.setCorreo(correo);
        user.setClave(clave);
        String mensaje = user.ingresarCliente();
        %>
    </section>

    <footer>
        <p>2025 Christian Labrys - Derechos Reservados</p>
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
            <a href="https://www.linkedin.com/in/christian-isac-hidalgo-murillo-88a574325">
                <img src="Iconos/linkedin.png" alt="LinkedIn">
            </a>
        </div>
    </footer>
</body>
</html>