/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.Barcode39;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import domain.PedidoProveedor;
import domain.Proveedores;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.PedidoProveedorDAO;
import services.ProveedorDAO;

/**
 *
 * @author Dr4g0n
 */
public class rptSendPedidoProvedor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException, BadElementException, DocumentException {
        response.setContentType("text/html;charset=UTF-8");
        
     
        
       String idPedidoSTR = request.getParameter("txtIdPedidoEnviar");
        
       
        
        RequestDispatcher rd = null ;
        
        if(idPedidoSTR == "" || idPedidoSTR == null || idPedidoSTR=="0")
        {
            rd = request.getRequestDispatcher("insumos.jsp");
        }else{
            /*
            *
            *       SECTION INFO WEB
            *
            */
            // convertir dato a
            int idPedido = Integer.parseInt(idPedidoSTR);
            
            // capturar datos de pedidos
            LinkedList<PedidoProveedor> arrPedido = new LinkedList<PedidoProveedor>();
            arrPedido = PedidoProveedorDAO.listarPedidoPorID(idPedido);
            
            // instanciar clase proveedor
            Proveedores p = new Proveedores();

            // recorrido arreglo para capturar proveedor
            for (int i = 0; i < arrPedido.size(); i++) {
                p.setId_proveedor(arrPedido.get(i).getProveedores().getId_proveedor());
                p.setEstado(arrPedido.get(i).getEstado_pedido());;
            }
            
            
            String estado = p.getEstado();
            
            // captura id proveedor
            int idProveedor = p.getId_proveedor();
            
             // captura datos de proveedor
            LinkedList<Proveedores> arrProveedor = new LinkedList<Proveedores>();
            arrProveedor = ProveedorDAO.recuperarProveedorPorId(idProveedor);
            
            Proveedores prMail = new Proveedores();
            for (int a = 0; a < arrProveedor.size(); a++) {
                prMail.setRut_proveeedor(arrProveedor.get(a).getRut_proveeedor());
                prMail.setProveedor(arrProveedor.get(a).getProveedor());
                prMail.setNombre_contacto(arrProveedor.get(a).getNombre_contacto());
                prMail.setEmail_proveedor(arrProveedor.get(a).getEmail_proveedor());
                prMail.setTelefono(arrProveedor.get(a).getTelefono());
            }
            
            
            if (estado.equals("SOLICITADO"))
            {
                 /*
                *
                *       SECTION UPDATE DDBB
                *
                */

                PedidoProveedor pu = new PedidoProveedor();
                Date fechaHoy = new Date();
                SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
                String fechaHoyStr = df.format(fechaHoy);

                pu.setId_pedido(idPedido);
                pu.setFecha_pedido(fechaHoy);

                PedidoProveedorDAO.enviarPedido(pu);          
            
                /*
                *
                *       SECTION CREATE PDF
                *
                */
                 // fechas
                Date hoy = new Date();
                long numero = hoy.getTime();
                
                 // generar estructura PDF
                String encabezado ="Solicitud de Productos";
                String numReporte = "N° Reporte: "+numero;

                // definir tipo de letra para reporte
                Font fuente = new Font(Font.getFamily("ARIAL"),12,Font.BOLD);
                Font fuenteBlue = new Font(Font.getFamily("ARIAL"),12,Font.BOLD, BaseColor.BLUE );

                // crear objeto de tipo imagen
                Image imagen = Image.getInstance(("http://localhost:33441/siglo21/img/logo.jpg"));
                imagen.setAlignment(Image.TOP | Image.TEXTWRAP);

                // crear un parrafo
                Paragraph linea = new Paragraph(encabezado, fuenteBlue);
                Paragraph numRep = new Paragraph(numReporte, fuente);
                Paragraph local = new Paragraph("Restaurant Siglo XXI", fuente);
                Paragraph fecha = new Paragraph("Fecha Pedido: "+fechaHoyStr, fuente);
                
                // centrar Texto titulos
                linea.setAlignment(Element.ALIGN_CENTER);
                
                // crear tabla el numero corresponde a la cantidad de columnas
                PdfPTable tabla = new PdfPTable(4);
                tabla.setWidthPercentage(100);
                
                // centrado de todas las celdas
                tabla.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

                // creacion del documento y tamaño
                Document documento = new Document(PageSize.A4);
                
                // crear pdf tipo envio
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                
                // generamos el archivo PDF: con el contenido
                PdfWriter pdf = PdfWriter.getInstance(documento, baos);

                // creamos las celdas de cabecera
                PdfPCell celda1 = new PdfPCell(new Paragraph("#",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Producto",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Descripción",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Cantidad",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                
                // ensamblar el documento
                documento.open();
                
                 // generamos el barcode
                Barcode39 code = new Barcode39();
                code.setCode(String.valueOf(numero));
                com.itextpdf.text.Image img128 = code.createImageWithBarcode(pdf.getDirectContent(),BaseColor.BLACK, BaseColor.BLACK);
                img128.scalePercent(150);
                
                    //Agregamos datos anteriores
                documento.add(imagen);
                documento.add(local);
                documento.add(numRep);
                documento.add(fecha);
                documento.add( Chunk.NEWLINE );
                documento.add(linea);
                documento.add( Chunk.NEWLINE );
                
                    // agregamos las celdas
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                    // imprimimos el contenido del esquema de datos (desde la DBA)
                int contador = 0;
                for (int i = 0; i < arrPedido.size(); i++) {
                    contador = contador + 1;
                    String producto   = arrPedido.get(i).getProducto();
                    String descripcion= arrPedido.get(i).getDescripcion();
                    int cantidad      = arrPedido.get(i).getCantidad();
                    
                    // conversion de datos
                    String descripcionFinal;
                    if(descripcion == null)
                    {
                        descripcionFinal = "sin descripción";
                    }else
                    {
                        descripcionFinal = descripcion;
                    }


                    tabla.addCell(new Paragraph(Integer.toString(contador),FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(producto,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(descripcionFinal,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(Integer.toString(cantidad),FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                }

                // agregamos la tabla hacia el documento
                documento.add(tabla);
                documento.add(Chunk.NEWLINE);
                documento.add(img128);
                documento.close();
            
                /*
                *
                *
                *           SECTION SEND EMAIL
                *
                *
                */


                 // cuenta mail envio
                String remitente    = "siglo21.portafolio";
                String clave        = "tblukazkhciauiox";
                String destino      = prMail.getEmail_proveedor();//emailCli;//(String)request.getParameter("txtReceptor");
                String asunto       = "Solicitud de Insumos Restaurant SigloXI ";
                String mensaje      = "se solicita despacho de los insumos adjuntos en PDF \n\nde antemano, muchas gracias\n\natte. administrador ";

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

                 MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText("se solicita despacho de los insumos adjuntos en PDF "
                                        + "Para nuestro restaurant, esperamos su respuesta."
                                        + "\n\nde antemano, muchas gracias\natte. El administrador");
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);

                messageBodyPart = new MimeBodyPart();

                DataSource source = new ByteArrayDataSource(baos.toByteArray(), "application/pdf");
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName("Solicitud_Productos_n°-"+numero+".pdf");
                multipart.addBodyPart(messageBodyPart);

                mimeMensaje.setContent(multipart);

                /*  generar transporte y envio de mail  */
                Transport t = session.getTransport("smtp");
                t.connect("smtp.gmail.com",remitente,clave);
                t.sendMessage(mimeMensaje, mimeMensaje.getAllRecipients());
                t.close(); 


                request.setAttribute("pdfEnviado", "true");
                rd = request.getRequestDispatcher("insumos.jsp");
            }else
            {
                
                request.setAttribute("pdfEnviado", "false");
                rd = request.getRequestDispatcher("insumos.jsp");
            }
        }
        
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(rptSendPedidoProvedor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(rptSendPedidoProvedor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(rptSendPedidoProvedor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(rptSendPedidoProvedor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
