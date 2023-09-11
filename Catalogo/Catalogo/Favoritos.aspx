<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Catalogo.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>articulos favoritos</h1>
    <asp:Button Text="hola" ID="btnHola" CssClass="btn btn-primary" OnClick="btnHola_Click" runat="server" />
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
</asp:Content>

