<%-- 
    Document   : crudProductos
    Created on : 03-07-2020, 21:18:40
    Author     : Edgard
--%>

<%@page import="dao.EstadioDAO"%>
<%@page import="modelos.Estadio"%>
<%@page import="dao.CiudadDAO"%>
<%@page import="modelos.Ciudad"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud Estadio</title>
    </head>
    <body>
    <center>
        <h1>Crud Estadio</h1>
        <menu >
            <a href="intranet.jsp">
            <menuitem >Inicio</menuitem>
            </a> 
        </menu>
        <form action="ControladorEstadio" method="post">
            <table>
                
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre"/></td>
                </tr>
                <tr>
                    <td>Ciudad</td>
                    <td>
                        <select name="ciudad">
                            <option value="0">Seleccione</option>
                            <% ArrayList<Ciudad> ciudad = new CiudadDAO().obtenerCiudad(); 
                            for(Ciudad e:ciudad){%>
                            <option value="<%= e.getId() %>"><%= e %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
               
                <tr>
                    <td>Cantidad de Personas</td>
                    <td><input type="number" name="cantidad"/></td>
                </tr>
                <tr>
                    <td><input type="reset" value="Limpiar"/></td>
                    <td><input type="submit" value="Registrar"/></td>
                <input type="hidden" name="accion" value="1"/>
                </tr>
            </table>
        </form>
                        <% if(request.getParameter("msj")!= null){%>
        <h4><%= request.getParameter("msj") %></h4>
        <%}%>
        <table>
            <tr>
             
              <td>Nombre</td>
              <td>Ciudad</td>
                         
              <td>Capacidad</td>
               
            </tr>
            <% ArrayList<Estadio> estadios = new EstadioDAO().obtenerEstadios();
               for(Estadio p: estadios){               
                %>
            <tr>
                <td><%= p.getCodigo() %></td>
                <td><%= p.getNombre() %></td>
                  <td><%= p.getCapacidad() %></td>
                  <td><%= p.getCiudad() %></td>
                <td><a href="modEstadio.jsp?codigo=<%= p.getCodigo() %>">
                        <button type="button">Modificar</button>
                    </a></td>
                <td><a href="delEstadio.jsp?codigo=<%= p.getCodigo() %>">
                        <button type="button">Eliminar</button>
                    </a></td>
            </tr>
            <% } %>
        </table>
    </center>
    </body>
</html>
