using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using Negocio;

namespace Catalogo
{
    public partial class ArticulosForm : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                Seguridad seguridad = new Seguridad();
                Usuario usuario = (Usuario)Session["usuario"];

                if (!seguridad.EsAdmin(usuario))
                {
                    Response.Redirect("Default.aspx",false);
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
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Session.Add("listaArticulos", negocio.listar());
                    dgvArticulos.DataSource = Session["listaArticulos"];
                    dgvArticulos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }

        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaArticulos.aspx?id= " + id);
        }

        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.DataSource = Session["listaArticulos"];
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataBind();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
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
                Page.Validate();
                if (!Page.IsValid)
                { return; }
                ArticuloNegocio Anegocio = new ArticuloNegocio();
                if(txtfiltroAvanzado.Text != null)
                {
                    if(txtfiltroAvanzado.Text != "")
                    {

                        dgvArticulos.DataSource = Anegocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtfiltroAvanzado.Text);
                        dgvArticulos.DataBind();
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