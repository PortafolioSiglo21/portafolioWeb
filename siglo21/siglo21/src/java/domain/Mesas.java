package domain;

/**
 *
 * @author Dr4g0n
 */
public class Mesas {

    private int id_mesa;
    private int capacidad;
    private String status_mesa;

    public Mesas() {
    }

    public Mesas(int id_mesa, int capacidad, String status_mesa) {
        this.id_mesa = id_mesa;
        this.capacidad = capacidad;
        this.status_mesa = status_mesa;
    }
    
    
    
    /**
     * @return the id_mesa
     */
    public int getId_mesa() {
        return id_mesa;
    }

    /**
     * @param id_mesa the id_mesa to set
     */
    public void setId_mesa(int id_mesa) {
        this.id_mesa = id_mesa;
    }

    /**
     * @return the capacidad
     */
    public int getCapacidad() {
        return capacidad;
    }

    /**
     * @param capacidad the capacidad to set
     */
    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    /**
     * @return the status_mesa
     */
    public String getStatus_mesa() {
        return status_mesa;
    }

    /**
     * @param status_mesa the status_mesa to set
     */
    public void setStatus_mesa(String status_mesa) {
        this.status_mesa = status_mesa;
    }
    
   
    
}
