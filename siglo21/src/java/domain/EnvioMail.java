package domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Dr4g0n
 */
public class EnvioMail {
    
    
    public static boolean enviarMailReservaciones(Reservaciones r) throws AddressException, MessagingException
    {
        boolean res = false;
        
        /*
        *
        *          sistema envio de email
        *
        */
        int cantidadPersonas= r.getCantidad_personas();
        String estadoReserva= r.getEstado_reserva();
        Date fechaReserva   = r.getFecha_hora();
        String rutCli       = r.getClientes().getRut_cliente();
        String emailCli     = r.getClientes().getEmail();
        
        SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
        
        String fechaReservaStr = df.format(fechaReserva);
        String fechaHoraSep[] = fechaReservaStr.split(" ");
        String soloFecha = fechaHoraSep[0];
        String soloHora  = fechaHoraSep[1];
        
        // cuenta mail envio
        String remitente    = "siglo21.portafolio";
        String clave        = "tblukazkhciauiox";
        String destino      = emailCli;//(String)request.getParameter("txtReceptor");
        String asunto       = "Reserva en Restaurant Siglo XXI";
        String mensaje      = "Ud a solicitado una reserva";
        
         // crear objeto el cual recibe como parametros las varriables
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp-relay.gmail.com");
        prop.put("mail.smtp.port",25);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.user", remitente);
        prop.put("mail.smtp.clave", clave);
        
        Session session = Session.getDefaultInstance(prop);
        MimeMessage mimeMensaje = new MimeMessage(session);
       
        /* agregar motivo y mensaje al destinatario */           
        mimeMensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
        mimeMensaje.setSubject(asunto,"UTF-8");
        mimeMensaje.setText(mensaje,"UTF-8");
         // PREPARE THE IMAGE



        // sistema envio en html
        StringBuilder sb = new StringBuilder();
        sb.append(" <html>"
                + "<body>"
                + "<table   style='color: #F36E33; '"
                + "<tr>"
                + " <td>"
                + "   <h2 style='font-weight: bold;  text-align: center; color: #000; '>DATOS DE RESERVA</h2>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Rut Cliente Reservante</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+rutCli+"</h3>"
                + " </td>"
                + "</tr>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Fecha Reserva</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+soloFecha+"</h3>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Hora Reserva</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+soloHora+"</h3>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Cantidad de Personas</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+cantidadPersonas+"</h3>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Estado Reserva</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+estadoReserva+"</h3>"
                + " </td>"
                + "</tr>"
                + "</table>"
                + "</body>"
                + "</html>");
        mimeMensaje.setContent(sb.toString() , "text/html");

        /*  generar transporte y envio de mail  */
        Transport t = session.getTransport("smtp");
        t.connect("smtp.gmail.com",remitente,clave);
        t.sendMessage(mimeMensaje, mimeMensaje.getAllRecipients());
        t.close(); 
        
        
        return res;
    }
    
     public static boolean enviarMailCancelacion(Reservaciones r) throws AddressException, MessagingException
    {
        boolean res = false;
        
        /*
        *
        *          sistema envio de email
        *
        */
        int cantidadPersonas= r.getCantidad_personas();
        Date fechaReserva   = r.getFecha_hora();
        String emailCli     = r.getClientes().getEmail();
        
        SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
        
        String fechaReservaArr = df.format(fechaReserva);
        String fechaHoraSep[] = fechaReservaArr.split(" ");
        
        String soloFecha = fechaHoraSep[0];
        String soloHora  = fechaHoraSep[1];
        
        // cuenta mail envio
        String remitente    = "siglo21.portafolio";
        String clave        = "tblukazkhciauiox";
        String destino      = emailCli;//(String)request.getParameter("txtReceptor");
        String asunto       = "Cancelacion de reserva en Restaurant Siglo XXI";
        String mensaje      = "Ud a solicitado una reserva";
        
         // crear objeto el cual recibe como parametros las varriables
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp-relay.gmail.com");
        prop.put("mail.smtp.port",25);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.user", remitente);
        prop.put("mail.smtp.clave", clave);
        
        Session session = Session.getDefaultInstance(prop);
        MimeMessage mimeMensaje = new MimeMessage(session);
       
        /* agregar motivo y mensaje al destinatario */           
        mimeMensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
        mimeMensaje.setSubject(asunto,"UTF-8");
        mimeMensaje.setText(mensaje,"UTF-8");
         // PREPARE THE IMAGE



        // sistema envio en html
        StringBuilder sb = new StringBuilder();
        sb.append(" <html>"
                + "<body>"
                + "<table  <h4 style='color: #F36E33; '>"
                + "<tr>"
                + " <td>"
                + "   <h2 style='font-weight: bold;  text-align: center; color: #000; '>DATOS DE CANCELACIÓN RESERVA</h2>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Fecha Cancelada</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+soloFecha+"</h3>"
                + " </td>"
                + "<tr>"
                + " <td>"
                + "    <h3>Hora Cancelada</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+soloHora+"</h3>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Cantidad de Personas</h3>"
                + " </td>"
                + " <td>"
                + "    <h3>"+cantidadPersonas+"</h3>"
                + " </td>"
                + "</tr>"
                + "</table>"
                + "</body>"
                + "</html>");
        mimeMensaje.setContent(sb.toString() , "text/html");

        /*  generar transporte y envio de mail  */
        Transport t = session.getTransport("smtp");
        t.connect("smtp.gmail.com",remitente,clave);
        t.sendMessage(mimeMensaje, mimeMensaje.getAllRecipients());
        t.close(); 
        
        
        return res;
    }
     
     
     public static boolean enviarMailPedidos() throws AddressException, MessagingException
    {
        boolean res = false;

        // cuenta mail envio
        String remitente    = "siglo21.portafolio";
        String clave        = "tblukazkhciauiox";
        String destino      = "";//emailCli;//(String)request.getParameter("txtReceptor");
        String asunto       = "Solicitud de Insumos Restaurant SigloXI";
        String mensaje      = "";
        
         // crear objeto el cual recibe como parametros las varriables
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp-relay.gmail.com");
        prop.put("mail.smtp.port",25);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.user", remitente);
        prop.put("mail.smtp.clave", clave);
        
        Session session = Session.getDefaultInstance(prop);
        MimeMessage mimeMensaje = new MimeMessage(session);
       
        /* agregar motivo y mensaje al destinatario */           
        mimeMensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
        mimeMensaje.setSubject(asunto,"UTF-8");
        mimeMensaje.setText(mensaje,"UTF-8");
         // PREPARE THE IMAGE



        // sistema envio en html
        StringBuilder sb = new StringBuilder();
        sb.append(" <html>"
                + "<body>"
                + "<table  <h4 style='color: #F36E33; '>"
                + "<tr>"
                + " <td>"
                + "   <h2 style='font-weight: bold;  text-align: center; color: #000; '>DATOS DE CANCELACIÓN RESERVA</h2>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Fecha Cancelada</h3>"
                + " </td>"
                + " <td>"
                + "    <h3></h3>"
                + " </td>"
                + "<tr>"
                + " <td>"
                + "    <h3>Hora Cancelada</h3>"
                + " </td>"
                + " <td>"
                + "    <h3></h3>"
                + " </td>"
                + "</tr>"
                + "<tr>"
                + " <td>"
                + "    <h3>Cantidad de Personas</h3>"
                + " </td>"
                + " <td>"
                + "    <h3></h3>"
                + " </td>"
                + "</tr>"
                + "</table>"
                + "</body>"
                + "</html>");
        mimeMensaje.setContent(sb.toString() , "text/html");

        /*  generar transporte y envio de mail  */
        Transport t = session.getTransport("smtp");
        t.connect("smtp.gmail.com",remitente,clave);
        t.sendMessage(mimeMensaje, mimeMensaje.getAllRecipients());
        t.close(); 
        
        
        return res;
    }
     
     
}
