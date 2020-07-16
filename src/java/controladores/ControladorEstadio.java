/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.CiudadDAO;
import dao.EstadioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Estadio;

/**
 *
 * @author Edgard
 */
@WebServlet(name = "ControladorEstadio", urlPatterns = {"/ControladorEstadio"})
public class ControladorEstadio extends HttpServlet {

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
            throws ServletException, IOException {
         if(request.getParameter("accion")!=null){
        String accion = request.getParameter("accion");
        switch(accion){
            case "1": registrar(request,response);
                break;
           
         }
   
     }
  }
     private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException{
           try{
            long codigo =Long.parseLong(request.getParameter("codigo").trim());
            String nombre = request.getParameter("nombre").trim();
             int ciudad =Integer.parseInt( request.getParameter("ciudad").trim());
            int capacidad = Integer.parseInt(request.getParameter("capaciad").trim());
                  
            if(codigo<1||nombre.equals("")||capacidad<1||ciudad<1){
                response.sendRedirect("crudEstadios.jsp?msj=valores erroneos");
            }else{
                CiudadDAO ed = new CiudadDAO();
                
                Estadio nuevoEstadio = new Estadio (codigo,nombre,ed.obtenerCiudad(ciudad),
                        capacidad);
              EstadioDAO pd = new EstadioDAO();
                if(pd.obtenerEstadio(nuevoEstadio.getCodigo())==null){
                    int respuesta = pd.registrar(nuevoEstadio);
                    if(respuesta==1){
                    response.sendRedirect("crudEstadios.jsp?msj=estadio registrado");
                    }else{
                    response.sendRedirect("crudEstadio.jsp?msj=Estadio no se pudo registrar");
                    }
                }else{
                    response.sendRedirect("crudEstadios.jsp?msj=Estadio ya existe");
                }
            }
           }catch(Exception e){
               response.sendRedirect("crudEstadios.jsp?msj="+e.getMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
