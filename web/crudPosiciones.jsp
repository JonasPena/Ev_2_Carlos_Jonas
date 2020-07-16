<%-- 
    Document   : crudProductos
    Created on : 03-07-2020, 21:18:40
    Author     : Edgard
--%>

<%@page import="dao.PosicionDAO"%>
<%@page import="modelos.Posicion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud Posicion</title>
    </head>
    <body>
    <center>
        <h1>Crud Posicion</h1>
        <menu >
            <a href="intranet.jsp">
            <menuitem >Inicio</menuitem>
            </a> 
        </menu>
        <form action="ControladorPosicion" method="post">
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre"/></td>
                </tr>
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
                <td>Id</td>
                <td>Nombre</td>
                <td>Eliminar</td>
                                
                 </tr>
            <% ArrayList<Posicion> posicion = new PosicionDAO().obtenerPosicion();
               for(Posicion e: posicion){               
                %>
               <tr>
                <td><%= e.getId() %></td>
                <td><%= e %></td>
                
                <td><a href="delPosicion.jsp?id=<%= e.getId() %>">
                        <button type="button">Eliminar</button>
                    </a></td>
            </tr>
            <% } %>
        </table>
    </center>
    </body>
</html>
