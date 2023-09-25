<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuRegistrarse.aspx.cs" Inherits="Catalogo.MenuRegistrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registro-container">
        <div class="registro-column">
            <div class="registro-text">
                <asp:Label Text="Nombre" runat="server" CssClass="form-label" ID="lblNombre" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="registro-text">
                <asp:Label Text="Apellido" runat="server" CssClass="form-label" ID="lblApellido" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
            </div>
            <div class="registro-text">
                <asp:Label Text="Email" runat="server" CssClass="form-label" ID="lblEmail" />
                <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control" />
            </div>
            <div class="registro-text">
                <asp:Label Text="Contraseña" runat="server" CssClass="form-label" ID="lblPass" />
                <asp:TextBox runat="server" TextMode="Password" ID="txtPass" CssClass="form-control" />
            </div>
            <div class="registro-botones">
                <asp:Button Text="Registrarse" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" CssClass="boton-registrarse btn btn-primary" runat="server" />
                <button class="boton-registrarse btn btn-primary"><a href="MenuLogin.aspx">Ingresar</a></button>
            </div>
        </div>
        <div class="registro-column">
            
            <div class="registro-image">
                <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" CssClass="img-fluid mb-3" ID="imgUrl" runat="server" />
            </div>
            <div class="registro-text-img">
                <asp:Label Text="Imagen de perfil" ID="lblImagenPerfil" CssClass="registro-label" runat="server" />
                <div class="registro-input">
                    <input type="file" id="txtImagenUrl" class="registro-input" runat="server" />

                </div>
            </div>
        </div>


    </div>
</asp:Content>
