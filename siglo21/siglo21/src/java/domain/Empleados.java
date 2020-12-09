package domain;
//import java.sql.Date;
import java.util.Date;
import java.sql.*;



/**
 *
 * @author Dr4g0n
 */
public class Empleados {
    
    
    private int id_empleado; //
    private String nombres; //
    private String apellidos; //
    private Empleos empleos; //
    private Cargos cargos; //
    private int salario; //
    private Date nacimiento; //
    private String direccion;//
    private String telefono; //
    private String email;//
    private int años_experiencia;//
    private String usuario;//
    private String password;//
    private String status_empleado; //
    private String rut;

    
    public Empleados() {
    }

    public Empleados(int id_empleado, String nombres, String apellidos, Empleos empleos, Cargos cargos, int salario, Date nacimiento, String direccion, String telefono, String email, int años_experiencia, String usuario, String password, String status_empleado, String rut) {
        this.id_empleado = id_empleado;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.empleos = empleos;
        this.cargos = cargos;
        this.salario = salario;
        this.nacimiento = nacimiento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.años_experiencia = años_experiencia;
        this.usuario = usuario;
        this.password = password;
        this.status_empleado = status_empleado;
        this.rut = rut;
    }

    /**
     * @return the id_empleado
     */
    public int getId_empleado() {
        return id_empleado;
    }

    /**
     * @param id_empleado the id_empleado to set
     */
    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the empleos
     */
    public Empleos getEmpleos() {
        return empleos;
    }

    /**
     * @param empleos the empleos to set
     */
    public void setEmpleos(Empleos empleos) {
        this.empleos = empleos;
    }

    /**
     * @return the cargos
     */
    public Cargos getCargos() {
        return cargos;
    }

    /**
     * @param cargos the cargos to set
     */
    public void setCargos(Cargos cargos) {
        this.cargos = cargos;
    }

    /**
     * @return the salario
     */
    public int getSalario() {
        return salario;
    }

    /**
     * @param salario the salario to set
     */
    public void setSalario(int salario) {
        this.salario = salario;
    }

    /**
     * @return the nacimiento
     */
    public Date getNacimiento() {
        return nacimiento;
    }

    /**
     * @param nacimiento the nacimiento to set
     */
    public void setNacimiento(Date nacimiento) {
        this.nacimiento = nacimiento;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the años_experiencia
     */
    public int getAños_experiencia() {
        return años_experiencia;
    }

    /**
     * @param años_experiencia the años_experiencia to set
     */
    public void setAños_experiencia(int años_experiencia) {
        this.años_experiencia = años_experiencia;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the status_empleado
     */
    public String getStatus_empleado() {
        return status_empleado;
    }

    /**
     * @param status_empleado the status_empleado to set
     */
    public void setStatus_empleado(String status_empleado) {
        this.status_empleado = status_empleado;
    }

    /**
     * @return the rut
     */
    public String getRut() {
        return rut;
    }

    /**
     * @param rut the rut to set
     */
    public void setRut(String rut) {
        this.rut = rut;
    }


}
