<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuRegistrarse.aspx.cs" Inherits="Catalogo.MenuRegistrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-4">
             <div class="mb-3">
                <asp:Label Text="Nombre" runat="server" CssClass="form-label" ID="lblNombre" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
             <div class="mb-3">
                <asp:Label Text="Apellido" runat="server" CssClass="form-label" ID="lblApellido" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Email" runat="server" CssClass="form-label" ID="lblEmail" />
                <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control" />
            </div>
             <div class="mb-3">
                <asp:Label Text="Contraseña" runat="server" CssClass="form-label" ID="lblPass" />
                <asp:TextBox runat="server" TextMode="Password" ID="txtPass" CssClass="form-control"/>
            </div>

            <asp:Button Text="Registrarse" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" CssClass="btn btn-secondary" runat="server" />
            <a href="Default.aspx" class="btn btn-secondary" >Volver</a>
        </div>
    </div>
</asp:Content>
