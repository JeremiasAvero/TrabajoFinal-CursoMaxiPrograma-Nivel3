using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Catalogo
{
    public partial class master : System.Web.UI.MasterPage
    {
        public bool Admin { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            Seguridad seguridad = new Seguridad();
            Admin = false;


            if(!(Page is MenuLogin || Page is Default || Page is MenuRegistrarse))
            {
                if (!(seguridad.SesionActiva(Session["usuario"])))
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
            if (seguridad.SesionActiva(Session["usuario"]))
            {
                Usuario usuario = (Usuario)Session["usuario"];
                lblUser.Text = usuario.Nombre;
                if (!string.IsNullOrEmpty(usuario.UrlImagen))
                    imgAvatar.ImageUrl = "~/Images/" + usuario.UrlImagen;
                else
                    imgAvatar.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";

            }





            if (seguridad.EsAdmin(Session["usuario"]))
            {
                Admin = true;
            }
            else
            {
                Admin = false;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Default.aspx");
        }
    }
}