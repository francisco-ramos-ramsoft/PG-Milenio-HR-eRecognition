<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 { text-align: right; width: 160px; color: #006699; }
        .auto-style3 { font-size: small; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <table style="font-family: tahoma" align="center">
        <tr>
            <td colspan="2" style="color: #FFFFFF; font-weight: 700; background-color: #006699">
                Mi Perfil
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                Nombre:
            </td>
            <td>
                <asp:Label ID="lblName" runat="server" Width="400px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                #Empleado:
            </td>
            <td>
                <asp:Label ID="lblNumEmp" runat="server" Width="400px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Area:
            </td>
            <td>
                <asp:Label ID="lblArea" runat="server" Width="400px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Líder:
            </td>
            <td>
                <asp:Label ID="lblLeader" runat="server" Width="400px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Correo Personal*:
            </td>
            <td>
                <telerik:RadTextBox ID="txbMail" runat="server" Width="400px"></telerik:RadTextBox>
                <asp:HiddenField ID="hfUserMail" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; " class="auto-style3">
                *Si no tienes correo P&G, por favor ingresa un correo externo para que recibas las notificaciones de tus reconocimientos.<br />
                Puede ser gmail, hotmail, yahoo, etc.
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <telerik:RadButton ID="btnUpdMail" runat="server" Text="Actualizar" Skin="MetroTouch" OnClick="btnUpdMail_Click"></telerik:RadButton>
            </td>
        </tr>
    </table>
</asp:Content>

