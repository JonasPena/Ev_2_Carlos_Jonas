/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author Edgard
 */
public class Estadio {
    private long codigo;
    private String nombre;
    private Ciudad ciudad;
    private int capacidad;

   

    public Estadio() {
    }

    public Estadio(long codigo, String nombre,Ciudad ciudad, int capacidad) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.capacidad = capacidad ;
      
       
    }

    public long getCodigo() {
        return codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

   
    
    
}
