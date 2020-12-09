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
public class Bancos {
   
    //  Declaracion de variables
    private int id_banco;
    private String nombre_banco;

    //  Constructor vacio
    public Bancos(){
    }
    
    //  Constructor con variables
    public Bancos(int id_banco, String nombre_banco) {
        this.id_banco = id_banco;
        this.nombre_banco = nombre_banco;
    }
    
    //  Getter and Setter
    
    /**
     * @return the id_banco
     */
    public int getId_banco() {
        return id_banco;
    }

    /**
     * @param id_banco the id_banco to set
     */
    public void setId_banco(int id_banco) {
        this.id_banco = id_banco;
    }

    /**
     * @return the nombre_banco
     */
    public String getNombre_banco() {
        return nombre_banco;
    }

    /**
     * @param nombre_banco the nombre_banco to set
     */
    public void setNombre_banco(String nombre_banco) {
        this.nombre_banco = nombre_banco;
    }
    
    
}
