<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experience.aspx.cs" Inherits="Experience" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <table class="table" align="center" style="width:1100px">
        <tr>
            <td style="height: 7%" colspan="3">
                
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
            <td style="align-content:center; text-align:center">
                <table align="center">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Survey.aspx" ImageUrl="~/img2/btn_submenu encuesta-01.png" Height="320px"/>
                        </td>
                        <td style="width:100px">

                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/UploadPhoto.aspx" ImageUrl="~/img2/btn_submenu encuesta-02.png" Height="320px"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

