package domain;

/**
 *
 * @author Dr4g0n
 */
public class Proveedores {


    private int id_proveedor;
    private String rut_proveeedor;
    private String proveedor;
    private String nombre_contacto;
    private String telefono;
    private String sitio_web;
    private String email_proveedor;
    private String estado;
    private Administrador administrador;
    
    public Proveedores() {
    }
    
    public Proveedores(int id_proveedor, String rut_proveeedor, String proveedor, String nombre_contacto, String telefono, String sitio_web, String email_proveedor, String estado, Administrador administrador) {
        this.id_proveedor = id_proveedor;
        this.rut_proveeedor = rut_proveeedor;
        this.proveedor = proveedor;
        this.nombre_contacto = nombre_contacto;
        this.telefono = telefono;
        this.sitio_web = sitio_web;
        this.email_proveedor = email_proveedor;
        this.estado = estado;
        this.administrador = administrador;
    }


    /**
     * @return the id_proveedor
     */
    public int getId_proveedor() {
        return id_proveedor;
    }

    /**
     * @param id_proveedor the id_proveedor to set
     */
    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    /**
     * @return the rut_proveeedor
     */
    public String getRut_proveeedor() {
        return rut_proveeedor;
    }

    /**
     * @param rut_proveeedor the rut_proveeedor to set
     */
    public void setRut_proveeedor(String rut_proveeedor) {
        this.rut_proveeedor = rut_proveeedor;
    }

    /**
     * @return the proveedor
     */
    public String getProveedor() {
        return proveedor;
    }

    /**
     * @param proveedor the proveedor to set
     */
    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    /**
     * @return the nombre_contacto
     */
    public String getNombre_contacto() {
        return nombre_contacto;
    }

    /**
     * @param nombre_contacto the nombre_contacto to set
     */
    public void setNombre_contacto(String nombre_contacto) {
        this.nombre_contacto = nombre_contacto;
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
     * @return the sitio_web
     */
    public String getSitio_web() {
        return sitio_web;
    }

    /**
     * @param sitio_web the sitio_web to set
     */
    public void setSitio_web(String sitio_web) {
        this.sitio_web = sitio_web;
    }

    /**
     * @return the email_proveedor
     */
    public String getEmail_proveedor() {
        return email_proveedor;
    }

    /**
     * @param email_proveedor the email_proveedor to set
     */
    public void setEmail_proveedor(String email_proveedor) {
        this.email_proveedor = email_proveedor;
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

    /**
     * @return the administrador
     */
    public Administrador getAdministrador() {
        return administrador;
    }

    /**
     * @param administrador the administrador to set
     */
    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }

    
}
