/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

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
import domain.Ordenes;
import domain.Reservaciones;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.OrdenesDAO;
import services.ReservacionesDAO;

/**
 *
 * @author Dr4g0n
 */
public class rptVentasPorCartas extends HttpServlet {

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
        File directorioVentas = new File(System.getProperty("user.home")+"/desktop/Reporte SigloXXI/Reportes Ventas Cartas/");
        
        if(!directorio.exists())
        {
            directorio.mkdir();
        }
        if(!directorioVentas.exists())
        {
            directorioVentas.mkdir();
        }
        
         // intanciadores
        RequestDispatcher rd;
        LinkedList<Ordenes> arrDatos = new LinkedList<Ordenes>();
        arrDatos = OrdenesDAO.contarVentasPorCarta();
        
        Date hoy = new Date();
        long numero = hoy.getTime();
        SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
        String fechaHoy =  df.format(hoy);
        
        // generar estructura PDF
        String encabezado ="Reporte Clientes Rechazados";
        String numReporte = "N° Reporte: "+numero;

        // definir tipo de letra para reporte
        Font fuente = new Font(Font.getFamily("ARIAL"),12,Font.BOLD);
        Font fuenteBLue = new Font(Font.getFamily("ARIAL"),12,Font.BOLD , BaseColor.BLUE);

        // crear objeto de tipo imagen
        Image imagen = Image.getInstance(("http://localhost:33441/siglo21/img/logo.jpg"));
        imagen.setAlignment(Image.TOP | Image.TEXTWRAP);

        // crear un parrafo
        Paragraph linea = new Paragraph(encabezado, fuenteBLue);
        Paragraph numRep = new Paragraph(numReporte, fuente);
        Paragraph fecha = new Paragraph("Fecha: "+fechaHoy+"\n", fuente);
        
        // centrado titulo PDF
        linea.setAlignment(Element.ALIGN_CENTER);

        // crear tabla el numero corresponde a la cantidad de columnas
        PdfPTable tabla = new PdfPTable(3);
        tabla.setWidthPercentage(100);
        
        // centrado de todas las celdas
        tabla.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        // creacion del documento y tamaño
        Document documento = new Document(PageSize.A4);

        // definir la ruta de destino en donde se generara archivo pdf
        String file = System.getProperty("user.home")+"/desktop/Reporte SigloXXI/Reportes Ventas Cartas/Reporte_Ventas_carta_"+numero+".pdf";

        // generamos el archivo PDF: con el contenido
        PdfWriter pdf = PdfWriter.getInstance(documento, new FileOutputStream(file));

        // creamos las celdas de cabecera
        PdfPCell celda1 = new PdfPCell(new Paragraph("#",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
        PdfPCell celda2 = new PdfPCell(new Paragraph("Nombre Carta",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
        PdfPCell celda3 = new PdfPCell(new Paragraph("Cantidad vendida",FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLUE)));
        

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

        // centrado de celdas
        celda1.setHorizontalAlignment(1); 
        celda2.setHorizontalAlignment(1); 
        celda3.setHorizontalAlignment(1); 
        
        // agregamos las celdas
        tabla.addCell(celda1);
        tabla.addCell(celda2);
        tabla.addCell(celda3);
        
            // imprimimos el contenido del esquema de datos (desde la DBA)
        int contador = 0;
        for (int i = 0; i < arrDatos.size(); i++) {
            contador = contador + 1;
            String nombre   = arrDatos.get(i).getCarta().getNombre();
            int cantidad  = arrDatos.get(i).getCarta().getId_carta();

           

            tabla.addCell(new Paragraph(Integer.toString(contador),FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
            tabla.addCell(new Paragraph(nombre,FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
            tabla.addCell(new Paragraph(Integer.toString(cantidad),FontFactory.getFont("arial",9,Font.BOLD,BaseColor.BLACK)));
        }

        // agregamos la tabla hacia el documento
        documento.add(tabla);
        documento.add(Chunk.NEWLINE);
        documento.add(img128);
        documento.close();

        request.setAttribute("pdfVentasGenerado", "true");
        rd = request.getRequestDispatcher("ventasPorCarta.jsp");
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
        } catch (DocumentException ex) {
            Logger.getLogger(rptVentasPorCartas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(rptVentasPorCartas.class.getName()).log(Level.SEVERE, null, ex);
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
