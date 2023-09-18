using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filtro = "";
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



        }
    }
}