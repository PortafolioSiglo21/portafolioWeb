package domain;

import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class Boleta {

   
    private int id_boleta;
    private Date fecha_bol;
    private double iva;
    private double total_pagar;
    private double efectivo;
    private double cambio;
    private Clientes clientes;
    private Empleados empleados;
    private FormasPago formasPago;

    public Boleta() {
    }

    public Boleta(int id_boleta, Date fecha_bol, double iva, double total_pagar, double efectivo, double cambio, Clientes clientes, Empleados empleados, FormasPago formasPago) {
        this.id_boleta = id_boleta;
        this.fecha_bol = fecha_bol;
        this.iva = iva;
        this.total_pagar = total_pagar;
        this.efectivo = efectivo;
        this.cambio = cambio;
        this.clientes = clientes;
        this.empleados = empleados;
        this.formasPago = formasPago;
    }
    
    
    
    /**
     * @return the id_boleta
     */
    public int getId_boleta() {
        return id_boleta;
    }

    /**
     * @param id_boleta the id_boleta to set
     */
    public void setId_boleta(int id_boleta) {
        this.id_boleta = id_boleta;
    }

    /**
     * @return the fecha_bol
     */
    public Date getFecha_bol() {
        return fecha_bol;
    }

    /**
     * @param fecha_bol the fecha_bol to set
     */
    public void setFecha_bol(Date fecha_bol) {
        this.fecha_bol = fecha_bol;
    }

    /**
     * @return the iva
     */
    public double getIva() {
        return iva;
    }

    /**
     * @param iva the iva to set
     */
    public void setIva(double iva) {
        this.iva = iva;
    }

    /**
     * @return the total_pagar
     */
    public double getTotal_pagar() {
        return total_pagar;
    }

    /**
     * @param total_pagar the total_pagar to set
     */
    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }

    /**
     * @return the efectivo
     */
    public double getEfectivo() {
        return efectivo;
    }

    /**
     * @param efectivo the efectivo to set
     */
    public void setEfectivo(double efectivo) {
        this.efectivo = efectivo;
    }

    /**
     * @return the cambio
     */
    public double getCambio() {
        return cambio;
    }

    /**
     * @param cambio the cambio to set
     */
    public void setCambio(double cambio) {
        this.cambio = cambio;
    }

    /**
     * @return the clientes
     */
    public Clientes getClientes() {
        return clientes;
    }

    /**
     * @param clientes the clientes to set
     */
    public void setClientes(Clientes clientes) {
        this.clientes = clientes;
    }

    /**
     * @return the empleados
     */
    public Empleados getEmpleados() {
        return empleados;
    }

    /**
     * @param empleados the empleados to set
     */
    public void setEmpleados(Empleados empleados) {
        this.empleados = empleados;
    }

    /**
     * @return the formasPago
     */
    public FormasPago getFormasPago() {
        return formasPago;
    }

    /**
     * @param formasPago the formasPago to set
     */
    public void setFormasPago(FormasPago formasPago) {
        this.formasPago = formasPago;
    }


    
}
