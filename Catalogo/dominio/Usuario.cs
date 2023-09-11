using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario
    {
        public enum TipoUsuario
        {
            NORMAL = 0,
            ADMIN = 1,
        }

        public int Id { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Nombre { get; set; }
        public string Apellido { get; set; }

        public string UrlImagen { get; set; }

        public TipoUsuario Admin { get; set; }

        public Usuario(string email, string pass, bool admin)
        {
            Email = email;
            Password = pass;
            Admin = admin ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
        }

        public Usuario() { }    
    }
}
