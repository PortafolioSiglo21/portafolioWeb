package domain;

/**
 *
 * @author Dr4g0n
 */
public class Productos {

 
    private int id_producto;
    private String nombre;
    private double precio;
    private String descripcion;
    private Categorias categorias;
    private double cantidad;
    private int stock_minimo;

       public Productos() {
    }

    public Productos(int id_producto, int id_tipo, String nombre, double precio, String descripcion, Categorias categorias, double cantidad, int stock_minimo) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.categorias = categorias;
        this.cantidad = cantidad;
        this.stock_minimo = stock_minimo;
    }
    
    /**
     * @return the id_producto
     */
    public int getId_producto() {
        return id_producto;
    }

    /**
     * @param id_producto the id_producto to set
     */
    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the precio
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the categorias
     */
    public Categorias getCategorias() {
        return categorias;
    }

    /**
     * @param categorias the categorias to set
     */
    public void setCategorias(Categorias categorias) {
        this.categorias = categorias;
    }

    /**
     * @return the cantidad
     */
    public double getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the stock_minimo
     */
    public int getStock_minimo() {
        return stock_minimo;
    }

    /**
     * @param stock_minimo the stock_minimo to set
     */
    public void setStock_minimo(int stock_minimo) {
        this.stock_minimo = stock_minimo;
    }

    
}
