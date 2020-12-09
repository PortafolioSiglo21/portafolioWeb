package domain;

import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class Ingredientes {

    
    int id_ingredientes;
    String ingrediente;
    String presentacion;
    String marca;
    Date vencimiento;
    Proveedores proveedores;
    int stock_ingrediente;
    String medida;

    public Ingredientes() {
    }

    public Ingredientes(int id_ingredientes, String ingrediente, String presentacion, String marca, Date vencimiento, Proveedores proveedores, int stock_ingrediente, String medida) {
        this.id_ingredientes = id_ingredientes;
        this.ingrediente = ingrediente;
        this.presentacion = presentacion;
        this.marca = marca;
        this.vencimiento = vencimiento;
        this.proveedores = proveedores;
        this.stock_ingrediente = stock_ingrediente;
        this.medida = medida;
    }
    
    
    
    /**
     * @return the id_ingredientes
     */
    public int getId_ingredientes() {
        return id_ingredientes;
    }

    /**
     * @param id_ingredientes the id_ingredientes to set
     */
    public void setId_ingredientes(int id_ingredientes) {
        this.id_ingredientes = id_ingredientes;
    }

    /**
     * @return the ingrediente
     */
    public String getIngrediente() {
        return ingrediente;
    }

    /**
     * @param ingrediente the ingrediente to set
     */
    public void setIngrediente(String ingrediente) {
        this.ingrediente = ingrediente;
    }

    /**
     * @return the presentacion
     */
    public String getPresentacion() {
        return presentacion;
    }

    /**
     * @param presentacion the presentacion to set
     */
    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    /**
     * @return the marca
     */
    public String getMarca() {
        return marca;
    }

    /**
     * @param marca the marca to set
     */
    public void setMarca(String marca) {
        this.marca = marca;
    }

    /**
     * @return the vencimiento
     */
    public Date getVencimiento() {
        return vencimiento;
    }

    /**
     * @param vencimiento the vencimiento to set
     */
    public void setVencimiento(Date vencimiento) {
        this.vencimiento = vencimiento;
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
     * @return the stock_ingrediente
     */
    public int getStock_ingrediente() {
        return stock_ingrediente;
    }

    /**
     * @param stock_ingrediente the stock_ingrediente to set
     */
    public void setStock_ingrediente(int stock_ingrediente) {
        this.stock_ingrediente = stock_ingrediente;
    }

    /**
     * @return the medida
     */
    public String getMedida() {
        return medida;
    }

    /**
     * @param medida the medida to set
     */
    public void setMedida(String medida) {
        this.medida = medida;
    }

    
}
