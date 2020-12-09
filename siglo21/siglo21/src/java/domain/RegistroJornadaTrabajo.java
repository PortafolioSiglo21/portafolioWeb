package domain;

import java.util.*;
/**
 *
 * @author Dr4g0n
 */
public class RegistroJornadaTrabajo {

    
    private Date hora_entrada_marcada;
    private Date hora_salida_marcada;
    private Empleados empleados;
    private double horas_trabajadas;

    public RegistroJornadaTrabajo() {
    }

    public RegistroJornadaTrabajo(Date hora_entrada_marcada, Date hora_salida_marcada, Empleados empleados, double horas_trabajadas) {
        this.hora_entrada_marcada = hora_entrada_marcada;
        this.hora_salida_marcada = hora_salida_marcada;
        this.empleados = empleados;
        this.horas_trabajadas = horas_trabajadas;
    }
    
    
    /**
     * @return the hora_entrada_marcada
     */
    public Date getHora_entrada_marcada() {
        return hora_entrada_marcada;
    }

    /**
     * @param hora_entrada_marcada the hora_entrada_marcada to set
     */
    public void setHora_entrada_marcada(Date hora_entrada_marcada) {
        this.hora_entrada_marcada = hora_entrada_marcada;
    }

    /**
     * @return the hora_salida_marcada
     */
    public Date getHora_salida_marcada() {
        return hora_salida_marcada;
    }

    /**
     * @param hora_salida_marcada the hora_salida_marcada to set
     */
    public void setHora_salida_marcada(Date hora_salida_marcada) {
        this.hora_salida_marcada = hora_salida_marcada;
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
     * @return the horas_trabajadas
     */
    public double getHoras_trabajadas() {
        return horas_trabajadas;
    }

    /**
     * @param horas_trabajadas the horas_trabajadas to set
     */
    public void setHoras_trabajadas(double horas_trabajadas) {
        this.horas_trabajadas = horas_trabajadas;
    }
    
    
}
