using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public bool QuitarConfirmar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            QuitarConfirmar = false;
            try
            {
                string filtro = "";
                if (!IsPostBack)
                {

                    ArticuloNegocio negocio = new ArticuloNegocio();
                    if (Session["usuario"] != null)
                    {

                        Session.Add("listaFavoritos", negocio.listar("", ((Usuario)Session["usuario"]).Id));
                        if (Session["filtro"] != null)
                        {
                            filtro = Session["filtro"].ToString();
                            List<Articulo> lista = (List<Articulo>)Session["listaFavoritos"];
                            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(filtro.ToUpper()));
                            repRepetidor.DataSource = listaFiltrada;
                            repRepetidor.DataBind();
                        }
                        else
                        {
                            repRepetidor.DataSource = Session["listaFavoritos"];
                            repRepetidor.DataBind();
                        }
                       
                    }
                    
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }

        }
        protected void btnQFavoritos_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"] != null)
                {

                        string ArtId = ((Button)sender).CommandArgument;
                        FavoritosNegocio Fnegocio = new FavoritosNegocio();
                        Usuario usuario = (Usuario)Session["usuario"];

                        Fnegocio.borrarFavorito(int.Parse(ArtId), usuario.Id);
                        Response.Redirect("Favoritos.aspx", false);
                }
                else
                {
                    Response.Redirect("MenuLogin.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            QuitarConfirmar = true;
        }
    }
}