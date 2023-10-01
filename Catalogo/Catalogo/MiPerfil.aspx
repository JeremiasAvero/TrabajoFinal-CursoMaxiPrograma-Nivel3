<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Catalogo.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="perfil-titulo">
        <hr />
        <h1>Mi Perfil</h1>
        <hr />
    </div>
    <div class="perfil-container">

        <div class="perfil-col-1">
            <div class="perfil-component">
                <asp:Label Text="Nombre" ID="lblNombre" CssClass="perfil-label" runat="server" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="perfil-text form-control" />
                <asp:RequiredFieldValidator ErrorMessage="Este campo está vacío" ControlToValidate="txtNombre" runat="server" />
                <asp:RegularExpressionValidator runat="server" CssClass="error-message" ErrorMessage="Introduce un nombre válido" ControlToValidate="txtNombre" ValidationExpression="[a-zA-Z ]{2,40}"></asp:RegularExpressionValidator>
            </div>
            <div class="perfil-component">
                <asp:Label Text="Apellido" ID="lblApellido" CssClass="perfil-label" runat="server" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="perfil-text form-control" />
                <asp:RequiredFieldValidator ErrorMessage="Este campo está vacío" ControlToValidate="txtApellido" runat="server" />
                <asp:RegularExpressionValidator runat="server" CssClass="error-message" ErrorMessage="Introduce un nombre válido" ControlToValidate="txtApellido" ValidationExpression="[a-zA-Z ]{2,40}"></asp:RegularExpressionValidator>

            </div>
            <div class="perfil-component">
                <asp:Label Text="Email" ID="lblEmail" runat="server" CssClass="perfil-label" />
                <asp:TextBox runat="server" ReadOnly="true" ID="txtEmail" CssClass="perfil-text form-control" />
                <asp:RequiredFieldValidator ErrorMessage="Este campo está vacío" ControlToValidate="txtEmail" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Formato email por favor" CssClass="error-message" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>

        </div>

        <div class="perfil-col-2">
            <div class="perfil-component">
                <asp:Label Text="Imagen de perfil" ID="lblImagenPerfil" CssClass="perfil-label" runat="server" />
                <input type="file" id="txtImagenUrl" runat="server" css="perfil-file form-control" />
                <asp:RegularExpressionValidator ErrorMessage="Fuera de rango" CssClass="error-message" ControlToValidate="txtImagenUrl" ValidationExpression="^[\s\S]{1,600}$" runat="server" />

            </div>
            <div class="perfil-image">
                <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" CssClass="img-fluid mb-3" ID="imgNuevoPerfil" runat="server" />
            </div>
            <div class="perfil-component">
                <asp:Button Text="Cerrar sesión" ID="btnCerrarSesion" CssClass="btn btn-primary" OnClick="btnCerrarSesion_Click" runat="server" />
            </div>
        </div>


    </div>
    <div class="perfil-row">
        <div class="perfil-component">
            <a class="btn btn-primary" href="Favoritos.aspx">Mis favoritos</a>
        </div>
        <div class="perfil-component">
            <asp:Button Text="Guardar" OnClick="btnGuardar_Click" class="btn btn-primary" ID="btnGuardar" runat="server" />
        </div>
        <div class="perfil-component">
            <a class="btn btn-primary" href="Default.aspx">Volver</a>
        </div>
    </div>

</asp:Content>
