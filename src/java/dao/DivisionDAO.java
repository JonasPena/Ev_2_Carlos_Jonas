/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Division;


/**
 *
 * @author Edgard
 */
public class DivisionDAO extends Conexion {
    
    public int registrar(Division division) throws SQLException{
        String sentencia = "Insert into division (nombre) values (?)";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, division.getNombre());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public int modificar(Division division) throws SQLException{
        String sentencia = "update division set nombre = ? where id = ?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, division.getNombre());
            ps.setInt(2, division.getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public int eliminar(Division division) throws SQLException{
        String sentencia = "delete from division where id = ?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, division.getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public Division obtenerDivision(int id) throws SQLException{
        String sentencia = "select * from division where id=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Division(rs.getInt("id"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    public Division obtenerDivision(String nombre) throws SQLException{
        String sentencia = "select * from division where nombre=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, nombre);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Division (rs.getInt("id"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    public ArrayList<Division> obtenerDivision() throws SQLException{
        String sentencia = "select * from division";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Division> division = new ArrayList();
            while(rs.next()){
                division.add(new Division(rs.getInt("id"),rs.getString("nombre")));
            }
            return division;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
}


