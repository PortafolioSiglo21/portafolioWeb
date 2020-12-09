package services;

import basedatos.Conexion;
import domain.Clientes;
import domain.Mesas;
import domain.Pedidos;
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
public class PedidosDAO {
    
    public static LinkedList<Pedidos> consultarPedidosActual()
    {
        LinkedList<Pedidos> datos = new LinkedList<Pedidos>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con =null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM PEDIDOS " +
                        " WHERE STATUS_PEDIDO = 'SOLICITADO'" +
                        " ORDER BY FECHA_HORA_PEDIDO ASC";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Pedidos p = new Pedidos();
                Mesas m = new Mesas();
                
                Date fechaPedido= rs.getDate("FECHA_HORA_PEDIDO");
                int numMesa = rs.getInt("ID_MESAS");
                
                m.setId_mesa(numMesa);
                p.setFecha_hora_pedido(fechaPedido);
                p.setMesas(m);
                
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
}
