package com.producto.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.producto.datos.Conexion;

public class Perfil {
    private int Id;
    private String Descripcion;

    public Perfil(int nid, String ndescripcion) {
        this.Id = nid;
        this.Descripcion = ndescripcion;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public String consultaPerfil(int id) {
        String resultado = "Perfil no encontrado";
        Conexion con = new Conexion();
        try {
            String sql = "SELECT descripcion FROM tb_perfil WHERE id_per = ?";
            PreparedStatement pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();

            if (rs.next()) {
                resultado = "ID: " + id + ", Descripción: " + rs.getString("descripcion");
            }
        } catch (SQLException ex) {
            resultado = "Error SQL: " + ex.getMessage();
        }
        return resultado;
    }

    public String mostrarPerfil() {
        return "ID: " + this.Id + ", Descripción: " + this.Descripcion;
    }
}
