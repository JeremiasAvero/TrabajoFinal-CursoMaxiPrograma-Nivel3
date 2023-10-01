<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Catalogo.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function confirmarAccion() {
        return confirm("¿Estás seguro de que deseas quitar este artículo de Mis favoritos?");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="favoritos-h1">
        <h1>Articulos favoritos</h1>
    </div>
    <div class="catalogo-container">

        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>


                <div class="catalogo-carta">
                    <img src="<%#Eval("ImagenUrl") %>" alt="...">
                    <div class="carta-text">
                        <h5><%# Eval("Nombre") %></h5>
                        <p><%# Eval("Descripcion") %></p>
                        <p><%# Convert.ToDecimal(Eval("Precio")).ToString("N2", System.Globalization.CultureInfo.GetCultureInfo("es-ES")) + " $"  %></p>

                        <a href="AltaArticulos.aspx?id=<%# Eval("Id") %>">Ver detalles</a>
                        <asp:Button Text="Quitar de favoritos" runat="server" ID="btnQFavoritos" CssClass="btn btn-primary" OnClick="btnQFavoritos_Click" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" OnClientClick="return confirmarAccion();" />

                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
       
    </div>

</asp:Content>

