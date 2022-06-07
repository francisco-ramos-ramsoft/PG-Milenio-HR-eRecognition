<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Survey.aspx.cs" Inherits="Survey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style12 { border-style: solid; width: 135px; font-size: small; border-width: 0.5px; border-color: lightgray; }
        .auto-style13 { border-style: solid; width: 105px; font-size: small; border-width: 0.5px; border-color: lightgray; }
        .auto-style30 { font-size: x-small; }
        .auto-style32 { border-style: solid; width: 215px; font-size: small; border-width: 0.5px; border-color: lightgray; }
        .auto-style1 { height: 520px; width: 1150px; font-family: 'Tahoma'; font-size: large; color: #4D4D4D; }
        .auto-style34 { width: 450px; vertical-align:top; }
        .auto-style36 { color: #0099CC; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style34">
                <table>
                    <tr>
                        <td colspan="2"><span class="auto-style36">1.</span> Tu líder te asigno la Blade de manera oportuna?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem>Si</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="RadTextBox1" runat="server" Skin="MetroTouch" EmptyMessage="Por qué?" Enabled="false"></telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><span class="auto-style36">2.</span> La comprobación de la Blade en Intranet te pareció amigable?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged1">
                                <asp:ListItem>Si</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="RadTextBox2" runat="server" Skin="MetroTouch" EmptyMessage="Por qué?" Enabled="false"></telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><span class="auto-style36">3.</span> Consideras que debemos cambiar por completo al modelo de Blades virtuales y eliminar así la necesidad de usar papel impreso?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged1">
                                <asp:ListItem>Si</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="RadTextBox3" runat="server" Skin="MetroTouch" EmptyMessage="Por qué?" Enabled="false"></telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="auto-style34">
                <table>
                    <tr>
                        <td>
                            <span class="auto-style36">4.</span> Cómo evaluas el proceso de canje de Blades en Fastenal? 
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                                        <telerik:RadTextBox ID="RadTextBox4" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
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
                                        <telerik:RadTextBox ID="RadTextBox5" runat="server" Enabled="false" EmptyMessage="Por qué?" Width="100px"></telerik:RadTextBox>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <span class="auto-style36">5.</span> Qué cambios o ajustes sugieres para mejorar el proceso de entrega y canje de blades:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadTextBox ID="RadTextBox6" runat="server" EmptyMessage="Escribe aqui tus comentarios" Width="400px" TextMode="MultiLine" Height="70px"></telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right;">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img2/centro de canje-03.png" Height="40px" OnClick="ImageButton1_Click" Enabled="False" />
            </td>
        </tr>
    </table>
</asp:Content>

