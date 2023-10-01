<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="MenuRegistrarse.aspx.cs" Inherits="Catalogo.MenuRegistrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registro-container">
        <div class="registro-column">
            <div class="registro-text">
                <asp:Label Text="Nombre" runat="server" CssClass="form-label" ID="lblNombre" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" CssClass="error-message" ErrorMessage="No has ingresado un nombre"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Introduce un nombre válido" CssClass="error-message" ControlToValidate="txtNombre" ValidationExpression="[a-zA-Z ]{2,40}"></asp:RegularExpressionValidator>

            </div>
            <div class="registro-text">
                <asp:Label Text="Apellido" runat="server" CssClass="form-label" ID="lblApellido" />
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" CssClass="error-message" ErrorMessage="No has ingresado un apellido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Introduce un apellido válido" CssClass="error-message" ControlToValidate="txtApellido" ValidationExpression="[a-zA-Z ]{2,40}"></asp:RegularExpressionValidator>
            </div>
            <div class="registro-text">
                <asp:Label Text="Email" runat="server" CssClass="form-label" ID="lblEmail" />
                <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="error-message" ErrorMessage="No has ingresado una dirección de correo"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ErrorMessage="Formato email por favor" ControlToValidate="txtEmail" CssClass="error-message" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />

            </div>
            <div class="registro-text">
                <asp:Label Text="Contraseña" runat="server" CssClass="form-label" ID="lblPass" />
                <asp:TextBox runat="server" TextMode="Password" ID="txtPass" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" CssClass="error-message" ErrorMessage="No has ingresado una contraseña"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Introduce un contraseña de 4-19 carácteres" ControlToValidate="txtPass" CssClass="error-message" ValidationExpression="^.{4,19}$"></asp:RegularExpressionValidator>

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
                    <input type="file" id="txtImagenUrl" class="registro-input form-control" runat="server" />

                </div>
            </div>
        </div>


    </div>
</asp:Content>
