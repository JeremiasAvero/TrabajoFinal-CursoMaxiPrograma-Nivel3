<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuLogin.aspx.cs" Inherits="Catalogo.MenuLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="login-container">

        <div class="login-text">
            <asp:Label Text="Usuario" ID="lblEmail" runat="server" />
            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
        </div>

        <div class="login-text">
            <asp:Label Text="Contraseña" ID="lblPassword" runat="server"  />
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
        </div>
        <div class="login-ingresar">
            <asp:Button runat="server" ID="btnIngresar" CssClass="boton-ingresar btn btn-primary" OnClick="btnIngresar_Click"  Text="Ingresar" />
            <button class="boton-ingresar btn btn-primary"><a href="MenuRegistrarse.aspx">Crear Cuenta</a></button>
        </div>

    </div>

</asp:Content>
