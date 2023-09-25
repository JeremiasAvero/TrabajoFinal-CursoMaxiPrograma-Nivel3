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
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            if (Session["usuario"] != null)
            {

                Session.Add("listaFavoritos", negocio.listar("", ((Usuario)Session["usuario"]).Id));
                repRepetidor.DataSource = (Session["listaFavoritos"]);
                repRepetidor.DataBind();
            }
           
            
           
        }

        protected void btnHola_Click(object sender, EventArgs e)
        {

        }
    }
}