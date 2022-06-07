<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="JavaScript">

        function url(img) {

            hidden = open(img, 'NewWindow', 'width=850, height=450,status=no,resizable=yes,scrollbars=yes');

        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img2/titulo05.png" Height="100px" Window="90%" />

            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <table>

                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img2/btn_info01.png" Height="40px" OnClick="ImageButton1_Click" CssClass="btnInfo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img2/btn_info02.png" Height="40px" OnClick="ImageButton2_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/img2/btn_info03.png" Height="40px" Width="100%" OnClick="ImageButton3_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/btn_info04.png" Height="40px" Width="100%" OnClick="ImageButton4_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/img2/btn_info05.png" Height="40px" OnClick="ImageButton5_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/img2/btn_info09.png" Height="40px" OnClick="ImageButton9_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td>
                            <asp:Panel ID="pnlPreview" runat="server" Width="850px" Height="400px">
                                <asp:Image ID="imagePreview" runat="server" ImageUrl="img2/info01.png" Height="400px"
                                    Width="850px" BorderWidth="0"></asp:Image>
                            </asp:Panel>
                            <asp:Panel ID="panel1" runat="server" Visible="false" Height="400px" Width="850px" BorderWidth="0">
                                <table align="center">
                                    <tr>
                                        <td style="height: 380px; vertical-align: middle">
                                            <table align="center">
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/img2/btn_info06.png" Height="160px" CssClass="btnPDF"/>
                                                    </td>
                                                    <td style="width: 30px"></td>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/img2/btn_info07.png" Height="160px" Visible="false" CssClass="btnPDF"/>
                                                    </td>
                                                    <td style="width: 30px"></td>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/img2/btn_info08.png" Height="160px" CssClass="btnPDF"/>
                                                    </td>
                                                </tr>
                                            </table>
                                            <telerik:RadWindow ID="RadWindow1" runat="server" Height="450px" Width="900px">
                                                <ContentTemplate>
                                                    <asp:Image ID="image2" runat="server" ImageUrl="img2/info05_01.png" BorderWidth="0"></asp:Image>
                                                </ContentTemplate>
                                            </telerik:RadWindow>

                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="panel2" runat="server" Visible="false" Height="400px" Width="850px" BorderWidth="0">
                                <table align="center">
                                    <tr>
                                        <td style="height: 380px; vertical-align: middle">
                                            <table align="center">
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/img2/btn_info10.png" Height="160px" CssClass="btnPDF"/>
                                                    </td>
                                                    <td style="width: 30px"></td>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/img2/btn_info11.png" Height="160px" CssClass="btnPDF"/>
                                                    </td>
                                                    <td style="width: 30px"></td>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="~/img2/btn_info12.png" Height="160px" CssClass="btnPDF"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

