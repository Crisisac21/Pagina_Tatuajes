<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.*, com.producto.seguridad.Usuario, com.producto.seguridad.Pagina" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Cliente</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
    <script>
   
   
        function validarFormulario() {
            let nombre = document.getElementById("txtNombre").value;
            let cedula = document.getElementById("txtCedula").value;
            let email = document.getElementById("txtCorreo").value;
            let clave = document.getElementById("clave").value;

            let mensajeError = "";

            // Validar que el nombre no esté vacío
            if (nombre.trim() === "") {
                mensajeError += "El campo Nombre es obligatorio.\n";
            }

            // Validar que la cédula tenga 10 dígitos
            if (cedula.length !== 10 || isNaN(cedula)) {
                mensajeError += "La Cédula debe tener exactamente 10 números.\n";
            }

            // Validar formato de correo
            let regexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!regexEmail.test(email)) {
                mensajeError += "Ingrese un correo electrónico válido.\n";
            }

            // Validar que la clave tenga al menos 6 caracteres
            if (clave.length < 6) {
                mensajeError += "La clave debe tener al menos 6 caracteres.\n";
            }

            // Mostrar mensaje de error si hay problemas
            if (mensajeError !== "") {
                alert(mensajeError);
                return false; // Detener envío del formulario
            }
            
            return true;
        }
    </script>
    
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
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda">
        <h1>Christian Labrys</h1>
    </header>

    <section>
        <h2>Registro de Cliente</h2>
        <form action="respuesta.jsp" method="post" onsubmit="return validarFormulario();">
            <table border="1">
                <tr>
                    <th><label for="txtNombre">Nombre:</label></th>
                    <td><input type="text" name="txtNombre" id="txtNombre" required></td>
                </tr>
                <tr>
                    <th><label for="txtCedula">Cédula:</label></th>
                    <td><input type="text" name="txtCedula" id="txtCedula" maxlength="10" required></td>
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
                    <th>Lugar de Residencia:</th>
                    <td>
                        <input type="radio" name="rdResidencia" value="Sur" required> Sur
                        <input type="radio" name="rdResidencia" value="Norte"> Norte
                        <input type="radio" name="rdResidencia" value="Centro"> Centro
                    </td>
                </tr>
                <tr>
                    <th><label for="mesAnioNacimiento">Mes y Año de Nacimiento:</label></th>
                    <td><input type="month" name="mesAnioNacimiento" id="mesAnioNacimiento" required></td>
                </tr>
                <tr>
                    <th><label for="colorFavorito">Color Favorito:</label></th>
                    <td><input type="color" name="colorFavorito" id="colorFavorito"></td>
                </tr>
                <tr>
            <th><label for="imagenPerfil">Foto de Perfil:</label></th>
            <td>
                <input type="file" name="imagenPerfil" id="imagenPerfil" accept=".jpg, .jpeg, .png" required>
            </td>
        </tr>
                
                <tr>
                    <th><label for="txtCorreo">Correo Electrónico:</label></th>
                    <td><input type="email" name="txtCorreo" id="txtCorreo" required></td>
                </tr>
                <tr>
                    <th><label for="clave">Clave:</label></th>
                    <td><input type="password" id="clave" name="txtClave" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Registrarse">
                    </td>
                </tr>
            </table>
        </form>
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
            <a href="https://www.linkedin.com/in/christian-isac-hidalgo-murillo-88a574325">
                <img src="Iconos/linkedin.png" alt="LinkedIn">
            </a>
        </div>
    </footer>
</body>
</html>