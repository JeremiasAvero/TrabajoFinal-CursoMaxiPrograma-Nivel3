<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Catalogo.Default" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <div class="catalogo-container">
        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>


                <div class="catalogo-carta">
                    <img src="<%#Eval("ImagenUrl") %>" alt="...">
                    <div class="carta-text">
                        <h5><%# Eval("Nombre") %></h5>
                        <p><%# Eval("Descripcion") %></p>
                        <p><%#Eval("Precio") %></p>

                        <a href="DetallesArticulo.aspx?id=<%# Eval("Id") %>">Ver detalles</a>
                        <asp:Button  Text="Añadir a favoritos" CssClass="boton-añadir-f btn btn-primary" ID="btnFavoritos" OnClick="btnFavoritos_Click" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId"  runat="server" />
                      
                   </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>

   
</asp:Content>
