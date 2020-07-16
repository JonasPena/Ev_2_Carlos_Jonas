
package modelos;

public class Jugador {
    private String id;
    private String nombre;
    private String apellido;
    private String password;
    private String FechaNacimiento;
    private String Posicion;
    private String Sueldo;
    private String EquipoActual;
 
    
    
    
    public Jugador(String id, String nombre, String apellido, String password,
            String FechaNacimiento,String Posicion,String Sueldo,String EquipoActual) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
        this.FechaNacimiento = FechaNacimiento;
        this.Posicion = Posicion;
        this.Sueldo = Sueldo;
        this.EquipoActual = EquipoActual;
    }

    public Jugador(String id, String password) {
        this.id = id;
        this.password = password;
    }

    public Jugador() {
    }

    public Jugador(String id, String nombre, String apellido, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Jugador(String id, String nombre, String Procedencia) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getPassword() {
        return password;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public String getPosicion() {
        return Posicion;
    }

    public String getSueldo() {
        return Sueldo;
    }

    public String getEquipoActual() {
        return EquipoActual;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public void setPosicion(String Posicion) {
        this.Posicion = Posicion;
    }

    public void setSueldo(String Sueldo) {
        this.Sueldo = Sueldo;
    }

    public void setEquipoActual(String EquipoActual) {
        this.EquipoActual = EquipoActual;
    }

    
    @Override
    public String toString() {
        return "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido;
    }
    
    
    
         
}
