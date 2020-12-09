package domain;

import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class Factura {

    private int id_factura;
    private Date fecha_fac;
    private double iva;
    private double total_pagar;
    private double efectivo;
    private double cambio;
    private Proveedores proveedores;
    private FormasPago formasPago;
    private Empleados empleados;

    public Factura() {
    }

    public Factura(int id_factura, Date fecha_fac, double iva, double total_pagar, double efectivo, double cambio, Proveedores proveedores, FormasPago formasPago, Empleados empleados) {
        this.id_factura = id_factura;
        this.fecha_fac = fecha_fac;
        this.iva = iva;
        this.total_pagar = total_pagar;
        this.efectivo = efectivo;
        this.cambio = cambio;
        this.proveedores = proveedores;
        this.formasPago = formasPago;
        this.empleados = empleados;
    }
    
    
    
    /**
     * @return the id_factura
     */
    public int getId_factura() {
        return id_factura;
    }

    /**
     * @param id_factura the id_factura to set
     */
    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    /**
     * @return the fecha_fac
     */
    public Date getFecha_fac() {
        return fecha_fac;
    }

    /**
     * @param fecha_fac the fecha_fac to set
     */
    public void setFecha_fac(Date fecha_fac) {
        this.fecha_fac = fecha_fac;
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
     * @return the proveedores
     */
    public Proveedores getProveedores() {
        return proveedores;
    }

    /**
     * @param proveedores the proveedores to set
     */
    public void setProveedores(Proveedores proveedores) {
        this.proveedores = proveedores;
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

   
    
    
    
    
}
