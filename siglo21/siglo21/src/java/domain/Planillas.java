package domain;

import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class Planillas {

    private int id_planilla;
    private Date fecha_emision;
    private double total_deduciones;
    private double total_gratificaciones;
    private double monto_nomina;
    private int total_empleados;
    private Administrador administrador;

    public Planillas() {
    }

    public Planillas(int id_planilla, Date fecha_emision, double total_deduciones, double total_gratificaciones, double monto_nomina, int total_empleados, Administrador administrador) {
        this.id_planilla = id_planilla;
        this.fecha_emision = fecha_emision;
        this.total_deduciones = total_deduciones;
        this.total_gratificaciones = total_gratificaciones;
        this.monto_nomina = monto_nomina;
        this.total_empleados = total_empleados;
        this.administrador = administrador;
    }
    
    
    /**
     * @return the id_planilla
     */
    public int getId_planilla() {
        return id_planilla;
    }

    /**
     * @param id_planilla the id_planilla to set
     */
    public void setId_planilla(int id_planilla) {
        this.id_planilla = id_planilla;
    }

    /**
     * @return the fecha_emision
     */
    public Date getFecha_emision() {
        return fecha_emision;
    }

    /**
     * @param fecha_emision the fecha_emision to set
     */
    public void setFecha_emision(Date fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    /**
     * @return the total_deduciones
     */
    public double getTotal_deduciones() {
        return total_deduciones;
    }

    /**
     * @param total_deduciones the total_deduciones to set
     */
    public void setTotal_deduciones(double total_deduciones) {
        this.total_deduciones = total_deduciones;
    }

    /**
     * @return the total_gratificaciones
     */
    public double getTotal_gratificaciones() {
        return total_gratificaciones;
    }

    /**
     * @param total_gratificaciones the total_gratificaciones to set
     */
    public void setTotal_gratificaciones(double total_gratificaciones) {
        this.total_gratificaciones = total_gratificaciones;
    }

    /**
     * @return the monto_nomina
     */
    public double getMonto_nomina() {
        return monto_nomina;
    }

    /**
     * @param monto_nomina the monto_nomina to set
     */
    public void setMonto_nomina(double monto_nomina) {
        this.monto_nomina = monto_nomina;
    }

    /**
     * @return the total_empleados
     */
    public int getTotal_empleados() {
        return total_empleados;
    }

    /**
     * @param total_empleados the total_empleados to set
     */
    public void setTotal_empleados(int total_empleados) {
        this.total_empleados = total_empleados;
    }

    /**
     * @return the administrador
     */
    public Administrador getAdministrador() {
        return administrador;
    }

    /**
     * @param administrador the administrador to set
     */
    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }

    
    
    
}
