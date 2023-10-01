<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="AltaArticulos.aspx.cs" Inherits="Catalogo.AltaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="alta-art-container">
        <div class="alta-art-col-1">
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" type="hidden" />
            <div class="mb-3">
                <asp:Label ID="lblCodigo" runat="server" CssClass="form-label" Text="Codigo"></asp:Label>
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCodigo" CssClass="error-message" ErrorMessage="No has ingresado un Código"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto..." ControlToValidate="txtCodigo" ValidationExpression="^.{1,6}$" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblNombre" runat="server" CssClass="form-label" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre" CssClass="error-message" ErrorMessage="No has ingresado un Nombre"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto..." ControlToValidate="txtNombre" ValidationExpression="^.{1,35}$" runat="server" />

            </div>
            <div class="mb-3">
                <asp:Label ID="lblDescripcion" runat="server" CssClass="form-label" Text="Descripción"></asp:Label>
                <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescripcion" CssClass="error-message" ErrorMessage="No has ingresado una Descripcion"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto..." ControlToValidate="txtDescripcion" ValidationExpression="^[\s\S]{1,300}$" runat="server" />

            </div>
            <div class="mb-3">
                <asp:Label ID="lblMarca" runat="server" CssClass="form-label" Text="Marca"></asp:Label>
                <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>

            </div>
            <div class="mb-3">
                <asp:Label ID="lblCategoria" runat="server" CssClass="form-label" Text="Categoria"></asp:Label>
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPrecio" runat="server" CssClass="form-label" Text="Precio"></asp:Label>
                <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrecio" CssClass="error-message" ErrorMessage="No has ingresado un Código"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d{1,13}(,\d{1,4})?$" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtPrecio"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="alta-art-col-2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="alta-art-img-col">
                        <asp:Label ID="lblImagenUrl" runat="server" CssClass="form-label" Text="Url de Imagen"></asp:Label>
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" OnTextChanged="txtImagenUrl_TextChanged" AutoPostBack="true" />
                    </div>

                    <asp:Image ImageUrl="https://th.bing.com/th/id/OIP.FjLkalx51D8xJcpixUGJywHaE8?pid=ImgDet&rs=1l" runat="server" CssClass="art-image" ID="imgImagenUrl" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    </div>
    <div class="alta-art-row">
        <% if (Admin)
            {
        %>
        <div class="alta-row-col">
            <div class="mb-3">
                <asp:Button ID="btnAgregar" class="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
            </div>
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="alta-row-col">
                    <div class="mb-3">
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                    </div>
                </div>
                <%if (ConfirmarEliminacion)
                    { %>
                <div class="mb-3">
                    <asp:CheckBox Text="Confirmar eliminación" ID="chkConfirmarEliminar" runat="server" />
                    <asp:Button Text="Eliminar" ID="btnconfirmarEliminar" CssClass="btn btn-danger" runat="server" OnClick="btnconfirmarEliminar_Click" />
                </div>
                <%} %>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%
            } %>


        <div class="alta-row-col">
            <div class="mb-3">
                <a href="ListaArticulos.aspx" class="btn btn-primary">Volver</a>
            </div>
        </div>


    </div>


</asp:Content>
