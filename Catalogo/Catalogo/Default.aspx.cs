using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            Session.Add("listaArticulos", negocio.listar());

            string filtro = "";
            if(!IsPostBack)
            {
                repRepetidor.DataSource = Session["listaArticulos"];
                repRepetidor.DataBind();

                if (Session["filtro"] != null)
                {

                    filtro = Session["filtro"].ToString();
                    List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                    List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(filtro.ToUpper()));
                    repRepetidor.DataSource = listaFiltrada;
                    repRepetidor.DataBind();
                }
                else
                {
                    repRepetidor.DataSource = Session["listaArticulos"];
                    repRepetidor.DataBind();
                }

            }
            
            






        }

        protected void btnFavoritos_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null) 
            {
                string ArtId = ((Button)sender).CommandArgument;
                FavoritosNegocio negocio = new FavoritosNegocio();
                Usuario usuario = (Usuario)Session["usuario"];

                negocio.agregarFavorito(int.Parse(ArtId), usuario.Id);
                

               
            }
            else
            {
                Response.Redirect("MenuLogin.aspx");

            }



        }
    }
}