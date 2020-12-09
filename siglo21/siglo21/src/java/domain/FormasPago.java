package domain;

/**
 *
 * @author Dr4g0n
 */
public class FormasPago {

    private int id_forma_pago;
    private String forma_pago;

    public FormasPago() {
    }

    public FormasPago(int id_forma_pago, String forma_pago) {
        this.id_forma_pago = id_forma_pago;
        this.forma_pago = forma_pago;
    }
   
    
    /**
     * @return the id_forma_pago
     */
    public int getId_forma_pago() {
        return id_forma_pago;
    }

    /**
     * @param id_forma_pago the id_forma_pago to set
     */
    public void setId_forma_pago(int id_forma_pago) {
        this.id_forma_pago = id_forma_pago;
    }

    /**
     * @return the forma_pago
     */
    public String getForma_pago() {
        return forma_pago;
    }

    /**
     * @param forma_pago the forma_pago to set
     */
    public void setForma_pago(String forma_pago) {
        this.forma_pago = forma_pago;
    }


    
}
