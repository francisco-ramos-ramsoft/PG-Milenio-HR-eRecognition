<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change.aspx.cs" Inherits="Change" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 { width: 90px; }
        .auto-style2 { width: 300px; font-weight: bold; }
        .auto-style3 { width: 100px; height: 50px; background-repeat: no-repeat; }
    </style>
    <script type="text/javascript">
        function pageLoad() {
            confirmWindow = $find("<%=confirmWindow.ClientID %>");
            btnGenerate = $find("<%=btnGenerate.ClientID %>");
            btnYes = $find("<%=btnYes.ClientID%>");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">

    <table align="center" class="table">
        <tr>
            <td class="table_tittle" colspan="3">Canje de Artículos</td>
        </tr>
        <tr>
            <td class="table_tittle" style="font-size: small">Selecciona al empleado
            </td>
            <td class="table_tittle" style="font-size: small">Selecciona el artículo
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td class="table_content" style="vertical-align: top">
                <div class="infoPaneBg" runat="server" id="Div1">
                    <table>
                        <tr>
                            <td colspan="2">
                                <telerik:RadComboBox ID="cbbEmpl" runat="server" Width="300px" Height="300px" DataSourceID="dsEmpl" DataTextField="Name" DataValueField="ID" AutoPostBack="true"
                                    Filter="Contains" MarkFirstMatch="true" EmptyMessage="Selecciona un empleado" OnSelectedIndexChanged="cbbEmpl_SelectedIndexChanged" Skin="Metro">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsEmpl" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [NumEmp], [TNumber], [Name], [Mail], [ID] FROM [Users] WHERE ([ID] not in (1,2,3)) ORDER BY [Name], [Mail]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Sys" Name="Rol" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right" class="auto-style3">Mail:
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="lblMail" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right" class="auto-style3">NumEmpl:
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="lblNumEmp" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right" class="auto-style3">Puntos:
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="lblPoints" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top;">
                <div class="infoPaneBg" runat="server" id="Div2">
                    <table>
                        <tr>
                            <td colspan="2">
                                <telerik:RadComboBox ID="cbbGifts" runat="server" Width="300px" Height="300px" DataSourceID="dsGifts" DataTextField="Name" DataValueField="ID"
                                    Filter="Contains" MarkFirstMatch="true" EmptyMessage="Selecciona un obsequio" Skin="Metro" AutoPostBack="true" OnSelectedIndexChanged="cbbGifts_SelectedIndexChanged">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsGifts" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name], [Descrip], [Value] FROM [Gifts] Where [Active]=1 and [Type]='Fastenal'"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Descripción:
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="lblDescripp" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Existencias:
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="lblQty" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Valor:
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="lblCost" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:Image runat="server" ID="GiftPrev" ImageUrl="~/images/spacer.gif" Height="180px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="table_content">
                <telerik:RadButton ID="btnGenerate" runat="server" Text="Canjear" Skin="MetroTouch" Enabled="false" OnClick="btnChange_Click" OnClientClicking="CustomRadWindowConfirm" Font-Bold="true"></telerik:RadButton>
                <telerik:RadWindow RenderMode="Lightweight" ID="confirmWindow" runat="server" VisibleTitlebar="false" VisibleStatusbar="false"
                    Modal="true" Behaviors="None" Height="190px" Width="350px" Style="z-index: 100001;">
                    <ContentTemplate>
                        <table style="background-image: url(img/Blades-042.png); background-size: cover; width: 330px; height: 170px">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <telerik:RadButton RenderMode="Lightweight" Skin="MetroTouch" ID="btnYes" runat="server" Text="Si" AutoPostBack="false" OnClientClicked="YesOrNoClicked">
                                        <Icon PrimaryIconCssClass="rbOk"></Icon>
                                    </telerik:RadButton>
                                    <telerik:RadButton RenderMode="Lightweight" Skin="MetroTouch" ID="btnNo" runat="server" Text="No" AutoPostBack="false" OnClientClicked="YesOrNoClicked">
                                        <Icon PrimaryIconCssClass="rbCancel"></Icon>
                                    </telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </telerik:RadWindow>
            </td>
        </tr>
    </table>
</asp:Content>

