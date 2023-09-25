<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Catalogo.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="favoritos-h1">
         <h1 >Articulos favoritos</h1>
    </div>
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
                   </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
 
</asp:Content>

