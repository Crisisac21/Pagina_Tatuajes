<%@ page import="java.sql.*" %>
<%@ page import="com.producto.datos.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Bitácora de Auditoría</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Christian Labrys</a>
    </div>
    <div class="container">
    <div class="d-flex justify-content-end gap-2">
        <form action="login.jsp" method="get">
            <button type="submit" class="btn btn-danger">🚪 Salir</button>
        </form>
        <form action="menu.jsp" method="get">
            <button type="submit" class="btn btn-secondary">📜 Menu</button>
        </form>
    </div>
</div>
</nav>

<header class="text-center py-4">
    <img class="logo" src="Imagenes/logan.jpg" alt="Logo de la Tienda" style="max-width: 200px;">
    <h1>Christian Labrys</h1>
</header>

<div class="container mt-5">
    <h2 class="mb-4 text-center">📜 Bitácora de Auditoría</h2>

    <%
        Conexion conexion = null;
        ResultSet rs = null;

        try {
            conexion = new Conexion();
            String consulta = "SELECT id_aud, tabla_aud, operacion_aud, valoranterior_aud, valornuevo_aud, fecha_aud, usuario_aud " +
                              "FROM auditoria.tb_auditoria ORDER BY fecha_aud DESC";
            rs = conexion.Consulta(consulta);

            if (rs != null) {
    %>

    <div class="table-responsive">
        <table class="table table-bordered text-center shadow">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Tabla</th>
                    <th>Operación</th>
                    <th>Valor Anterior</th>
                    <th>Valor Nuevo</th>
                    <th>Fecha</th>
                    <th>Usuario</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("id_aud") %></td>
                    <td><%= rs.getString("tabla_aud") %></td>
                    <td><%= rs.getString("operacion_aud") %></td>
                    <td><%= rs.getString("valoranterior_aud") %></td>
                    <td><%= rs.getString("valornuevo_aud") %></td>
                    <td><%= rs.getDate("fecha_aud") %></td>
                    <td><%= rs.getString("usuario_aud") %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <%
            } else {
                out.println("<p class='alert alert-warning text-center'>📭 No hay registros en la bitácora.</p>");
            }
        } catch (Exception e) {
            out.println("<p class='alert alert-danger text-center'>⚠️ Error al mostrar la bitácora: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {}
        }
    %>
</div>

<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>2025 Christian Labrys - Derechos reservados</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>