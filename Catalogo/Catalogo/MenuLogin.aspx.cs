using dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo
{
    public partial class MenuLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if(!Page.IsValid)
            { return; }

            try
            {
                if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtPassword.Text))
                    Response.Redirect("MenuLogin.aspx", false);
                else
                {
                    Usuario usuario;
                    UsuarioNegocio negocio = new UsuarioNegocio();
                    usuario = new Usuario(txtEmail.Text, txtPassword.Text, false);
                    if (negocio.Login(usuario))
                    {
                        Session.Add("usuario", usuario);
                        Response.Redirect("MiPerfil.aspx", false);
                    }
                    else
                    {
                        Session.Add("error", "user o pass incorrectas");
                        Response.Redirect("MenuLogin.aspx", false);
                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}