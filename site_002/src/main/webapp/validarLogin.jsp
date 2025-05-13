<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.producto.seguridad.Usuario" session="true" %>

<%
    // Obtener parámetros del formulario
    String nlogin = request.getParameter("usuario");
    String nclave = request.getParameter("clave");
    HttpSession sesion = request.getSession();

    // Crear instancia de Usuario para validar credenciales
    Usuario usuario = new Usuario();

    if (nlogin != null && nclave != null && usuario.verificarUsuario(nlogin, nclave)) {
        // Guardar datos en sesión
        sesion.setAttribute("usuario", usuario.getNombre());
        sesion.setAttribute("perfil", usuario.getPerfil());

        int perfil = usuario.getPerfil(); 

        if (perfil == 1) {
            response.sendRedirect("menu.jsp"); 
        } else if (perfil == 2) {
            response.sendRedirect("Menu_cliente.jsp"); 
        } else if (perfil == 3) {
            response.sendRedirect("menu_vendedor.jsp"); 
        } else {
            response.sendRedirect("login.jsp"); 
        }
    } else {
      
        sesion.setAttribute("mensajeError", "Usuario o contraseña incorrectos.");
        response.sendRedirect("login.jsp");
    }
%>