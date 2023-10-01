<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuLogin.aspx.cs" Inherits="Catalogo.MenuLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="login-container">

        <div class="login-text">
            <asp:Label Text="Dirección de Email" ID="lblEmail" runat="server" />
            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
            <asp:RequiredFieldValidator ErrorMessage="No has introducido un Email" CssClass="error-message" ControlToValidate="txtEmail" runat="server" />
            <asp:RegularExpressionValidator ErrorMessage="Formato email por favor" CssClass="error-message" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />

        </div>

        <div class="login-text">
            <asp:Label Text="Contraseña" ID="lblPassword" runat="server" />
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
            <asp:RequiredFieldValidator ErrorMessage="No has introducido una Contraseña" CssClass="error-message" ControlToValidate="txtPassword" runat="server" />
            <asp:RegularExpressionValidator runat="server" ErrorMessage="Introduce un contraseña de 4-19 carácteres" ControlToValidate="txtPassword" CssClass="error-message" ValidationExpression="^.{4,19}$"></asp:RegularExpressionValidator>

        </div>
        <div class="login-ingresar">
            <asp:Button runat="server" ID="btnIngresar" CssClass="boton-ingresar btn btn-primary" OnClick="btnIngresar_Click" Text="Ingresar" />
            <button class="boton-ingresar btn btn-primary"><a href="MenuRegistrarse.aspx">Crear Cuenta</a></button>
        </div>

    </div>

</asp:Content>
