<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blade.aspx.cs" Inherits="Blade" %>

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
        .auto-style2 {
            width: 90px;
            height: 166px;
        }

        .auto-style3 {
            height: 166px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentReports" runat="Server">




    <table class="table" align="center">
        <tr>
            <td style="height: 7%" colspan="2">
                <img alt="" src="img2/Rec03.png" height="55px" class="zoom"/><br />
                <img alt="" src="img2/img-02.png" height="70px" />
            </td>
        </tr>
        <tr>
            <td style="width: 70%; vertical-align: top" class="table_content">
                <table align="center">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table align="center">
                                        <tr>
                                            <td class="table_tittle" style="font-size: small"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 175px; background-image: url(img2/rec01.png); background-size: cover; text-align: center;">
                                                <br />
                                                <table align="center" style="background-image: url(img2/Blades-092.png); background-size: cover;">
                                                    <tr>
                                                        <td style="height: 90px">
                                                            <telerik:RadRotator ID="rttBlades" RenderMode="Lightweight" runat="server" RotatorType="ButtonsOver"
                                                                Width="500px" Height="120px" ItemWidth="210px" FrameDuration="1000" BorderWidth="0"
                                                                OnItemClick="ShowImage" DataSourceID="dsRecsDisp">
                                                                <ItemTemplate>
                                                                    <asp:Image runat="server" ID="Image" Width="210px" Height="120px" ImageUrl='<%# Eval("ID", "~/Images/Recs/{0}.png") %>'
                                                                        ImageAlign="Middle"></asp:Image>
                                                                </ItemTemplate>
                                                                <ControlButtons LeftButtonID="img_left" RightButtonID="img_right"></ControlButtons>
                                                            </telerik:RadRotator>
                                                            <asp:SqlDataSource ID="dsRecsDisp" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="select * from vRecsDisp where Total>0 and UserID=@User">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="User" SessionField="UserID" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="infoPaneBg" runat="server" id="Div1">
                                                    <table align="center">
                                                        <tr>
                                                            <td style="text-align: center">
                                                                <asp:Image ID="imagePreview" runat="server" ImageUrl="images/spacer.gif" Height="164px"
                                                                    Width="240px" AlternateText="preview" BorderWidth="0" CssClass=""></asp:Image>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table_tittle">
                                                                <asp:Label ID="lblRecDescrip" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 50px"></td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="infoPaneBg" runat="server" id="detailsPanel" align="center">
                                        <table>
                                            <tr>
                                                <td class="table_tittle" style="font-size: small">
                                                    <img alt="" src="img2/rec02.png" height="45px" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="pnlRecs">
                                                        <table>
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
                                                            <tr>
                                                                <td style="text-align: right">Objetivo de Negocio</td>
                                                                <td style="width: 240px; text-align: right;">
                                                                    <telerik:RadComboBox ID="cbbRock" runat="server" Width="300px" OnTextChanged="cbbRock_TextChanged" Skin="MetroTouch"
                                                                        EmptyMessage="Selecciona un objetivo de Negocio" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsRocks" DataTextField="Name" DataValueField="ID" Height="150px">
                                                                    </telerik:RadComboBox>
                                                                    <asp:SqlDataSource ID="dsRocks" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [Name], [ID] FROM [Rocks]"></asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right">Detalle:</td>
                                                                <td style="width: 240px; text-align: right;">
                                                                    <telerik:RadComboBox ID="cbbReason" runat="server" Width="300px" OnTextChanged="cbbReason_TextChanged" Skin="MetroTouch"
                                                                        EmptyMessage="Selecciona un detalle" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsReasons" DataTextField="Descrip" DataValueField="ID" Height="150px">
                                                                    </telerik:RadComboBox>
                                                                    <asp:SqlDataSource ID="dsReasons" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Descrip] FROM [Reasons] WHERE ([RockID] = @RockID)">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="cbbRock" Name="RockID" PropertyName="SelectedValue" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right">Comentarios:</td>
                                                                <td>
                                                                    <telerik:RadTextBox ID="txbReason" EmptyMessage="Escribe los comentarios" runat="server" Skin="MetroTouch" Width="300px" Visible="True"></telerik:RadTextBox></td>
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
                                                        OnClientClicking="CustomRadWindowConfirm" OnClick="Button_Click" Font-Bold="True" CssClass="btnShadow">
                                                        <Image ImageUrl="img2/btn_Blade01.png"/>
                                                    </telerik:RadButton>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" Width="185px" Height="40px" ImageUrl="img2/btn_Blade02.png" PostBackUrl="~/RequestBlade.aspx" CssClass="btnShadow" />
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
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
