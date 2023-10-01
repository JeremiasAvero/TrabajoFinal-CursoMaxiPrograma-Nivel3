using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class FavoritosNegocio
    {

        public void agregarFavorito(int idArticulo, int idUser) 
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.Procedimiento("agregarFavorito");
                datos.Parametro("idArticulo", idArticulo);
                datos.Parametro("idUser", idUser);
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
        public void borrarFavorito(int idArticulo, int idUser)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.Procedimiento("borrarFavorito");
                datos.Parametro("IdArticulo", idArticulo);
                datos.Parametro("IdUser", idUser);
                datos.Ejecutar();

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

    }
}
