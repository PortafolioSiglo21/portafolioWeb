package domain;

import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class Pedidos {

    
    private int id_pedido;
    private Date fecha;
    private char status_pedido;
    private Date fecha_hora_pedido;
    private Date fecha_hora_entrega;
    private int total_pedido;
    private Clientes clientes;
    private Mesas mesas;
    private Cargos cargos;

    public Pedidos() {
    }

    public Pedidos(int id_pedido, Date fecha, char status_pedido, Date fecha_hora_pedido, Date fecha_hora_entrega, int total_pedido, Clientes clientes, Mesas mesas, Cargos cargos) {
        this.id_pedido = id_pedido;
        this.fecha = fecha;
        this.status_pedido = status_pedido;
        this.fecha_hora_pedido = fecha_hora_pedido;
        this.fecha_hora_entrega = fecha_hora_entrega;
        this.total_pedido = total_pedido;
        this.clientes = clientes;
        this.mesas = mesas;
        this.cargos = cargos;
    }
    
    
    /**
     * @return the id_pedido
     */
    public int getId_pedido() {
        return id_pedido;
    }

    /**
     * @param id_pedido the id_pedido to set
     */
    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the status_pedido
     */
    public char getStatus_pedido() {
        return status_pedido;
    }

    /**
     * @param status_pedido the status_pedido to set
     */
    public void setStatus_pedido(char status_pedido) {
        this.status_pedido = status_pedido;
    }

    /**
     * @return the fecha_hora_pedido
     */
    public Date getFecha_hora_pedido() {
        return fecha_hora_pedido;
    }

    /**
     * @param fecha_hora_pedido the fecha_hora_pedido to set
     */
    public void setFecha_hora_pedido(Date fecha_hora_pedido) {
        this.fecha_hora_pedido = fecha_hora_pedido;
    }

    /**
     * @return the fecha_hora_entrega
     */
    public Date getFecha_hora_entrega() {
        return fecha_hora_entrega;
    }

    /**
     * @param fecha_hora_entrega the fecha_hora_entrega to set
     */
    public void setFecha_hora_entrega(Date fecha_hora_entrega) {
        this.fecha_hora_entrega = fecha_hora_entrega;
    }

    /**
     * @return the total_pedido
     */
    public int getTotal_pedido() {
        return total_pedido;
    }

    /**
     * @param total_pedido the total_pedido to set
     */
    public void setTotal_pedido(int total_pedido) {
        this.total_pedido = total_pedido;
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
     * @return the mesas
     */
    public Mesas getMesas() {
        return mesas;
    }

    /**
     * @param mesas the mesas to set
     */
    public void setMesas(Mesas mesas) {
        this.mesas = mesas;
    }

    /**
     * @return the cargos
     */
    public Cargos getCargos() {
        return cargos;
    }

    /**
     * @param cargos the cargos to set
     */
    public void setCargos(Cargos cargos) {
        this.cargos = cargos;
    }
    
    
}
