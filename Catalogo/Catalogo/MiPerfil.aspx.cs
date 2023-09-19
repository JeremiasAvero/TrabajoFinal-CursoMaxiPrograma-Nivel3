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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    Seguridad seguridad = new Seguridad();

                    if (seguridad.SesionActiva(Session["usuario"]))
                    {
                        Usuario usuario = (Usuario)Session["usuario"];
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtEmail.Text = usuario.Email;
                        
                        if (!string.IsNullOrEmpty(usuario.UrlImagen))
                            imgUrl.ImageUrl = "~/Images/" + usuario.UrlImagen;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
            






        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuario = (Usuario)Session["usuario"];

                if (txtImagenUrl.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/    ");
                    txtImagenUrl.PostedFile.SaveAs(ruta + "perfil-" + usuario.Id + ".jpg");
                    usuario.UrlImagen = "perfil-" + usuario.Id + ".jpg";
                }
                
               
            
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtEmail.Text;
                
                negocio.Actualizar(usuario);

                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/Images/" + usuario.UrlImagen;
            }
            catch (Exception ex) 
            {
                Session.Add("error", ex);
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Default.aspx");
        }
    }
}