<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SendRecMail.aspx.cs" Inherits="SendRecMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <table class="table" align="center">
        <tr>
            <td style="height:350px; vertical-align:middle; text-align:center;">
                <img src="img2/gracias-05.png"/>
            </td>            
        </tr>
        <tr>
            <td>
                <table align="center">
                    <tr>
                        <td><asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Main.aspx" ImageUrl="~/img2/mailbtn04.png" Height="80px"/></td>
                        <td style="width:50px"></td>
                        <td><asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/Blade.aspx" ImageUrl="~/img2/mailbtn01.png" Height="80px"/></td>
                        
                        <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/mailbtn06.png" Height="80px" OnClick="ImageButton4_Click" /></td>

                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

