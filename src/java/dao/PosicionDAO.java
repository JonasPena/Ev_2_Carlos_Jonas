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
import modelos.Posicion;


/**
 *
 * @author Edgard
 */
public class PosicionDAO extends Conexion {
    
    public int registrar(Posicion posicion) throws SQLException{
        String sentencia = "Insert into posicion (nombre) values (?)";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, posicion.getNombre());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public int modificar(Posicion posicion) throws SQLException{
        String sentencia = "update posicion set nombre = ? where id = ?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, posicion.getNombre());
            ps.setInt(2, posicion.getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public int eliminar(Posicion posicion) throws SQLException{
        String sentencia = "delete from posicion where id = ?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, posicion.getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public Posicion obtenerPosicion(int id) throws SQLException{
        String sentencia = "select * from posicion where id=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Posicion(rs.getInt("id"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    public Posicion obtenerPosicion(String nombre) throws SQLException{
        String sentencia = "select * from posicion where nombre=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, nombre);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Posicion (rs.getInt("id"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    public ArrayList<Posicion> obtenerPosicion() throws SQLException{
        String sentencia = "select * from posicion";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Posicion> posicion = new ArrayList();
            while(rs.next()){
                posicion.add(new Posicion(rs.getInt("id"),rs.getString("nombre")));
            }
            return posicion;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
}


