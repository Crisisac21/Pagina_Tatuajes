<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.producto.seguridad.Usuario" session="true" %>

<%
Usuario usuario = new Usuario();
String nlogin = request.getParameter("usuario");
String nclave = request.getParameter("clave");
HttpSession sesion = request.getSession();

if (nlogin != null && nclave != null && usuario.verificarUsuario(nlogin, nclave)) {
    sesion.setAttribute("usuario", usuario.getNombre());
    sesion.setAttribute("perfil", usuario.getPerfil());
    response.sendRedirect("menu.jsp");
} else {
    sesion.setAttribute("mensajeError", "Datos incorrectos. Vuelva a intentarlo.");
    response.sendRedirect("login.jsp");
}
%>
