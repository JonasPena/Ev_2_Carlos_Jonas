
package dao;

import dao.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Jugador;
import modelos.Usuario;

public class JugadorDAO extends Conexion {
    public int registrarJugador(Jugador u) throws ClassNotFoundException, SQLException{
        String sentencia = "insert into usuario values (?,?,?,?)";
        try{
        conectar();
        PreparedStatement ps= obtenerPS(sentencia);
        ps.setString(1, u.getId());
        ps.setString(2, u.getNombre());
        ps.setString(3, u.getApellido());
        ps.setString(4, u.getPassword());
        ps.setString(5, u.getFechaNacimiento());
        ps.setString(6, u.getPosicion());
        ps.setString(7, u.getSueldo());
        ps.setString(4, u.getEquipoActual());
        int r = ps.executeUpdate();
        return r;
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }

    public ArrayList<Jugador> obtenerJugador() throws ClassNotFoundException, SQLException{
        String sentencia = "select * from usuario";
        try{
        conectar();
        PreparedStatement ps= obtenerPS(sentencia);
        ResultSet rs = ps.executeQuery();
        ArrayList<Jugador> lista = new ArrayList();
        while(rs.next()){
            lista.add(new Jugador(rs.getString("id"),rs.getString("nombre"),
                    rs.getString("apellido"),rs.getString("password")));
        }
        return lista;
        }catch(Exception e){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
    public Jugador obtenerJugador(String id) throws ClassNotFoundException, SQLException{
        String sentencia = "select * from usuario where id = ?";
        try{
        conectar();
        PreparedStatement ps= obtenerPS(sentencia);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        Jugador u = null;
        if(rs.next()){
           u = new Jugador(rs.getString("id"),rs.getString("nombre"),
                   rs.getString("apellido"),rs.getString("password"));
        }
        return u;
        }catch(Exception e){
            return null;
        }finally{
            desconectar();
        }
    }
    
}
