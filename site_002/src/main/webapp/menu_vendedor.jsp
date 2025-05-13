<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.producto.seguridad.Usuario, com.producto.seguridad.Pagina" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Vendedor - Sitio Privado de Productos</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <nav>
        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="">Administrar Productos</a></li>
            <li><a href="cerrarsesion.jsp">Cerrar Sesión</a></li>
        </ul>
    </nav>

    <header>
        <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda">
        <h1>Christian Labrys - Menú de Vendedor</h1>
    </header>

    <section class="bienvenida">
        <%
        HttpSession sesion = request.getSession();
       
        String usuario;
      
        if (sesion.getAttribute("usuario") == null) 
        {
        %>
        <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe registrarse en el sistema."/>
        </jsp:forward>
        <%
        }
        else
        {
        usuario=(String)sesion.getAttribute("usuario"); 
        int perfil=(Integer)sesion.getAttribute("perfil");
        %>
       <h1>Sitio Privado de Productos</h1>
       <h4>Bienvenido<h4/>
       <%
      out.println(usuario);
       %>
       
       <%
       Pagina pag=new Pagina();
       String menu=pag.mostrarMenu(perfil);
       
       out.print(menu);
       
       %>
        <%}%>

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
