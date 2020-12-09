package domain;

/**
 *
 * @author Dr4g0n
 */
public class Clientes {

    private int id_cliente;
    private String rut_cliente;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String email;
    private String estado;

    public Clientes() {
    }

    public Clientes(int id_cliente, String rut_cliente, String nombres, String apellidos, String telefono, String email, String estado) {
        this.id_cliente = id_cliente;
        this.rut_cliente = rut_cliente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.email = email;
        this.estado = estado;
    }

    
    
    /**
     * @return the id_cliente
     */
    public int getId_cliente() {
        return id_cliente;
    }

    /**
     * @param id_cliente the id_cliente to set
     */
    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    /**
     * @return the rut_cliente
     */
    public String getRut_cliente() {
        return rut_cliente;
    }

    /**
     * @param rut_cliente the rut_cliente to set
     */
    public void setRut_cliente(String rut_cliente) {
        this.rut_cliente = rut_cliente;
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
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    
    
}
