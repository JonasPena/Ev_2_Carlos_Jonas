<%-- 
    Document   : intranet.jsp
    Created on : 13-06-2020, 19:30:44
    Author     : Edgard
--%>

<%@page import="dao.UsuarioDAO"%>
<%@page import="util.UsuarioUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intranet</title>
    </head>
    <body>
    <center>
        <h1>Bienvenido
            <% if(session.getAttribute("usuario")!= null){
             Usuario u = (Usuario) session.getAttribute("usuario");
            %>
        <h3><%= u.getNombre()+" "+u.getApellido() %></h3>
        <%}else{response.sendRedirect("index.jsp?msj=acceso denegado");}%>
        </h1>
        <a href="Salir"><input type="button" value="Cerrar Sesion"/></a>
        <menu >
            <tr>
            <a href="intranet.jsp">
            <menuitem >Usuarios</menuitem>
            </a> |
                  
            <a href="crudPosiciones.jsp">
            <menuitem >Posicion</menuitem>
            </a> | 
            <a href="crudCiudades.jsp">
            <menuitem >Ciudad</menuitem>
            </a> 
            | 
            <a href="crudDivisiones.jsp">
            <menuitem >Divisiones</menuitem>
            </a> 
            | 
            <a href="crudJugadores.jsp">
            <menuitem >Jugadores</menuitem>
            </a> 
            | 
            <a href="crudEstadios.jsp">
            <menuitem >Estadio</menuitem>
            </a>
        </menu>
      
        
          
       
  
            
        </table>
            <input type="hidden" name="accion" value="2"/>
        </form>
        <% if(request.getParameter("msj")!= null){%>
        <h3><%= request.getParameter("msj") %></h3>
        <%}%>
    
     
        <% if(request.getParameter("msj")!= null){%>
        <h4><%= request.getParameter("msj") %></h4>
        <%}%>
      </center>
</html>
