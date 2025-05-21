package com.producto.seguridad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.producto.datos.Conexion;

public class Usuario {

    private int Id;
    private Integer perfil;
    private int estadoCivil;
    private String cedula;
    private String nombre;
    private String correo;
    private String clave;
    
    public Usuario() {
		// TODO Auto-generated constructor stub
	}
 public Usuario(Integer nperfil,String nnombre,String ncedula,int nestado,String ncorreo,String nclave) {
	 //TODO Auto-generated constructor stub
	 this.nombre=nnombre;
	 this.cedula=ncedula;
	 this.estadoCivil=nestado;
	 this.correo=ncorreo;
	 this.clave=nclave;
	 this.perfil=nperfil;
 }
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public Integer getPerfil() {
		return perfil;
	}

	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}

	public int getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(int estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public boolean verificarUsuario(String ncorreo, String nclave)
	{
	boolean respuesta=false;
	String sentencia= "Select * from tb_usuario where correo_us='"+ncorreo+
	"' and clave_us='"+nclave+"';";

	try
	{
	ResultSet rs;
	Conexion clsCon=new Conexion();
	rs=clsCon.Consulta(sentencia);
	if(rs.next())
	{
	respuesta=true;
	this.setCorreo(ncorreo);
	this.setClave(nclave);
	Integer n=(Integer)(rs.getObject(2));
	this.setPerfil(n);
	this.setNombre(rs.getString(4));
	}
	else
	{
	respuesta=false;
	rs.close();
	}
	}
	catch(Exception ex)
	{
	System.out.println( ex.getMessage());
	}
	return respuesta;
	}
	
	public String ingresarCliente() {
	    String result = "";
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    
	    try {
	        // Verificar si el usuario ya existe por su cédula o correo
	        String checkSQL = "SELECT COUNT(*) FROM tb_usuario WHERE cedula_us = ? OR correo_us = ?";
	        PreparedStatement checkStmt = con.getConexion().prepareStatement(checkSQL);
	        checkStmt.setString(1, this.getCedula());
	        checkStmt.setString(2, this.getCorreo());
	        ResultSet rs = checkStmt.executeQuery();
	        
	        if (rs.next() && rs.getInt(1) > 0) {
	            result = "Error: El usuario ya existe.";
	            return result; // Detener la inserción
	        }
	        
	        // Obtener el próximo ID disponible
	        String newIdSQL = "SELECT COALESCE(MAX(id_us), 0) + 1 FROM tb_usuario";
	        PreparedStatement newIdStmt = con.getConexion().prepareStatement(newIdSQL);
	        ResultSet newIdRs = newIdStmt.executeQuery();
	        int newId = (newIdRs.next()) ? newIdRs.getInt(1) : 1;
	        
	        // Insertar el nuevo usuario con el ID generado
	        String sql = "INSERT INTO tb_usuario (id_us, id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, newId);
	        pr.setInt(2, 2);
	        pr.setInt(3, this.getEstadoCivil());
	        pr.setString(4, this.getNombre());
	        pr.setString(5, this.getCedula());
	        pr.setString(6, this.getCorreo());
	        pr.setString(7, this.getClave());

	        if (pr.executeUpdate() == 1) {
	            result = "Inserción correcta";
	        } else {
	            result = "Error en inserción";
	        }
	    } catch (SQLException ex) {
	        result = "Error SQL: " + ex.getMessage();
	        System.out.print(result);
	    } finally {
	        try {
	            if (pr != null) pr.close();
	            con.getConexion().close();
	        } catch (SQLException ex) {
	            System.out.print(ex.getMessage());
	        }
	    }

	    return result;
	}

	public boolean IngresarEmpleado(Integer nperfil, int nestado, String ncedula, String nnombre, String ncorreo) {
	    boolean resultado = false;
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;

	    try {
	        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us) VALUES (?, ?, ?, ?, ?)";
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, nperfil);
	        pr.setInt(2, nestado);
	        pr.setString(3, nnombre);
	        pr.setString(4, ncedula);
	        pr.setString(5, ncorreo);

	        if (pr.executeUpdate() == 1) {
	            resultado = true;
	        }
	    } catch (SQLException ex) {
	        System.out.println("Error SQL: " + ex.getMessage());
	    } finally {
	        try {
	            if (pr != null) pr.close();
	            con.getConexion().close();
	        } catch (SQLException ex) {
	            System.out.println(ex.getMessage());
	        }
	    }

	    return resultado;
	}

	public boolean verificarClave(String nclave) {
	    boolean resultado = false;
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT COUNT(*) FROM tb_usuario WHERE clave_us = ?";
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setString(1, nclave);
	        rs = pr.executeQuery();

	        if (rs.next() && rs.getInt(1) > 0) {
	            resultado = true;
	        }
	    } catch (SQLException ex) {
	        System.out.println("Error SQL: " + ex.getMessage());
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pr != null) pr.close();
	            con.getConexion().close();
	        } catch (SQLException ex) {
	            System.out.println(ex.getMessage());
	        }
	    }

	    return resultado;
	}

	public boolean coincidirClaves(String nclave, String nrepetir) {
	    return nclave.equals(nrepetir);
	}

	public boolean CambiarClave(String ncorreo, String nclave) {
	    boolean resultado = false;
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;

	    try {
	        String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setString(1, nclave);
	        pr.setString(2, ncorreo);

	        if (pr.executeUpdate() == 1) {
	            resultado = true;
	        }
	    } catch (SQLException ex) {
	        System.out.println("Error SQL: " + ex.getMessage());
	    } finally {
	        try {
	            if (pr != null) pr.close();
	            con.getConexion().close();
	        } catch (SQLException ex) {
	            System.out.println(ex.getMessage());
	        }
	    }

	    return resultado;
	}


}