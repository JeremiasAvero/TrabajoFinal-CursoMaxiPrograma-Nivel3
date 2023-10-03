<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Catalogo.Default" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function confirmarAccion() {
        return confirm("¿Estás seguro de que deseas agregar este artículo a Mis favoritos?");
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="filtro">
        <div class="articulos-filtro-avanzado">
                        <div class="articulos-filtro-avanzado-chk">
                            <asp:CheckBox Text="Activar filtros" runat="server" ID="chkFiltroAvanzado" AutoPostBack="true" CssClass="form-check-label" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" />

                        </div>
                        <%if (FiltroAvanzado)
                            {  %>
                        <div class="filtro-avanzado">
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Campo" runat="server" />
                                    <asp:DropDownList ID="ddlCampo" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                        <asp:ListItem Text="Nombre" />
                                        <asp:ListItem Text="Codigo" />
                                        <asp:ListItem Text="Precio" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Criterio" runat="server" />
                                    <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Filtro" runat="server" />
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtfiltroAvanzado" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtfiltroAvanzado" runat="server" ErrorMessage="Ingresa un filtro "></asp:RequiredFieldValidator>
                                    <% if (ddlCampo.SelectedItem.ToString() == "Precio")
                                        {
                                    %>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtfiltroAvanzado" runat="server" ValidationExpression="^\d{1,23}$" ErrorMessage="Introduce solo números"></asp:RegularExpressionValidator>
                                    <% 
                                        }
                                        else
                                        {
                                    %>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtfiltroAvanzado" runat="server" ValidationExpression="^.{1,35}$" ErrorMessage="fuera de rango"></asp:RegularExpressionValidator>

                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="filtro-avanzado-row">
                            <asp:Button Text="Filtrar" CssClass="btn btn-primary" ID="btnFiltroAvanzado" runat="server" OnClick="btnFiltroAvanzado_Click" />
                        </div>
                        <%} %>
                    </div>
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
                        <asp:Button Text="Añadir a favorito" CssClass="boton-añadir-f btn btn-primary" ID="btnFavoritos" OnClick="btnFavoritos_Click" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" runat="server" OnClientClick="return confirmarAccion();" />
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
       
    </div>


</asp:Content>
