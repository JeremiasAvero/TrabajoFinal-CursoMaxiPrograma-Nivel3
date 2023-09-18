<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuRegistrarse.aspx.cs" Inherits="Catalogo.MenuRegistrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">

             <div class="form-text" 
                <asp:Label Text="Nombre" runat="server" CssClass="form-label" ID="lblNombre" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"  />
            </div>
             <div class="form-text">
                <asp:Label Text="Apellido" runat="server" CssClass="form-label" ID="lblApellido" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control"   />
            </div>
            <div class="form-text">
                <asp:Label Text="Email" runat="server" CssClass="form-label" ID="lblEmail" />
                <asp:TextBox runat="server" TextMode="Email" ID="txtEmail"  CssClass="form-control"  />
            </div>
             <div class="form-text">
                <asp:Label Text="Contraseña" runat="server" CssClass="form-label" ID="lblPass" />
                <asp:TextBox runat="server" TextMode="Password" ID="txtPass" CssClass="form-control"  />
            </div>
        <div class="form-registrarse">
             <asp:Button Text="Registrarse" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" CssClass="boton-ingresar" runat="server" />
            <button class="boton-ingresar" ><a href="Default.aspx">Ingresar</a></button>
        </div>
           
    </div>
</asp:Content>
