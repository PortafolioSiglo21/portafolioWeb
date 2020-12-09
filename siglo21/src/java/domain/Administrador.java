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
public class Administrador {

    
    
    //declaracion de variables
    private String  id_admin;
    private String usuario_adm;
    private String pass_adm;
    
    
    //  Constructor vacio
    public Administrador() {
    }

    public Administrador(String id_admin, String usuario_adm, String pass_adm) {
        this.id_admin = id_admin;
        this.usuario_adm = usuario_adm;
        this.pass_adm = pass_adm;
    }
    
    
    
    /**
     * @return the id_admin
     */
    public String getId_admin() {
        return id_admin;
    }

    /**
     * @param id_admin the id_admin to set
     */
    public void setId_admin(String id_admin) {
        this.id_admin = id_admin;
    }

    /**
     * @return the usuario_adm
     */
    public String getUsuario_adm() {
        return usuario_adm;
    }

    /**
     * @param usuario_adm the usuario_adm to set
     */
    public void setUsuario_adm(String usuario_adm) {
        this.usuario_adm = usuario_adm;
    }

    /**
     * @return the pass_adm
     */
    public String getPass_adm() {
        return pass_adm;
    }

    /**
     * @param pass_adm the pass_adm to set
     */
    public void setPass_adm(String pass_adm) {
        this.pass_adm = pass_adm;
    }

    

   
    
    
}
