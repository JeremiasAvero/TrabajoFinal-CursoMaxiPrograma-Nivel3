<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="Catalogo.ArticulosForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="articulos-h1">
        <h1>Articulos</h1>
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="articulos-container">
                <div class="articulos-filtro">
                    <div class="articulos-filtro-normal">
                        <asp:TextBox runat="server" placeholder="Buscar..." CssClass="form-control" ID="txtFiltro" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
                    </div>
                    <div class="articulos-filtro-avanzado">
                        <div class="articulos-filtro-avanzado-chk">
                            <asp:CheckBox Text="Filtro Avanzado" runat="server" ID="chkFiltroAvanzado" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" />

                        </div>
                        <%if (FiltroAvanzado)
                            {  %>
                        <div class="row">
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Campo" runat="server" />
                                    <asp:DropDownList ID="ddlCampo" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                        <asp:ListItem Text="Nombre" />
                                        <asp:ListItem Text="Codigo" />
                                        <asp:ListItem Text="Precio" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Criterio" runat="server" />
                                    <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Filtro" runat="server" />
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtfiltroAvanzado" />

                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Estado" ID="lblEstado" runat="server" />
                                    <asp:TextBox runat="server" ID="txtEstado" CssClass="form-control" />
                                </div>

                            </div>

                            <div class="col-3">
                                <asp:Button Text="Filtrar" ID="btnFiltroAvanzado" runat="server" OnClick="btnFiltroAvanzado_Click" />
                            </div>

                        </div>
                        <%} %>
                    </div>

                </div>
                <div class="articulos-lista">
                        <asp:GridView runat="server" ID="dgvArticulos" DataKeyNames="id" CssClass="table table-dark" AutoGenerateColumns="false"
                            OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" OnPageIndexChanging="dgvArticulos_PageIndexChanging"
                            AllowPaging="true" PageSize="7">

                            <Columns>
                                <asp:BoundField HeaderText="Codigo" DataField="CodigoArticulo" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                                <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
                                <asp:BoundField HeaderText="Precio" DataField="Precio" />
                                <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="Editar" />
                            </Columns>
                        </asp:GridView>

                        <a href="AltaArticulos.aspx" class="btn btn-primary">Agregar</a>
                </div>
            </div>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
