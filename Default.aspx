<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>..:: Reconocimientos Milenio ::..</title>
    <style type="text/css">
        .style1 { font-size: x-large; color: #CCCCCC; }
        .bLogin { background-image:url("img/Blades-24.png");
                  background-size:cover;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <div align="center" style="width: 100%; height: 100%">

            <table>
                <tr>
                    <td>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="center" style="width: 1067px; height: 372px; background-image: url('./img2/acceso-01.png'); background-size: cover;">
                        <table>
                            <tr>
                                <td style="width:650px;">&nbsp;</td>
                                <td>
                                    <table width="40%" border="0" cellpadding="0" cellspacing="0">
                                        
                                        
                                        <tr><td>&nbsp;</td></tr>
                                        
                                        <tr>
                                            <td>
                                                <telerik:RadTextBox ID="txbLogin" runat="server" Skin="MetroTouch"></telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>
                                                <telerik:RadTextBox ID="txbPass" runat="server" TextMode="Password" Skin="MetroTouch"></telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    
                                                    
                                                    <tr>
                                                        <td>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img2/btn_Login.png" Width="175px" OnClick="btnOK_Click" />
                                                            </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="FooterZone" align="center">
                        <asp:Label ID="lblNoUserIntranet" runat="server" Style="font-family: Arial; font-size: x-small; color: Red" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
