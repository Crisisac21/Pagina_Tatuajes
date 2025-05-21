<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Obtener la sesión y cerrarla
    HttpSession sesionOk = request.getSession();
    sesionOk.invalidate();
%>

<jsp:forward page="login.jsp" />

</body>
</html>