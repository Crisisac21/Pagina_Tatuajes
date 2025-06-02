package com.producto.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.producto.datos.Conexion;

public class categoria {
	private int id;
	private String nombre;
	public categoria() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String mostrarCategoria()
	{
	String combo="<select  class-from-select name=cmbCategoria>";
	String sql="SELECT * FROM tb_categoria";
	ResultSet rs=null;
	Conexion con=new Conexion();
	try
	{
	rs=con.Consulta(sql);
	while(rs.next())
	{
	combo+="<option value="+rs.getInt(1)+ ">"+rs.getString(2)+"</option>";
	}
	combo+="</select>";
	}
	catch(SQLException e)
	{
	System.out.print(e.getMessage());
	}
	return combo;
	}

}
