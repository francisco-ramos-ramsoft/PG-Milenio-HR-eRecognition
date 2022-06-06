<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Survey_.aspx.cs" Inherits="Survey_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style3 { width: 68pt; }
        .auto-style4 { width: 212pt; }
        .auto-style5 { height: 23pt; }
        .auto-style6 { }
        .auto-style7 { height: 32pt; }
        .auto-style8 { }
        .auto-style9 { height: 60.75pt; width: 44px; }
        .auto-style11 { width: 44px; }
        .auto-style12 { border-style: solid; width: 135px; font-size: small; border-width: 0.5px; border-color: lightgray; }
        .auto-style13 { border-style: solid; width: 105px; font-size: small; border-width: 0.5px; border-color: lightgray; }
        .auto-style18 { height: 38pt; }
        .auto-style19 { height: 150px; width: 70px; }
        .auto-style20 { height: 23.25pt; width: 70px; }
        .auto-style21 { height: 59pt; width: 70px; }
        .auto-style22 { height: 60.75pt; width: 70px; }
        .auto-style25 { height: 59pt; }
        .auto-style26 { height: 150px; width: 44px; }
        .auto-style27 { height: 23pt; width: 44px; }
        .auto-style28 { height: 32pt; width: 44px; }
        .auto-style29 { height: 38pt; width: 44px; }
        .auto-style30 { font-size: x-small; }
        .auto-style32 { border-style: solid; width: 215px; font-size: small; border-width: 0.5px; border-color: lightgray; }
        .auto-style33 { border-style: solid; font-size: small; border-width: 0.5px; border-color: lightgray; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    
        <table style="background-image: url(img2/Survey01.png); height: 520px; width: 1150px; font-family: 'Tahoma'; font-size: large; color: #4D4D4D">
            <tr>
                <td style="width: 50%; vertical-align: top; text-align: left">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col span="2" />
                            <col />
                        </colgroup>
                        <tr>
                            <td class="auto-style26"></td>
                            <td class="auto-style3" style="width: 90px"></td>
                            <td class="auto-style4" style="width: 325px"></td>
                        </tr>
                        <tr>
                            <td class="auto-style27"></td>
                            <td class="auto-style5" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem>Si</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="RadTextBox5" runat="server" Skin="MetroTouch" EmptyMessage="Por qué?"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28"></td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr height="81">
                            <td class="auto-style9" height="81"></td>
                            <td class="auto-style8" colspan="2">
                                <table>
                                    <tr class="auto-style33">
                                        <td class="auto-style12">Variedad</td>
                                        <td class="auto-style32">
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" Width="215px" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="Bueno" Text="Bueno"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Malo" Text="Malo"></asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="auto-style13">
                                            <telerik:RadTextBox ID="RadTextBox2" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style12">Costos (en Blades)</td>
                                        <td class="auto-style32">
                                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" Width="215px" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="Bueno" Text="Bueno"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Malo" Text="Malo"></asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="auto-style13">
                                            <telerik:RadTextBox ID="RadTextBox4" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style12">Calidad de Productos</td>
                                        <td class="auto-style32">
                                            <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" Width="215px" OnSelectedIndexChanged="RadioButtonList4_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="Bueno" Text="Bueno"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Malo" Text="Malo"></asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="auto-style13">
                                            <telerik:RadTextBox ID="RadTextBox6" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style12">Disponibilidad</td>
                                        <td class="auto-style32">
                                            <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal" Width="215px" OnSelectedIndexChanged="RadioButtonList5_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="Bueno" Text="Bueno"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Malo" Text="Malo"></asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="auto-style13">
                                            <telerik:RadTextBox ID="RadTextBox7" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style29"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style18"></td>
                        </tr>
                        <tr height="59">
                            <td class="auto-style11"></td>
                            <td class="auto-style8" colspan="2">
                                <table align="left" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="auto-style12">Atención</td>
                                        <td class="auto-style32">
                                            <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal" Width="215px" OnSelectedIndexChanged="RadioButtonList6_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="Bueno" Text="Bueno"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Malo" Text="Malo"></asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="auto-style13">
                                            <telerik:RadTextBox ID="RadTextBox8" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style12">Disponibilidad<br />
                                            <span class="auto-style30">(Disponibilidad de canje en cualquier turno y día)</span></td>
                                        <td class="auto-style32">
                                            <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal" Width="215px" OnSelectedIndexChanged="RadioButtonList7_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="Bueno" Text="Bueno"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Malo" Text="Malo"></asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="auto-style13">
                                            <telerik:RadTextBox ID="RadTextBox9" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 50%; vertical-align: top; text-align: left">
                    <table border="0" cellpadding="0" cellspacing="0">

                        <tr>
                            <td class="auto-style19"></td>
                            <td class="auto-style3" style="width: 90px"></td>
                            <td class="auto-style4" style="width: 325px"></td>
                        </tr>
                        <tr height="31">
                            <td class="auto-style20" height="31"></td>
                            <td class="auto-style6" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList8_SelectedIndexChanged">
                                                <asp:ListItem>Bueno</asp:ListItem>
                                                <asp:ListItem>Malo</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="RadTextBox1" runat="server" EmptyMessage="Por qué? Especificar" Enabled="False" Skin="MetroTouch"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21"></td>
                            <td class="auto-style25"></td>
                            <td class="auto-style25"></td>
                        </tr>
                        <tr height="81">
                            <td class="auto-style22" height="81"></td>
                            <td class="auto-style8" colspan="2">
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList9_SelectedIndexChanged">
                                                <asp:ListItem>No</asp:ListItem>
                                                <asp:ListItem>Si, proporciona los datos:</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nombre:
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cbbEmploye" runat="server" Width="250px" Skin="MetroTouch" Enabled="false"
                                                EmptyMessage="Selecciona un Empleado" HighlightTemplatedItems="True" Filter="Contains" DataSourceID="dsEmploye" DataTextField="Name" DataValueField="ID" Height="250px">
                                            </telerik:RadComboBox>
                                            <asp:SqlDataSource ID="dsEmploye" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SelectUsers" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="id" SessionField="UserID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Logro:
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="RadTextBox3" runat="server" Enabled="False" Skin="MetroTouch" Width="250px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Blade:
                                        </td>
                                        <td>
                                            <telerik:RadComboBox ID="cbbRecs" runat="server" Width="250px" Enabled="false"
                                                EmptyMessage="Blade Sugerida" HighlightTemplatedItems="True" Filter="Contains" DataSourceID="dsRecs" DataTextField="Name" DataValueField="ID" Skin="MetroTouch">
                                            </telerik:RadComboBox>
                                            <asp:SqlDataSource ID="dsRecs" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name] FROM [Recognitions] WHERE [Enabled]=1 and Value>0"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center;">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img2/centro de canje-03.png" Height="40px" OnClick="ImageButton1_Click" Enabled="False" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>

