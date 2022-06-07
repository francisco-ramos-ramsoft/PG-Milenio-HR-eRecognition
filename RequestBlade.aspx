<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RequestBlade.aspx.cs" Inherits="RequestBlade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 { text-align: right; color: #006699; font-family: tahoma; }
        .auto-style3 { height: 166px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table align="center" width="1150px">
        <tr>
            <td style="height: 7%" colspan="2">
                <img alt="" src="img2/img-02.png" height="80px" />
            </td>
        </tr>
        <tr>
            <td>
                <div class="infoPaneBg" runat="server" id="detailsPanel" align="center">
                    <table>
                        <tr>
                            <td colspan="2" class="table_tittle" style="font-size: small">
                                <img src="img2/rec02.png" style="height: 45px" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Tipo</td>
                            <td class="auto-style2">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem>Individual</asp:ListItem>
                                    <asp:ListItem>Masivo</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Para</td>
                            <td style="width: 240px; text-align: center;">
                                <telerik:RadComboBox ID="cbbEmploye" runat="server" Width="300px" OnTextChanged="cbbRecs_TextChanged" Skin="MetroTouch"
                                    EmptyMessage="Selecciona un Empleado" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsEmploye" DataTextField="Name" DataValueField="ID">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsEmploye" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SelectUsers" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="id" SessionField="UserID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" EmptyMessage="# Personas" MaxValue="100" MinValue="1" ShowSpinButtons="True" Skin="MetroTouch" Visible="False">
                                    <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                </telerik:RadNumericTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Roca</td>
                            <td style="width: 240px; text-align: right;">
                                <telerik:RadComboBox ID="cbbRock" runat="server" Width="300px" OnTextChanged="cbbRecs_TextChanged" Skin="MetroTouch"
                                    EmptyMessage="Selecciona una Roca" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsRocks" DataTextField="Name" DataValueField="ID">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsRocks" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [Name], [ID] FROM [Rocks]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" rowspan="2" style="vertical-align: top;">Motivo</td>
                            <td style="width: 240px; text-align: right;">
                                <telerik:RadComboBox ID="cbbReason" runat="server" Width="300px" OnTextChanged="cbbRecs_TextChanged" Skin="MetroTouch"
                                    EmptyMessage="Selecciona un Motivo" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsReasons" DataTextField="Descrip" DataValueField="ID">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsReasons" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Descrip] FROM [Reasons] WHERE ([RockID] = @RockID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cbbRock" Name="RockID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="txbReason" runat="server" TextMode="MultiLine" Width="300px" EmptyMessage="Motivo Especifico" Height="75px" Skin="Metro"></telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Reconocimiento</td>
                            <td style="width: 240px; text-align: right;">
                                <telerik:RadComboBox ID="cbbRecs" runat="server" Width="300px" OnTextChanged="cbbRecs_TextChanged" Skin="MetroTouch"
                                    EmptyMessage="Selecciona una Blade" HighlightTemplatedItems="True" Filter="Contains" AutoPostBack="True" DataSourceID="dsRecs" DataTextField="Name" DataValueField="ID">
                                </telerik:RadComboBox>
                                <asp:SqlDataSource ID="dsRecs" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name] FROM [Recognitions] WHERE [Enabled]=1 and Value>0"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center">
                                <telerik:RadButton RenderMode="Lightweight" Skin="MetroTouch" ID="btnGenerate" runat="server" Enabled="false" Width="185px" Height="40px" OnClick="btnGenerate_Click">
                                    <Image ImageUrl="img2/btn_Blade02.png" />
                                </telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

