using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using negocio;

namespace Negocio
{
    public class UsuarioNegocio
    {
        

        public bool IsAdmin(Usuario usuario)
        {
            if (usuario == null)
            {
                return false;
            }
            if (usuario.Admin == Usuario.TipoUsuario.ADMIN)
            {
                return true;
            }
            return false;
        }

        public int Registrar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                
                datos.Procedimiento("registrarUser");
                datos.Parametro("email", usuario.Email);
                datos.Parametro("nombre", usuario.Nombre);
                datos.Parametro("apellido", usuario.Apellido);
                datos.Parametro("pass", usuario.Password);
                datos.Parametro("urlImagen", usuario.UrlImagen);
                datos.Parametro("admin", usuario.Admin);
                return datos.EjecutarScalar();
                
            }
            catch (Exception ex) 
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public bool Login(Usuario usuario)
        {
            AccesoDatos datos= new AccesoDatos();
            try
            {
                datos.Consulta("select Id, nombre, apellido, email, pass, urlImagenPerfil,admin from users where email = @email and pass = @pass ");
                datos.Parametro("@pass", usuario.Password);
                datos.Parametro("@email", usuario.Email);
                datos.Lectura();

                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Nombre = (string)datos.Lector["nombre"];
                    usuario.Apellido = (string)datos.Lector["apellido"];
                    usuario.Email = (string)datos.Lector["email"];
                    usuario.Password = (string)datos.Lector["pass"];
                    usuario.UrlImagen = (string)datos.Lector["urlImagenPerfil"];
                    usuario.Admin = (bool)datos.Lector["admin"] == true ? Usuario.TipoUsuario.ADMIN : Usuario.TipoUsuario.NORMAL;
                    return true;
                }
                return false;
            }
            catch(Exception ex) 
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void Actualizar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try 
            {
                
                datos.Procedimiento("ActualizarUser");
                datos.Parametro("@id", usuario.Id);
                datos.Parametro("@nombre", usuario.Nombre);
                datos.Parametro("@apellido", usuario.Apellido);
                datos.Parametro("@email", usuario.Email);
                datos.Parametro("@UrlPerfil", (object)usuario.UrlImagen ?? DBNull.Value);

                datos.Ejecutar();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void ActualizarImagen(int id, string url)
          {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.Procedimiento("ActualizarImagen");
                datos.Parametro("id", id);
                datos.Parametro("@UrlImagen", url);
                datos.Ejecutar();
            }
            catch (Exception ex) { throw ex; }      
            }
    }
}
