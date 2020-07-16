/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.PosicionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Posicion;

/**
 *
 * @author Edgard
 */
@WebServlet(name = "ControladorPosicion", urlPatterns = {"/ControladorPosicion"})
public class ControladorPosicion extends HttpServlet {

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
            
            String nombre = request.getParameter("nombre").trim();
           
            if(nombre.equals("")){
                response.sendRedirect("crudPosiciones.jsp?msj=valores erroneos");
            }else{
                PosicionDAO ed = new PosicionDAO();
                Posicion e = new Posicion(nombre);
                if(ed.obtenerPosicion(e.getNombre())==null){
                    int respuesta = ed.registrar(e);
                    if(respuesta==1){
                    response.sendRedirect("crudPosiciones.jsp?msj=Posicion registrado");
                    }else{
                    response.sendRedirect("crudPosiciones.jsp?msj=Posicion no se pudo registrar");
                    }
                }else{
                    response.sendRedirect("crudPosiciones.jsp?msj=Posicion ya existe");
                }
            }
           }catch(Exception e){
               response.sendRedirect("crudPosiciones.jsp?msj="+e.getMessage());
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
