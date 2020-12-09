/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Dr4g0n
 */
public class Carta {
    
      
    private int id_carta;
    private TipoCarta tipoCarta;
    private String descripcion_Carta;
    private double precio;
    private String nombre;
    
     public Carta() {
    }

    public Carta(int id_carta, TipoCarta tipoCarta, String descripcion_Carta, double precio, String nombre) {
        this.id_carta = id_carta;
        this.tipoCarta = tipoCarta;
        this.descripcion_Carta = descripcion_Carta;
        this.precio = precio;
        this.nombre = nombre;
    }
    
    
    /**
     * @return the id_carta
     */
    public int getId_carta() {
        return id_carta;
    }

    /**
     * @param id_carta the id_carta to set
     */
    public void setId_carta(int id_carta) {
        this.id_carta = id_carta;
    }

    /**
     * @return the tipoCarta
     */
    public TipoCarta getTipoCarta() {
        return tipoCarta;
    }

    /**
     * @param tipoCarta the tipoCarta to set
     */
    public void setTipoCarta(TipoCarta tipoCarta) {
        this.tipoCarta = tipoCarta;
    }

    /**
     * @return the descripcion_Carta
     */
    public String getDescripcion_Carta() {
        return descripcion_Carta;
    }

    /**
     * @param descripcion_Carta the descripcion_Carta to set
     */
    public void setDescripcion_Carta(String descripcion_Carta) {
        this.descripcion_Carta = descripcion_Carta;
    }

    /**
     * @return the precio
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

 
    
            
}
