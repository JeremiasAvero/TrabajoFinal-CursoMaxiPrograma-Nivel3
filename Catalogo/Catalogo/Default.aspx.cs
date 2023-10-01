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
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaArticulos", negocio.listar());

                string filtro = "";
                if (!IsPostBack)
                {
                    repRepetidor.DataSource = Session["listaArticulos"];
                    repRepetidor.DataBind();

                    if (Session["filtro"] != null)
                    {
                        filtro = Session["filtro"].ToString();
                        List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                        List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(filtro.ToUpper()) || x.CodigoArticulo.ToUpper().Contains(filtro.ToUpper()) || x.Descripcion.ToUpper().Contains(filtro.ToUpper()) || x.Marca.Descripcion.ToUpper().Contains(filtro.ToUpper()));
                        repRepetidor.DataSource = listaFiltrada;
                        repRepetidor.DataBind();
                    }
                    else
                    {
                        repRepetidor.DataSource = Session["listaArticulos"];
                        repRepetidor.DataBind();
                    }
                }
                FiltroAvanzado = chkFiltroAvanzado.Checked;
                if (!IsPostBack)
                {
                    if (ddlCampo.SelectedItem.ToString() == "Precio")
                    {
                        ddlCriterio.Items.Add("Igual a");
                        ddlCriterio.Items.Add("Menor a");
                        ddlCriterio.Items.Add("Mayor a");

                    }
                    else
                    {
                        ddlCriterio.Items.Add("Empieza con");
                        ddlCriterio.Items.Add("Termina con");
                        ddlCriterio.Items.Add("Contiene");
                    }
                    //Session.Add("listaArticulos", negocio.listar());
                    //repRepetidor.DataSource = Session["listaArticulos"];
                    //repRepetidor.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }

        }

        protected void btnFavoritos_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"] != null)
                {
                    string ArtId = ((Button)sender).CommandArgument;
                    FavoritosNegocio Fnegocio = new FavoritosNegocio();
                    Usuario usuario = (Usuario)Session["usuario"];
                    ArticuloNegocio Anegocio = new ArticuloNegocio();
                    List<Articulo> listaFavoritos = Anegocio.listar("", usuario.Id);

                    foreach (Articulo favorito in listaFavoritos)
                    {
                        if (favorito.Id == int.Parse(ArtId))
                            return;

                    }
                    Fnegocio.agregarFavorito(int.Parse(ArtId), usuario.Id);
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
        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Menor a");
                ddlCriterio.Items.Add("Mayor a");

            }
            else
            {
                ddlCriterio.Items.Add("Empieza con");
                ddlCriterio.Items.Add("Termina con");
                ddlCriterio.Items.Add("Contiene");
            }

        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkFiltroAvanzado.Checked;
            //txtfiltroAvanzado.Enabled = !FiltroAvanzado;
        }

        protected void btnFiltroAvanzado_Click(object sender, EventArgs e)
        {
            try
            {
                
                ArticuloNegocio Anegocio = new ArticuloNegocio();
                if (txtfiltroAvanzado.Text != null)
                {
                    if (txtfiltroAvanzado.Text != "")
                    {

                        repRepetidor.DataSource = Anegocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtfiltroAvanzado.Text);
                        repRepetidor.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}