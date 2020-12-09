package domain;

/**
 *
 * @author Dr4g0n
 */
public class Cargos {

    private int id_cargo;
    private String cargo;

    public Cargos() {
    }

    public Cargos(int id_cargo, String cargo) {
        this.id_cargo = id_cargo;
        this.cargo = cargo;
    }
    
    /**
     * @return the id_cargo
     */
    public int getId_cargo() {
        return id_cargo;
    }

    /**
     * @param id_cargo the id_cargo to set
     */
    public void setId_cargo(int id_cargo) {
        this.id_cargo = id_cargo;
    }

    /**
     * @return the cargo
     */
    public String getCargo() {
        return cargo;
    }

    /**
     * @param cargo the cargo to set
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    
    
    
}
