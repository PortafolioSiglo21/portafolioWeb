package domain;

/**
 *
 * @author Dr4g0n
 */
public class Tarjeta {

    private int id_pago;
    private String moneda;
    private int numero_transaccion;
    private Factura factura;
    private Boleta boleta;
    private Bancos bancos;

    public Tarjeta() {
    }

    public Tarjeta(int id_pago, String moneda, int numero_transaccion, Factura factura, Boleta boleta, Bancos bancos) {
        this.id_pago = id_pago;
        this.moneda = moneda;
        this.numero_transaccion = numero_transaccion;
        this.factura = factura;
        this.boleta = boleta;
        this.bancos = bancos;
    }
    
    
    /**
     * @return the id_pago
     */
    public int getId_pago() {
        return id_pago;
    }

    /**
     * @param id_pago the id_pago to set
     */
    public void setId_pago(int id_pago) {
        this.id_pago = id_pago;
    }

    /**
     * @return the moneda
     */
    public String getMoneda() {
        return moneda;
    }

    /**
     * @param moneda the moneda to set
     */
    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    /**
     * @return the numero_transaccion
     */
    public int getNumero_transaccion() {
        return numero_transaccion;
    }

    /**
     * @param numero_transaccion the numero_transaccion to set
     */
    public void setNumero_transaccion(int numero_transaccion) {
        this.numero_transaccion = numero_transaccion;
    }

    /**
     * @return the factura
     */
    public Factura getFactura() {
        return factura;
    }

    /**
     * @param factura the factura to set
     */
    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    /**
     * @return the boleta
     */
    public Boleta getBoleta() {
        return boleta;
    }

    /**
     * @param boleta the boleta to set
     */
    public void setBoleta(Boleta boleta) {
        this.boleta = boleta;
    }

    /**
     * @return the bancos
     */
    public Bancos getBancos() {
        return bancos;
    }

    /**
     * @param bancos the bancos to set
     */
    public void setBancos(Bancos bancos) {
        this.bancos = bancos;
    }

    
    
}
