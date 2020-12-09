package domain;

/**
 *
 * @author Dr4g0n
 */
public class Ordenes {

    private int id_orden;
    private Mesas mesas;
    private Reservaciones reservaciones;
    private Productos productos;
    private Carta carta;
    private String status;

    public Ordenes() {
    }

    public Ordenes(int id_orden, Mesas mesas, Reservaciones reservaciones, Productos productos, Carta carta, String status) {
        this.id_orden = id_orden;
        this.mesas = mesas;
        this.reservaciones = reservaciones;
        this.productos = productos;
        this.carta = carta;
        this.status = status;
    }
    
    
    /**
     * @return the id_orden
     */
    public int getId_orden() {
        return id_orden;
    }

    /**
     * @param id_orden the id_orden to set
     */
    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    /**
     * @return the mesas
     */
    public Mesas getMesas() {
        return mesas;
    }

    /**
     * @param mesas the mesas to set
     */
    public void setMesas(Mesas mesas) {
        this.mesas = mesas;
    }

    /**
     * @return the reservaciones
     */
    public Reservaciones getReservaciones() {
        return reservaciones;
    }

    /**
     * @param reservaciones the reservaciones to set
     */
    public void setReservaciones(Reservaciones reservaciones) {
        this.reservaciones = reservaciones;
    }

    /**
     * @return the productos
     */
    public Productos getProductos() {
        return productos;
    }

    /**
     * @param productos the productos to set
     */
    public void setProductos(Productos productos) {
        this.productos = productos;
    }

    /**
     * @return the carta
     */
    public Carta getCarta() {
        return carta;
    }

    /**
     * @param carta the carta to set
     */
    public void setCarta(Carta carta) {
        this.carta = carta;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    

    
}
