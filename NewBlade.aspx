<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewBlade.aspx.cs" Inherits="NewBlade" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=6.2.12.1017, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table style="width: 1100px; height: 400px;" class="table">
        <tr>
            <td style="vertical-align: middle; height: 300px;">
                <table align="center">
                    <tr>
                        <td>
                            <div id="Print" style="width: 561px; height: 295px;" align="center">
                                <span style="position: absolute; z-index: -1895825408;">
                                    <asp:Image ID="imagePreview" runat="server" ImageUrl="images/Recs/spacer.gif" Height="295px"
                                        Width="561px" AlternateText="preview" BorderWidth="0"></asp:Image>
                                </span>
                                <table style="width: 561px; height: 295px;" align="center">
                                    <tr>
                                        <td style="width: 90px"></td>
                                        <td style="height: 175px; vertical-align:bottom;">
                                            <table>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="Label1" runat="server" Text="" style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr><td>&nbsp;</td></tr>
                                                <tr>
                                                    <td style="width:50px">
                                                        <asp:Label ID="TextLabel1" Text="De" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="" Width="300px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:50px">
                                                        <asp:Label ID="TextLabel2" Text="Por" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="" Width="300px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="font-size:small;">
                                                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="height: 100px; font-size:small">
                                            <table>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; vertical-align:bottom; height:22px">
                                                        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; vertical-align:bottom; height:19px">
                                                        <asp:Label ID="lblGive" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px; text-align: center; vertical-align:bottom; height:19px">
                                                        <asp:Label ID="lblReason" runat="server" Text=""></asp:Label></td>
                                                    <td style="width: 40px"></td>
                                                    <td style="width: 100px; text-align: center; vertical-align:bottom; height:19px">
                                                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="NoPrint">
                    <table align="center">
                        <tr>
                            <td style="text-align: center">
                                <table>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <telerik:RadButton ID="btnPrint" runat="server" Text="Imprimir" OnClick="btnPrint_Click" Skin="MetroTouch"></telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 50px"></td>
                            <td style="text-align: center">
                                <table>
                                    <tr>
                                        <td>Correo Usuario:
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txbMail" runat="server" Skin="Metro"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
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

