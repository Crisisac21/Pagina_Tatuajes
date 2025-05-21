package com.producto.seguridad;

public class EstadoCivil {
    private int Id;
    private String Descripcion;

    public EstadoCivil(int nid, String ndescripcion) {
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

    public String mostrarEstadoCivil() {
        return "ID: " + this.Id + ", Descripción: " + this.Descripcion;
    }
}
