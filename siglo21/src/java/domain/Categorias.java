package domain;

/**
 *
 * @author Dr4g0n
 */
public class Categorias {
    
    private int id_categoria;
    private String categoria;
    private String medida_categoria;

    public Categorias() {
    }

    public Categorias(int id_categoria, String categoria, String medida_categoria) {
        this.id_categoria = id_categoria;
        this.categoria = categoria;
        this.medida_categoria = medida_categoria;
    }
    
    
    /**
     * @return the id_categoria
     */
    public int getId_categoria() {
        return id_categoria;
    }

    /**
     * @param id_categoria the id_categoria to set
     */
    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
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
     * @return the medida_categoria
     */
    public String getMedida_categoria() {
        return medida_categoria;
    }

    /**
     * @param medida_categoria the medida_categoria to set
     */
    public void setMedida_categoria(String medida_categoria) {
        this.medida_categoria = medida_categoria;
    }
    
   
}
