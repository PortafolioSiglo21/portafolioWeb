/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.util.Date;

/**
 *
 * @author Dr4g0n
 */
public class PedidoProveedor {

    
    private int id_pedido;
    private Date fecha_solicitud;
    private int iva;
    private int tota_pagar;
    private Proveedores proveedores;
    private Empleados empleados;
    private String producto;
    private String categoria;
    private String descripcion;
    private int cantidad;
    private Date fecha_recepcion;
    private Date fecha_pago;
    private Date fecha_pedido;
    private String estado_pedido;
    private int precio;

    public PedidoProveedor() {
    }
    
     public PedidoProveedor(int id_pedido, Date fecha_solicitud, int iva, int tota_pagar, Proveedores proveedores, Empleados empleados, String producto, String categoria, String descripcion, int cantidad, Date fecha_recepcion, Date fecha_pago, Date fecha_pedido, String estado_pedido, int precio) {
        this.id_pedido = id_pedido;
        this.fecha_solicitud = fecha_solicitud;
        this.iva = iva;
        this.tota_pagar = tota_pagar;
        this.proveedores = proveedores;
        this.empleados = empleados;
        this.producto = producto;
        this.categoria = categoria;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.fecha_recepcion = fecha_recepcion;
        this.fecha_pago = fecha_pago;
        this.fecha_pedido = fecha_pedido;
        this.estado_pedido = estado_pedido;
        this.precio = precio;
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
     * @return the fecha_solicitud
     */
    public Date getFecha_solicitud() {
        return fecha_solicitud;
    }

    /**
     * @param fecha_solicitud the fecha_solicitud to set
     */
    public void setFecha_solicitud(Date fecha_solicitud) {
        this.fecha_solicitud = fecha_solicitud;
    }

    /**
     * @return the iva
     */
    public int getIva() {
        return iva;
    }

    /**
     * @param iva the iva to set
     */
    public void setIva(int iva) {
        this.iva = iva;
    }

    /**
     * @return the tota_pagar
     */
    public int getTota_pagar() {
        return tota_pagar;
    }

    /**
     * @param tota_pagar the tota_pagar to set
     */
    public void setTota_pagar(int tota_pagar) {
        this.tota_pagar = tota_pagar;
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
     * @return the producto
     */
    public String getProducto() {
        return producto;
    }

    /**
     * @param producto the producto to set
     */
    public void setProducto(String producto) {
        this.producto = producto;
    }

    /**
     * @return the categoria
     */
    public String getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the fecha_recepcion
     */
    public Date getFecha_recepcion() {
        return fecha_recepcion;
    }

    /**
     * @param fecha_recepcion the fecha_recepcion to set
     */
    public void setFecha_recepcion(Date fecha_recepcion) {
        this.fecha_recepcion = fecha_recepcion;
    }

    /**
     * @return the fecha_pago
     */
    public Date getFecha_pago() {
        return fecha_pago;
    }

    /**
     * @param fecha_pago the fecha_pago to set
     */
    public void setFecha_pago(Date fecha_pago) {
        this.fecha_pago = fecha_pago;
    }

    /**
     * @return the fecha_pedido
     */
    public Date getFecha_pedido() {
        return fecha_pedido;
    }

    /**
     * @param fecha_pedido the fecha_pedido to set
     */
    public void setFecha_pedido(Date fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    /**
     * @return the estado_pedido
     */
    public String getEstado_pedido() {
        return estado_pedido;
    }

    /**
     * @param estado_pedido the estado_pedido to set
     */
    public void setEstado_pedido(String estado_pedido) {
        this.estado_pedido = estado_pedido;
    }

    /**
     * @return the precio
     */
    public int getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(int precio) {
        this.precio = precio;
    }
   
}
