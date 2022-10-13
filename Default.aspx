﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_umg_bd._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbl_carne" runat="server" CssClass="form-label" Text="Carne"></asp:Label>
    <asp:TextBox ID="txt_carne" runat="server" CssClass="form-control" placeholder="E001"></asp:TextBox>
    <asp:Label ID="lbl_nombres" runat="server" CssClass="form-label" Text="Nombres"></asp:Label>
    <asp:TextBox ID="txt_nombres" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_apellidos" runat="server" CssClass="form-label" Text="Apellidos"></asp:Label>
    <asp:TextBox ID="txt_apellidos" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_direccion" runat="server" CssClass="form-label" Text="Direccion"></asp:Label>
    <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_telefono" runat="server" CssClass="form-label" Text="Telefono"></asp:Label>
    <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    <asp:Label ID="lbl_correo" runat="server" CssClass="form-label" Text="Telefono"></asp:Label>
    <asp:TextBox ID="txt_correo" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
    <asp:Label ID="lbl_fn" runat="server" CssClass="form-label" Text="Fecha Nacimiento"></asp:Label>
    <asp:TextBox ID="txt_fn" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:Label ID="lbl_sangre" runat="server" CssClass="form-label" Text="Sangre"></asp:Label>
    <asp:DropDownList ID="drop_sangre" runat="server" CssClass="form-control"></asp:DropDownList>
    <asp:Button ID="btn_agregar" runat="server" Text="Agregar" CssClass="btn btn-info btn-lg" OnClick="btn_agregarE_Click" />
    <asp:Button ID="btn_modificar" runat="server" OnClick="btn_modificar_Click" Text="Modificar" CssClass="btn btn-success btn-lg"  Visible="False" />
    <asp:Label ID="lbl_mensaje" runat="server" CssClass="alert-info"></asp:Label>
    <asp:GridView ID="grid_estudiantes" runat="server" AutoGenerateColumns="False" CssClass="table table-dark table-hover" DataKeyNames="id,id_tipo_sangre" OnRowDeleting="grid_estudiantes_RowDeleting" OnSelectedIndexChanged="grid_estudiantes_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" Text="Ver" OnClick="Button2_Click" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-info"  />
                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClientClick="javascript:if(!confirm('¿Desea Eliminar?'))return false" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-danger" />
            </asp:TemplateField>
            <asp:BoundField DataField="carne" HeaderText="Carne" />
            <asp:BoundField DataField="nombres" HeaderText="Nombres" />
            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
            <asp:BoundField DataField="direccion" HeaderText="Direccion" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" />
            <asp:BoundField DataField="correo_electronico" HeaderText="Correo Electronico" />
            <asp:BoundField DataField="fecha_nacimiento" DataFormatString="{0:d}" HeaderText="Fecha Nacimiento" />
        </Columns>
    </asp:GridView>
</asp:Content>
