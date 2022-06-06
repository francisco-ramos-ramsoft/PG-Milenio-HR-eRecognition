<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tips.aspx.cs" Inherits="Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img2/titulo04.png" Height="85px"/>
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
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img2/btn_Tips01.png" Height="38px" OnClick="ImageButton1_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img2/btn_Tips02.png" Height="38px" OnClick="ImageButton2_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/img2/btn_Tips03.png" Height="38px" OnClick="ImageButton3_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/btn_Tips04.png" Height="38px" OnClick="ImageButton4_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/img2/btn_Tips05.png" Height="38px" OnClick="ImageButton5_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/img2/btn_Tips06.png" Height="38px" OnClick="ImageButton6_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/img2/btn_Tips07.png" Height="38px" OnClick="ImageButton7_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/img2/btn_Tips08.png" Height="38px" OnClick="ImageButton8_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/img2/btn_Tips09.png" Height="38px" OnClick="ImageButton9_Click" CssClass="btnInfo"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="text-align:center">
                            <asp:Image ID="imagePreview" runat="server" ImageUrl="img2/Tip01.png" Height="400px"
                                Width="850px" BorderWidth="0"></asp:Image>
                            <asp:ImageButton ID="ImageButton10" visible="false" runat="server" ImageUrl="~/img2/btn_Tips10.png" Height="38px" PostBackUrl="http://communities.pg.com/cm/DI/_layouts/WordViewer.aspx?id=/cm/DI/Documents/How%2520to%2520Get%2520Involved%2520toolkits/EMOT%2520Box%2520Toolkit.docx&DefaultItemOpen=1"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

