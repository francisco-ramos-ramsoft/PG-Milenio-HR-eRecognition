<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeComplete2.aspx.cs" Inherits="ChangeComplete2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .etiqueta { width: 100px; text-align:right;}
        .campo { width: 300px; font-weight:bold; text-align:center; border:solid; border-width:0.5px }
        .espacio { width: 50px; }
    .RadButton_Default.rbSkinnedButton{background-image:url('mvwres://Telerik.Web.UI, Version=2012.3.1205.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png');color:#333}.RadButton_Default{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px}.rbSkinnedButton{padding-right:2px}.RadButton{cursor:pointer}.rbSkinnedButton{vertical-align:text-top}.rbSkinnedButton{vertical-align:top}.rbSkinnedButton{display:inline-block;position:relative;background-color:transparent;background-repeat:no-repeat;border:0 none;height:22px;text-align:center;text-decoration:none;white-space:nowrap;background-position:right 0;padding-right:4px;vertical-align:top}.RadButton{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.3.1205.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png');color:#333}.RadButton_Default .rbDecorated{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px}.rbDecorated{display:block;*display:inline;zoom:1;height:22px;padding-right:6px;*padding-right:8px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0;*line-height:22px}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <div id="Print">
        <table class="table">
            <tr>
                <td class="table_tittle">
                    Recibo de canje de puntos por artículos - Almacén Fastenal
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="etiqueta">
                                Folio:
                            </td>
                            <td class="campo">
                                <asp:Label ID="lblChangeID" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="espacio">
                                &nbsp;
                            </td>
                            <td class="etiqueta">
                                Fecha:
                            </td>
                            <td class="campo">
                                <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="etiqueta">
                                No SAP:
                            </td>
                            <td class="campo">
                                <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="espacio">
                                &nbsp;
                            </td>                            
                            <td class="etiqueta">
                                Artículo:
                            </td>
                            <td class="campo">
                                <asp:Label ID="lblGift" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="etiqueta">
                                Nombre:
                            </td>
                            <td class="campo">
                                <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="espacio">
                                &nbsp;
                            </td>
                            <td class="etiqueta">
                                Valor (Puntos):
                            </td>
                            <td class="campo">
                                <asp:Label ID="lblValue" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="table" align="center">
            <tr>
                <td style="height:100px; width:300px; border-bottom:solid; border-bottom-color:black; border-bottom-width:1px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align:center; font-size:small">
                    Firma del empleado
                </td>
            </tr>
        </table>
    </div>
    <div id="NoPrint">
        <table class="table" align="center">
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <telerik:RadButton ID="btnPrint" runat="server" Text="Imprimir" OnClick="btnPrint_Click" Font-Size="Medium" Font-Bold="true"></telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td>
                   &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Change.aspx" ImageUrl="~/img2/mailbtn05.png" Height="100px" /></td>
                <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/mailbtn06.png" Height="80px" OnClick="ImageButton4_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

