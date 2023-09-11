<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuLogin.aspx.cs" Inherits="Catalogo.MenuLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label Text="Usuario" ID="lblEmail" cssClass="form-label" runat="server" />
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Contraseña" ID="lblPassword" runat="server" cssClass="form-label" />
                <asp:TextBox runat="server" ID="txtPassword" textMode="Password" CssClass="form-control"/>
            </div>
            <asp:Button runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" cssClass="btn btn-secondary"  Text="Ingresar" />
            <a href="Default.aspx" class="btn btn-secondary" >Volver</a>
        </div>

    </div>





</asp:Content>
