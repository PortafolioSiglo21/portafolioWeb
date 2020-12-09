package domain;

/**
 *
 * @author Dr4g0n
 */
public class Empleos {

    private int id_tipo_empleo;
    private String tipo_empleo;

    public Empleos() {
    }

    public Empleos(int id_tipo_empleo, String tipo_empleo) {
        this.id_tipo_empleo = id_tipo_empleo;
        this.tipo_empleo = tipo_empleo;
    }
    

    /**
     * @return the id_tipo_empleo
     */
    public int getId_tipo_empleo() {
        return id_tipo_empleo;
    }

    /**
     * @param id_tipo_empleo the id_tipo_empleo to set
     */
    public void setId_tipo_empleo(int id_tipo_empleo) {
        this.id_tipo_empleo = id_tipo_empleo;
    }

    /**
     * @return the tipo_empleo
     */
    public String getTipo_empleo() {
        return tipo_empleo;
    }

    /**
     * @param tipo_empleo the tipo_empleo to set
     */
    public void setTipo_empleo(String tipo_empleo) {
        this.tipo_empleo = tipo_empleo;
    }



    
}
