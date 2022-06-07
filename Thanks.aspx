<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="Thanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <table class="table" align="center">
        <tr>
            <td style="height:350px; vertical-align:middle; text-align:center;">
                <img src="img2/gracias-03.png"/>
            </td>            
        </tr>
        <tr>
            <td>
                <table align="center">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Blade.aspx" ImageUrl="~/img2/mailbtn01.png" Height="80px"/></td>
                        <td style="width:50px"></td>
                        <td><asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/Catalog.aspx" ImageUrl="~/img2/mailbtn02.png" Height="80px"/></td>
                        <td style="width:50px"></td>
                        <td><asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/Experience.aspx" ImageUrl="~/img2/mailbtn03.png" Height="80px"/></td>
                        <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/mailbtn06.png" Height="80px" OnClick="ImageButton4_Click" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

