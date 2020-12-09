package domain;

import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class Reservaciones {

    
    private int id_reserva;
    private Clientes clientes;
    private Date fecha_hora;
    private String estado_reserva;
    private int cantidad_personas;

    public Reservaciones() {
    }
    
    public Reservaciones(int id_reserva, Clientes clientes, Date fecha_hora, String estado_reserva, int cantidad_personas) {
        this.id_reserva = id_reserva;
        this.clientes = clientes;
        this.fecha_hora = fecha_hora;
        this.estado_reserva = estado_reserva;
        this.cantidad_personas = cantidad_personas;
    }

    /**
     * @return the id_reserva
     */
    public int getId_reserva() {
        return id_reserva;
    }

    /**
     * @param id_reserva the id_reserva to set
     */
    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
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
     * @return the fecha_hora
     */
    public Date getFecha_hora() {
        return fecha_hora;
    }

    /**
     * @param fecha_hora the fecha_hora to set
     */
    public void setFecha_hora(Date fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    /**
     * @return the estado_reserva
     */
    public String getEstado_reserva() {
        return estado_reserva;
    }

    /**
     * @param estado_reserva the estado_reserva to set
     */
    public void setEstado_reserva(String estado_reserva) {
        this.estado_reserva = estado_reserva;
    }

    /**
     * @return the cantidad_personas
     */
    public int getCantidad_personas() {
        return cantidad_personas;
    }

    /**
     * @param cantidad_personas the cantidad_personas to set
     */
    public void setCantidad_personas(int cantidad_personas) {
        this.cantidad_personas = cantidad_personas;
    }
    
    
}
