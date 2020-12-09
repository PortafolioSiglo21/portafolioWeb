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
    
    public static boolean actualizarPedidoSolicitado(Pedidos p)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE PEDIDOS SET STATUS_PEDIDO='SOLICITADO' WHERE ID_MESAS=?";
            
            pst = con.prepareStatement(sentencia);
            
            pst.setInt(1, p.getMesas().getId_mesa());
            
            pst.executeUpdate();
            
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
    
    public static boolean insertarRegistroPedidoTotem(Pedidos p)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            int numMesa = p.getMesas().getId_mesa();
            int idCargo = p.getCargos().getId_cargo();
            String rutCliente = p.getClientes().getRut_cliente();
            
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
            Date actual = new Date();
            String fecha = df.format(actual);
            
            con = Conexion.getConnection();
            sentencia = " INSERT INTO PEDIDOS(ID_PEDIDO, FECHA, STATUS_PEDIDO, FECHA_HORA_PEDIDO, TOTAL_PEDIDO, RUT_CLIENTE, ID_MESAS,ID_CARGO) " +
                        " VALUES(1,to_date( ? , 'DD-MON-YYYY HH24:MI' ),'INGRESADA',to_date( ? , 'DD-MON-YYYY HH24:MI' ),0,?,?,?)";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, fecha);
            pst.setString(2, fecha);
            pst.setString(3, rutCliente );
            pst.setInt(4, numMesa );
            pst.setInt(5, idCargo);
            
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
    
    public static boolean insertarRegistroPedidoGarzon(Pedidos p)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            int numMesa = p.getMesas().getId_mesa();
            int idCargo = p.getCargos().getId_cargo();
            String rutCliente = p.getClientes().getRut_cliente();
            
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
            Date actual = new Date();
            String fecha = df.format(actual);
            
            con = Conexion.getConnection();
            sentencia = " INSERT INTO PEDIDOS(ID_PEDIDO, FECHA, STATUS_PEDIDO, FECHA_HORA_PEDIDO, TOTAL_PEDIDO, RUT_CLIENTE, ID_MESAS,ID_CARGO) " +
                        " VALUES(1,to_date( ? , 'DD-MON-YYYY HH24:MI' ),'INGRESADA',to_date( ? , 'DD-MON-YYYY HH24:MI' ),0,?,?,?)";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, fecha);
            pst.setString(2, fecha);
            pst.setString(3, rutCliente );
            pst.setInt(4, numMesa );
            pst.setInt(5, idCargo);
            
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
    
    public static boolean enviarMesaAPago(int valorPago, int idMesa)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE PEDIDOS SET STATUS_PEDIDO='PAGAR', TOTAL_PEDIDO=? " +
                        " WHERE ID_MESAS = ?";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, valorPago);
            pst.setInt(2, idMesa);
            
            pst.executeUpdate();
            
            res = true;
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
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
