<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blade _Fastenal.aspx.cs" Inherits="Blade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function pageLoad() {
            confirmWindow = $find("<%=confirmWindow.ClientID %>");
            btnGenerate = $find("<%=btnGenerate.ClientID %>");
            btnYes = $find("<%=btnYes.ClientID%>");
        }
    </script>
    <script src="scripts.js" type="text/javascript"></script>
    <style type="text/css">
        .auto-style2 { width: 90px; height: 166px; }
        .auto-style3 { height: 166px; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentReports" runat="Server">
    
    <table class="table" align="center">
        <tr>
            <td style="height: 7%" colspan="2">                
                <img alt="" src="img2/img-02.png" height="80px" />
            </td>
        </tr>
        <tr>
            <td style="width: 70%; vertical-align: top" class="table_content">
                <table align="center">
                    <tr>                       
                        <td style="width: 50px"></td>
                        <td>
                            <div class="infoPaneBg" runat="server" id="detailsPanel" align="center">
                                <table>
                                    <tr>
                                        <td colspan="2" class="table_tittle" style="font-size: small">
                                            <img alt="" src="img2/rec02_02.png" height="45px" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="pnlRecs">
                                            <table>
                                                <tr>
                                                    <td style="text-align: right">Blade:</td>
                                                    <td style="width: 240px; text-align: right;">
                                                        <telerik:RadComboBox ID="cbbBlades" runat="server" Width="300px" Skin="MetroTouch"
                                                            EmptyMessage="Selecciona una Blade" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dstest" DataTextField="Name" DataValueField="ID" Height="250px"
                                                            OnTextChanged="cbbEmploye_TextChanged">
                                                        </telerik:RadComboBox>
                                                        <asp:SqlDataSource ID="dstest" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT id, Name FROM vRecs"></asp:SqlDataSource>                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">Para</td>
                                                    <td style="width: 240px; text-align: right;">
                                                        <telerik:RadComboBox ID="cbbEmploye" runat="server" Width="300px" OnTextChanged="cbbEmploye_TextChanged" Skin="MetroTouch"
                                                            EmptyMessage="Selecciona un Empleado" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsEmploye" DataTextField="Name" DataValueField="ID" Height="250px">
                                                        </telerik:RadComboBox>
                                                        <asp:SqlDataSource ID="dsEmploye" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SelectUsers" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="id" SessionField="UserID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>                                                
                                            </table>
                                            </div>
                                            <div id="pnlCong">

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadButton RenderMode="Lightweight" Skin="MetroTouch" ID="btnGenerate" runat="server" Enabled="false" Width="185px" Height="40px"
                                                OnClientClicking="CustomRadWindowConfirm" OnClick="Button_Click" Font-Bold="True">
                                                <Image ImageUrl="img2/btn_Blade01.png" />
                                            </telerik:RadButton>
                                           <%-- <asp:ImageButton ID="ImageButton1" runat="server" Width="185px" Height="40px" ImageUrl="img2/btn_Blade02.png" 
                                                OnClick="ImageButton1_Click" />--%>
                                            <telerik:RadWindow RenderMode="Lightweight" ID="confirmWindow" runat="server" VisibleTitlebar="false" VisibleStatusbar="false"
                                                Modal="true" Behaviors="None" Height="260px" Width="420px" Style="z-index: 100001;">
                                                <ContentTemplate>
                                                    <table style="background-image: url(img2/Botones-01.png); background-size: cover; width: 395px; height: 237px">
                                                        <tr>
                                                            <td class="auto-style2"></td>
                                                            <td style="text-align: center; vertical-align: bottom" class="auto-style3">
                                                                <telerik:RadButton RenderMode="Lightweight" Skin="MetroTouch" ID="btnYes" runat="server" Text="Si" AutoPostBack="false" OnClientClicked="YesOrNoClicked">
                                                                    <Icon PrimaryIconCssClass="rbOk"></Icon>
                                                                </telerik:RadButton>
                                                                <telerik:RadButton RenderMode="Lightweight" Skin="MetroTouch" ID="btnNo" runat="server" Text="No" AutoPostBack="false" OnClientClicked="YesOrNoClicked">
                                                                    <Icon PrimaryIconCssClass="rbCancel"></Icon>
                                                                </telerik:RadButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </telerik:RadWindow>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

