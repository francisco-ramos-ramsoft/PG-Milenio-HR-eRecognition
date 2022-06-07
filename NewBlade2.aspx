<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="NewBlade2.aspx.cs" Inherits="NewBlade2" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=6.2.12.1017, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 { text-align: left; font-weight: bold; }
        .auto-style3 { text-align: center; }
    .auto-style4 { width: 104px; }
    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table style="" class="table">
        <tr>
            <td>
                <div id="Print" style="text-align: center" align="center">
                    <img alt="" src="http://mil-web002.na.pg.com/rh_rec/img2/mailbkg2.png" height="160px" />
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Image ID="imagePreview" runat="server" ImageUrl="images/Recs/spacer.gif" Height="160px"
                                    Width="300px" AlternateText="preview" BorderWidth="0"></asp:Image>
                            </td>
                            <td>
                                <table style="" align="center">
                                    <tr>
                                        <td style="font-size: small">
                                            <table>
                                                <tr>
                                                    <td colspan="2" style="background-color: #006699"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="auto-style3">
                                                        <asp:Label ID="lblRecDescrip" runat="server" Text="" Style="font-weight: 700; color: #006699; font-size: medium"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="auto-style3">
                                                        <asp:Label ID="lblRecValue" runat="server" Text="" Style="font-weight: 700; color: #006699; font-size: small"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="background-color: #006699"></td>
                                                </tr>
                                                <tr>
                                                    <td class="RadInputRTL">Folio:
                                                    </td>
                                                    <td style="" class="auto-style2">
                                                        <asp:Label ID="lblFolio" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="RadInputRTL">Para:
                                                    </td>
                                                    <td style="" class="auto-style2">
                                                        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="RadInputRTL">De:</td>
                                                    <td style="" class="auto-style2">
                                                        <asp:Label ID="lblGive" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="RadInputRTL">Estrategia:</td>
                                                    <td style="width: 300px;" class="auto-style2">
                                                        <asp:Label ID="lblEstrat" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="RadInputRTL">Motivo:</td>
                                                    <td style="width: 300px;" class="auto-style2">
                                                        <asp:Label ID="lblcomment" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="RadInputRTL">Fecha:</td>
                                                    <td style="width: 300px;" class="auto-style2">
                                                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="background-color: #006699"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="NoPrint">
                    <table align="center" class="table">
                        <tr>
                            <td style="color: #800000; text-align: center; font-weight: 700;" colspan="3">
                                Este Reconocimiento ya fue enviado por correo.
                            </td>
                        </tr>
                        <tr>
                            <td>Puedes imprimirlo</td>
                            <td class="auto-style4"></td>
                            <td  style="text-align: center">
                                o si lo deseas mandar a otro correo, escribelo aquí:
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <telerik:RadButton ID="btnPrint" runat="server" Text="Imprimir" OnClick="btnPrint_Click" Skin="MetroTouch"></telerik:RadButton>
                            </td>
                            <td class="auto-style4"></td>
                            <td style="text-align: center">
                                <table>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <telerik:RadTextBox ID="txbMail" runat="server" AutoPostBack="true" Skin="Metro" Width="202px"></telerik:RadTextBox>
                                        </td>
                                        <td></td>
                                        <td style="text-align: right;">
                                            <telerik:RadButton ID="btnSend" runat="server" Text="Enviar por correo" OnClick="btnSend_Click" Skin="MetroTouch"></telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="NoPrint2">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Blade.aspx" ImageUrl="~/img2/mailbtn01.png" Height="80px" /></td>
                            <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/Catalog.aspx" ImageUrl="~/img2/mailbtn02.png" Height="80px" /></td>
                            <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/Experience.aspx" ImageUrl="~/img2/mailbtn03.png" Height="80px" /></td>
                            <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/mailbtn06.png" Height="80px" OnClick="ImageButton4_Click" /></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfUserMail" runat="server" />
    <asp:HiddenField ID="hfGiveMail" runat="server" />
</asp:Content>

