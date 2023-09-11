using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace negocio
{
    public class Seguridad
    {
        public bool SesionActiva(object usuario)
        {
            try
            {
                Usuario internalUsuario = usuario != null ? (Usuario)usuario : null;
                if(internalUsuario != null && internalUsuario.Id != 0)
                    return true;
                else return false;
            }
            catch(Exception ex)  
            {
                throw ex;
            }
        }

        public bool EsAdmin(object u) 
        {
            try
            {
                Usuario user = u != null ? (Usuario)u : null;
                if (user != null)
                {
                    if (user.Admin == Usuario.TipoUsuario.ADMIN)
                        return true;
                    else 
                        return false;
                } 
                else
                {
                    return false;
                }
                        
            }
            catch (Exception ex) 
            {
                throw ex;
            }
           
        }
    }
}
