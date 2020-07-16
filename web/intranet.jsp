   <%@page import="modelos.Jugador"%>
<%@page import="dao.JugadorDAO"%>
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
            <a href="index.jsp">
            <menuitem >Usuarios</menuitem>
            </a> |
            <a href="intranet.jsp">
            <menuitem >Jugadores</menuitem>
            </a> |
            <a href="Equipo.jsp">
            <menuitem >Equipo</menuitem>
            </a> |
            <a href="cudCiudades.jsp">
            <menuitem >Ciudad</menuitem>
            </a> |
            <a href="crudDivisiones.jsp">
            <menuitem >Division</menuitem>
            </a> |
            <a href="crudPosiciones.jsp">
            <menuitem >Posicion</menuitem>
            </a> 
        </menu>
        <h1>Registro de Jugadores</h1>
        <form action="ControladorJugador" method="post">
            <table>
          
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="nombre"/></td>
            </tr>
            <tr>
                <td>Apellido</td>
                <td><input type="text" name="apellido"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"/></td>
            </tr>
            <tr>
                <td>FechaNacimiento</td>
                <td><input type="text" name="FechaNacimiento"/></td>
            </tr>
            <tr>
                <td>Posicion</td>
                <td><input type="text" name="Posicion"/></td>
            </tr>
            <tr>
                <td>Sueldo</td>
                <td><input type="text" name="Sueldo"/></td>
            </tr>
            <tr>
                <td>EquipoActual</td>
                <td><input type="text" name="EquipoActual"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Registrar"/></td>
                <td><a href="index.jsp">
                    <input type="button" value="Volver"/>
                    </a>
                </td>
            </tr>
            
        </table>
            <input type="hidden" name="accion" value="2"/>
        </form>
        <% if(request.getParameter("msj")!= null){%>
        <h3><%= request.getParameter("msj") %></h3>
        <%}%>
        <h3>Jugadores Registrados</h3>
        <table border="1" style="border-collapse: collapse;">
            <tr>
              
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Password</td>
                <td>FechaNacimiento</td>
                <td>Posicion</td>
                <td>Sueldo</td>
                <td>EquipoActual</td>
                <td>Modificar</td>
                <td>Eliminar</td>
            </tr>
            <%  JugadorDAO ud = new JugadorDAO();
                ArrayList<Jugador> Jugador = ud.obtenerJugador(); 
            for(Jugador u:Jugador){
            %>
            <tr>
               
                <td><%= u.getNombre() %></td>
                <td><%= u.getApellido() %></td>
                <td><%= UsuarioUtil.createPassword() %></td>
                <td><%= u.getFechaNacimiento() %></td>
                <td><%= u.getPosicion() %></td>
                <td><%= u.getSueldo() %></td>
                <td><%= u.getEquipoActual() %></td>
                <td><a href="modificaUsuario.jsp?id=<%= u.getId() %>">
                        <input type="button" value="Modificar"/>
                    </a>
                </td>
                <td><a href="eliminarUsuario.jsp?id=<%= u.getId() %>">
                        <input type="button" value="Eliminar"/>
                    </a></td>
            </tr>
            <% } %>
        </table>
        <% if(request.getParameter("msj")!= null){%>
        <h4><%= request.getParameter("msj") %></h4>
        <%}%>
      </center>
</html>
