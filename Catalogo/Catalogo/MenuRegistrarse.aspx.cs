using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using Negocio;

namespace Catalogo
{
    public partial class MenuRegistrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
           {
                Usuario user = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                EmailService emailService = new EmailService();


                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Email = txtEmail.Text;
                if (emailService.EmailExistente(user.Email))
                {
                    Session.Add("error", "Este email ya esta en uso");
                    Response.Redirect("MenuRegistrarse.aspx");
                }

                user.Password = txtPass.Text;
                user.Admin = (Usuario.TipoUsuario.NORMAL);
                if (txtImagenUrl.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/    ");
                    txtImagenUrl.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.UrlImagen = "perfil-" + user.Id + ".jpg";
                }

                int id = negocio.Registrar(user);
                negocio.Login(user);

                emailService.armarCorreo(user.Email, "Bienvenido" + user.Nombre + "!! ", "Bienvenido a mi catalogo");
                emailService.enviarEmail();

                Session.Add("usuario", user);
                Response.Redirect("Default.aspx");


            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }

        }
    }
}