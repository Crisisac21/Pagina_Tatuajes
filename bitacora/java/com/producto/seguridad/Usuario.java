package com.producto.seguridad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.producto.datos.Conexion;

public class Usuario {

    private int Id;
    private Integer perfil;
    private int estadoCivil;
    private String cedula;
    private String nombre;
    private String correo;
    private String clave;
    private boolean bloqueado;
    public Usuario() {
		// TODO Auto-generated constructor stub
	}
    public Usuario(Integer perfil, String nombre, String cedula, int estadoCivil, String correo, String clave) {
        this.perfil = perfil;
        this.nombre = nombre;
        this.cedula = cedula;
        this.estadoCivil = estadoCivil;
        this.correo = correo;
        this.clave = clave;
    }
    public Usuario(int id, Integer perfil, int estadoCivil, String cedula, String nombre, String correo, boolean bloqueado) {
        this.Id = id;
        this.perfil = perfil;
        this.estadoCivil = estadoCivil;
        this.cedula = cedula;
        this.nombre = nombre;
        this.correo = correo;
        this.bloqueado = bloqueado;
    }
    public Usuario(int id, String nombre, String clave) {
        this.Id = id;
        this.nombre = nombre;
        this.clave = clave;
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
	public boolean isBloqueado() {
        return bloqueado;
    }

    public void setBloqueado(boolean bloqueado) {
        this.bloqueado = bloqueado;
    }
    public boolean verificarUsuario(String ncorreo, String nclave) {
        boolean respuesta = false;
        String sentencia = "SELECT * FROM tb_usuario WHERE correo_us=? AND clave_us=?";
        
        try {
            Conexion clsCon = new Conexion();
            PreparedStatement ps = clsCon.getConexion().prepareStatement(sentencia);
            ps.setString(1, ncorreo);
            ps.setString(2, nclave);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                respuesta = true;
                this.setCorreo(ncorreo);
                this.setClave(nclave);
                this.setId(rs.getInt("id_us"));  // 🔥 Guarda id_us en el objeto Usuario
                this.setPerfil(rs.getInt("id_per"));
                this.setNombre(rs.getString("nombre_us"));
                this.setBloqueado(rs.getBoolean("bloqueado"));
            }
            
            rs.close();
            ps.close();
        } catch (Exception ex) {
            System.out.println("Error SQL: " + ex.getMessage());
        }
        return respuesta;
    }

	
	public String ingresarCliente() {
	    String result = "";
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    
	    try {
	     
	        String checkSQL = "SELECT COUNT(*) FROM tb_usuario WHERE cedula_us = ? OR correo_us = ?";
	        PreparedStatement checkStmt = con.getConexion().prepareStatement(checkSQL);
	        checkStmt.setString(1, this.getCedula());
	        checkStmt.setString(2, this.getCorreo());
	        ResultSet rs = checkStmt.executeQuery();
	        
	        if (rs.next() && rs.getInt(1) > 0) {
	            result = "Error: El usuario ya existe.";
	            return result; 
	        }
	        
	        String newIdSQL = "SELECT COALESCE(MAX(id_us), 0) + 1 FROM tb_usuario";
	        PreparedStatement newIdStmt = con.getConexion().prepareStatement(newIdSQL);
	        ResultSet newIdRs = newIdStmt.executeQuery();
	        int newId = (newIdRs.next()) ? newIdRs.getInt(1) : 1;
	        
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
	    String clave = "654321";  // aquí podrías aplicar un hash para mayor seguridad

	    try {
	        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) VALUES (?, ?, ?, ?, ?, ?)";
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, nperfil);
	        pr.setInt(2, nestado);
	        pr.setString(3, nnombre);
	        pr.setString(4, ncedula);
	        pr.setString(5, ncorreo);
	        pr.setString(6, clave); 

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


	  // Método para verificar la clave en la base de datos sin hashing
    public boolean verificarClave(String correo, String clave) {
        boolean resultado = false;
        Conexion con = new Conexion();
        try {
            String sql = "SELECT COUNT(*) FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                resultado = true;
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error SQL al verificar clave: " + ex.getMessage());
        } finally {
            try {
                con.getConexion().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultado;
    }

    // Método para verificar si las claves coinciden
    public boolean coincidirClaves(String nclave, String nrepetir) {
        return nclave.equals(nrepetir);
    }

    // Método para cambiar la clave de un usuario sin hashing
    public boolean cambiarClave(int idUsuario, String nuevaClave) {
        boolean resultado = false;
        Conexion con = new Conexion();
        PreparedStatement pr = null;

        try {
            String sql = "UPDATE tb_usuario SET clave_us = ? WHERE id_us = ?";
            pr = con.getConexion().prepareStatement(sql);
            pr.setString(1, nuevaClave);
            pr.setInt(2, idUsuario);

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

    public static Usuario buscarPorId_c(int id) {
        Usuario usuario = null;
        Conexion con = new Conexion();
        try {
            String sql = "SELECT id_us, nombre_us, clave_us FROM tb_usuario WHERE id_us = ?";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	usuario = new Usuario(
                rs.getInt("id_us"),
               rs.getString("nombre_us"),
               rs.getString("clave_us")
                		);
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error SQL al buscar usuario por ID: " + ex.getMessage());
        } finally {
            try {
                con.getConexion().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuario;
    }

    public boolean actualizarUsuario(int id, int perfil, int estadoCivil, String cedula, String nombre, String correo) {
        String sql = "UPDATE tb_usuario SET id_per = ?, id_est = ?, cedula_us = ?, nombre_us = ?, correo_us = ? WHERE id_us = ?";
        Conexion conexion = new Conexion();
        try (Connection con = conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, perfil);
            ps.setInt(2, estadoCivil);
            ps.setString(3, cedula);
            ps.setString(4, nombre);
            ps.setString(5, correo);
            ps.setInt(6, id);
            int filas = ps.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public static List<Usuario> obtenerTodosUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        Conexion con = new Conexion();
        try {
            String sql = "SELECT id_us, id_per, id_est, nombre_us, cedula_us, correo_us, bloqueado FROM tb_usuario";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_us"));
                u.setPerfil(rs.getInt("id_per"));
                u.setEstadoCivil(rs.getInt("id_est"));
                u.setNombre(rs.getString("nombre_us"));
                u.setCedula(rs.getString("cedula_us"));
                u.setCorreo(rs.getString("correo_us"));
                u.setBloqueado(rs.getBoolean("bloqueado"));
                lista.add(u);
            }
            rs.close();
            ps.close();
            con.getConexion().close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean cambiarEstadoBloqueo(int id, boolean bloquear) {
        String sql = "UPDATE tb_usuario SET bloqueado = ? WHERE id_us = ?";
        try (Connection con = new Conexion().getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setBoolean(1, bloquear);
            ps.setInt(2, id);
            int filas = ps.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            System.out.println("Error cambiarEstadoBloqueo: " + e.getMessage());
            return false;
        }
    }

    public static Usuario buscarPorId(int id) {
        Usuario u = null;
        String sql = "SELECT id_us, id_per, id_est, cedula_us, nombre_us, correo_us, bloqueado FROM tb_usuario WHERE id_us = ?";
        try (Connection con = new Conexion().getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new Usuario(
                            rs.getInt("id_us"),
                            rs.getInt("id_per"),
                            rs.getInt("id_est"),
                            rs.getString("cedula_us"),
                            rs.getString("nombre_us"),
                            rs.getString("correo_us"),
                            rs.getBoolean("bloqueado")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("Error buscarPorId: " + e.getMessage());
        }
        return u;
    }
    public static Usuario buscarPorCorreo(String correo) {
        Usuario u = null;
        String sql = "SELECT id_us, id_per, id_est, cedula_us, nombre_us, correo_us, bloqueado FROM tb_usuario WHERE correo_us = ?";
        try (Connection con = new Conexion().getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new Usuario(
                        rs.getInt("id_us"),
                        rs.getInt("id_per"),
                        rs.getInt("id_est"),
                        rs.getString("cedula_us"),
                        rs.getString("nombre_us"),
                        rs.getString("correo_us"),
                        rs.getBoolean("bloqueado")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("Error buscarPorCorreo: " + e.getMessage());
        }
        return u;
    }

}

