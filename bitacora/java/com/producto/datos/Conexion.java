package com.producto.datos;

import java.sql.*;

public class Conexion {
    private Statement St;
    private String driver;
    private String user;
    private String pwd;
    private String cadena;
    private Connection con;

    String getDriver() {
        return this.driver;
    }

    String getUser() {
        return this.user;
    }

    String getPwd() {
        return this.pwd;
    }

    String getCadena() {
        return this.cadena;
    }

    public Connection getConexion() {
        return this.con;
    }

    public Conexion() {
        this.driver = "org.postgresql.Driver";
        this.user = "postgres";
        this.pwd = "admin";
        this.cadena = "jdbc:postgresql://localhost:5432/bd_tatuajes";
        this.con = this.crearConexion();
    }

    Connection crearConexion() {
        Connection nuevaCon = null;
        try {
            Class.forName(getDriver());
            nuevaCon = DriverManager.getConnection(getCadena(), getUser(), getPwd());
        } catch (Exception ee) {
            System.out.println("Error al crear conexión: " + ee.getMessage());
        }
        return nuevaCon;
    }

    public String Ejecutar(String sql) {
        String error = "";
        try {
            if (con == null || con.isClosed()) {
                con = crearConexion();
            }
            St = con.createStatement();
            St.execute(sql);
            error = "Datos insertados correctamente";
        } catch (Exception ex) {
            error = ex.getMessage();
            System.out.println("Error al ejecutar: " + ex.getMessage());
        }
        return error;
    }

    public ResultSet Consulta(String sql) {
        ResultSet reg = null;
        try {
            if (con == null || con.isClosed()) {
                con = crearConexion();
            }
            if (con != null) {
                St = con.createStatement();
                reg = St.executeQuery(sql);
            } else {
                System.out.println("Error: No hay conexión a la base de datos.");
            }
        } catch (SQLException ee) {
            System.out.println("Error al ejecutar la consulta SQL: " + ee.getMessage());
        } catch (Exception e) {
            System.out.println("Error inesperado: " + e.getMessage());
        }
        return reg;
    }
    public void cerrarConexion() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}
