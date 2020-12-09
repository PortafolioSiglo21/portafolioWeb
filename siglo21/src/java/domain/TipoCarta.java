package domain;

/**
 *
 * @author Dr4g0n
 */
public class TipoCarta {

    
    private int id_tipo_carta;
    private String descripcion;

    public TipoCarta() {
    
    }

    public TipoCarta(int id_tipo_carta, String descripcion) {
        this.id_tipo_carta = id_tipo_carta;
        this.descripcion = descripcion;
    }
    
    
    
    /**
     * @return the id_tipo_carta
     */
    public int getId_tipo_carta() {
        return id_tipo_carta;
    }

    /**
     * @param id_tipo_carta the id_tipo_carta to set
     */
    public void setId_tipo_carta(int id_tipo_carta) {
        this.id_tipo_carta = id_tipo_carta;
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
    
    
    
    
    
    
}
