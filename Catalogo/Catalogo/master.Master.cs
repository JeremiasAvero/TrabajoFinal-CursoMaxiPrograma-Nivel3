using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
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


            if(!(Page is MenuLogin || Page is Default || Page is MenuRegistrarse || Page is Error))
            {
                if (!(seguridad.SesionActiva(Session["usuario"])))
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
            if (seguridad.SesionActiva(Session["usuario"]))
            {
                Usuario usuario = (Usuario)Session["usuario"];

                if (!string.IsNullOrEmpty(usuario.UrlImagen))
                    imgPerfil.ImageUrl = "~/Images/" + usuario.UrlImagen;
                else
                    imgPerfil.ImageUrl = "https://fotografias.lasexta.com/clipping/cmsimages02/2019/11/14/66C024AF-E20B-49A5-8BC3-A21DD22B96E6/default.jpg?crop=1299,731,x0,y0&width=1900&height=1069&optimize=low";

            }

            if (seguridad.EsAdmin(Session["usuario"]))
            {
                Admin = true;
            }
            else
            {
                Admin = false;
            }
            
            if(txtFiltro.Text == "")
            {
                Session.Remove("filtro");
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Default.aspx");
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            if (txtFiltro.Text != null)
            {
                if(txtFiltro.Text != "")
                {
                    
                    Session.Add("filtro", txtFiltro.Text);
                    Response.Redirect("Default.aspx", false);

                }
                else
                {
                    Session.Remove("filtro");
                    Response.Redirect("Default.aspx", false);

                }

            }
            
            
        }
    }
}