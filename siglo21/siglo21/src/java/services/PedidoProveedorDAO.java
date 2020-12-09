package services;

import basedatos.Conexion;
import domain.Proveedores;
import domain.PedidoProveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class PedidoProveedorDAO {
    
    
    public static LinkedList<PedidoProveedor> pedidosSolicitados()
    {
        // instanciar
        LinkedList<PedidoProveedor> datos = new LinkedList<PedidoProveedor>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
       

        try {
            con = Conexion.getConnection();
            sentencia = " select pp.FECH_SOLICITUD,   COUNT(pp.PRODUCTO) as productos, pr.PROVEEDOR, ID_PEDIDO " +
                        " from PEDIDOPROVEDOR pp " +
                        "  inner join PROVEEDORES pr on pr.ID_PROVEEDOR = pp.ID_PROVEEDOR " +
                        " where ESTADO_PEDIDO = 'SOLICITADO' " +
                        " group by ID_PEDIDO,  pr.PROVEEDOR, pp.FECH_SOLICITUD " +
                        " order by pp.FECH_SOLICITUD";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while (rs.next())
            {
                PedidoProveedor p = new PedidoProveedor();
                Proveedores pr = new Proveedores();
                
                p.setFecha_solicitud(rs.getDate("FECH_SOLICITUD"));
                p.setCantidad(rs.getInt("productos"));
                pr.setProveedor(rs.getString("PROVEEDOR"));
                p.setProveedores(pr);
                p.setId_pedido(rs.getInt("ID_PEDIDO"));
                
                datos.add(p);
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return datos;
    }
    
    public static LinkedList<PedidoProveedor> listarPedidoPorID(int id)
    {
        LinkedList<PedidoProveedor> datos = new LinkedList<>();
        ResultSet rs = null;
        PreparedStatement pst = null; 
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " select * " +
                        " from PEDIDOPROVEDOR pp " +
                        " inner join PROVEEDORES pr on pr.ID_PROVEEDOR = pp.ID_PROVEEDOR " +
                        " where pp.ID_PEDIDO = ?";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                PedidoProveedor p = new PedidoProveedor();
                Proveedores pr    = new Proveedores();
                
                // settear clases desde DB
                p.setId_pedido(rs.getInt("ID_PEDIDO"));
                p.setFecha_solicitud(rs.getDate("FECH_SOLICITUD"));
                p.setProducto(rs.getString("PRODUCTO"));
                p.setDescripcion(rs.getString("DESCRIPCION"));
                p.setCantidad(rs.getInt("CANTIDAD"));
                p.setEstado_pedido(rs.getString("ESTADO_PEDIDO"));
                pr.setId_proveedor(rs.getInt("ID_PROVEEDOR"));
                p.setProveedores(pr);
                
                datos.add(p);
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return datos;
    }
    
    public static boolean enviarPedido(PedidoProveedor p)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE PEDIDOPROVEDOR SET ESTADO_PEDIDO = 'PEDIDO', FECH_PEDIDO = to_date( ? , 'DD-MON-YYYY HH24:MI' ) " +
                        " WHERE ID_PEDIDO =? AND ESTADO_PEDIDO = 'SOLICITADO'";
            pst = con.prepareStatement(sentencia);
            
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
            String fechaRecibida = df.format(p.getFecha_pedido());
            
            pst.setString(1, fechaRecibida);
            pst.setInt(2, p.getId_pedido());
            
            pst.executeQuery();
            
            res = true;
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally
        {
            try {
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return res;
    }
    
   
    
}
