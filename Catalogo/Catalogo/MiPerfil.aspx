<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Catalogo.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mi Perfil</h1>

    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <asp:Label Text="Nombre" CssClass="form-label" ID="lblNombre" runat="server" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                 <asp:Label Text="Apellido" CssClass="form-label" ID="lblApellido" runat="server" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
            </div>
            <div class="mb-3">
                 <asp:Label Text="Email" CssClass="form-label" ID="lblEmail" runat="server" />
                <asp:TextBox runat="server" ReadOnly="true" ID="txtEmail" CssClass="form-control" />
            </div>
        </div>

        <div class="col-md-4">
            <div class="mb-3">
                <asp:Label Text="Imagen de perfil" ID="lblImagenPerfil" CssClass="form-label" runat="server" />
                <input type="file" id="txtImagenUrl" class="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" CssClass="img-fluid mb-3" ID="imgUrl" runat="server" />
            </div>
        </div>

        <div class="mb-3">
            <a href="Favoritos.aspx" class="btn btn-secondary">Mis favoritos</a>
        </div>

        <div class="row">
            <div class="col-md-4">
                <asp:Button Text="Guardar" OnClick="btnGuardar_Click" ID="btnGuardar" CssClass="btn btn-secondary"  runat="server" />
                <a href="Default.aspx" class="btn btn-secondary">Volver</a>
            </div>
        </div>
         
    </div>
  
</asp:Content>
