
package Controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.Barcode39;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import domain.Reservaciones;
import java.io.FileOutputStream;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.ReservacionesDAO;
import java.io.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Dr4g0n
 */
public class rptReservasDia extends HttpServlet {

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
            throws ServletException, IOException, DocumentException {
        response.setContentType("text/html;charset=UTF-8");
          
            File directorio = new File(System.getProperty("user.home")+"/desktop/Reporte SigloXXI/");
            File directorioReservas = new File(System.getProperty("user.home")+"/desktop/Reporte SigloXXI/Reservas dia/");
        
            if(!directorio.exists())
            {
                directorio.mkdirs();
            }
            if(!directorioReservas.exists())
            {
                directorioReservas.mkdirs();
            }
            
            
        
            LinkedList<Reservaciones> arrDatos = new LinkedList<>();
            arrDatos = ReservacionesDAO.listadoReservasDelDia();
            Date hoy = new Date();
            long numero = hoy.getTime();
            RequestDispatcher rd ;
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyy");
            String fechaHoy = df.format(hoy);
                    
            
            if(arrDatos.size() == 0)
            {
                request.setAttribute("pdfGenerado", "false");
                rd = request.getRequestDispatcher("reservasDelDia.jsp");
                rd.forward(request, response);
            
            }else{


                // generar estructura PDF
                String encabezado ="Reporte Reservas Del Día";
                String numReporte = "N° Reporte: "+numero;

                // definir tipo de letra para reporte
                Font fuente = new Font(Font.getFamily("ARIAL"),12,Font.BOLD);

                // crear objeto de tipo imagen
                Image imagen = Image.getInstance(("http://localhost:33441/siglo21/img/logo.jpg"));
                imagen.setAlignment(Image.TOP | Image.TEXTWRAP);

                // crear un parrafo
                Paragraph linea = new Paragraph(encabezado, fuente);
                Paragraph numRep = new Paragraph(numReporte, fuente);
                Paragraph fecha = new Paragraph("Fecha: "+fechaHoy+"\n", fuente);

                // crear tabla el numero corresponde a la cantidad de columnas
                PdfPTable tabla = new PdfPTable(7);
                tabla.setWidthPercentage(100);
                
                // centrado de todas las celdas
                tabla.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

                // creacion del documento y tamaño
                Document documento = new Document(PageSize.A4);

                // definir la ruta de destino en donde se generara archivo pdf
                String file = System.getProperty("user.home")+"/desktop/Reporte SigloXXI/Reservas dia/Reporte_Reservas_dia_"+numero+".pdf";


                // generamos el archivo PDF: con el contenido
                PdfWriter pdf = PdfWriter.getInstance(documento, new FileOutputStream(file));

                // creamos las celdas de cabecera
                PdfPCell celda1 = new PdfPCell(new Paragraph("#",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Rut Cliente",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Nombre",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Teléfono",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda5 = new PdfPCell(new Paragraph("Fecha",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda6 = new PdfPCell(new Paragraph("Hora",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
                PdfPCell celda7 = new PdfPCell(new Paragraph("N° Personas",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));

                // centrado de celdas
                celda1.setHorizontalAlignment(1);
                celda2.setHorizontalAlignment(1);
                celda3.setHorizontalAlignment(1);
                celda4.setHorizontalAlignment(1);
                celda5.setHorizontalAlignment(1);
                celda6.setHorizontalAlignment(1);
                celda7.setHorizontalAlignment(1);
                
                // ensamblar el documento
                documento.open();
                
                // generamos el barcode
                Barcode39 code = new Barcode39();
                code.setCode(String.valueOf(numero));
                com.itextpdf.text.Image img128 = code.createImageWithBarcode(pdf.getDirectContent(),BaseColor.BLACK, BaseColor.BLACK);
                img128.scalePercent(150);
                
                    //Agregamos datos anteriores
                documento.add(imagen);
                documento.add(numRep);
                documento.add(fecha);
                documento.add(Chunk.NEWLINE);
                documento.add(linea);
                documento.add(Chunk.NEWLINE);
                
                    // agregamos las celdas
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                tabla.addCell(celda5);
                tabla.addCell(celda6);
                tabla.addCell(celda7);
                
                    // imprimimos el contenido del esquema de datos (desde la DBA)
                int contador = 0;
                for (int i = 0; i < arrDatos.size(); i++) {
                    contador = contador + 1;
                    String rutCli   = arrDatos.get(i).getClientes().getRut_cliente();
                    String nombres  = arrDatos.get(i).getClientes().getNombres();
                    String Apellidos= arrDatos.get(i).getClientes().getApellidos();
                    String telefono = arrDatos.get(i).getClientes().getTelefono();
                    Date fechaHora  = arrDatos.get(i).getFecha_hora();
                    int cantidad    = arrDatos.get(i).getCantidad_personas();

                    // conversion de datos
                    String nombre[]     = nombres.split(" ");
                    String apellido[]   = Apellidos.split(" ");
                    String nomApe       = nombre[0] +" "+apellido[0];
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
                    String fechas       = sdf.format(fechaHora);
                    String cortaFecha[] = fechas.split(" ");
                    String soloFecha    = cortaFecha[0];
                    String soloHora     = cortaFecha[1];


                    tabla.addCell(new Paragraph(Integer.toString(contador),FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(rutCli,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(nomApe,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(telefono,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(soloFecha,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(soloHora,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell(new Paragraph(Integer.toString(cantidad),FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
                }

                // agregamos la tabla hacia el documento
                documento.add(tabla);
                documento.add(Chunk.NEWLINE);
                documento.add(img128);
                documento.close();


                request.setAttribute("pdfGenerado", "true");
                rd = request.getRequestDispatcher("reservasDelDia.jsp");
                rd.forward(request, response);
            }
            
            
            
       
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
        } catch (DocumentException ex) {
            Logger.getLogger(rptReservasDia.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (DocumentException ex) {
            Logger.getLogger(rptReservasDia.class.getName()).log(Level.SEVERE, null, ex);
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
