<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img2/cc01.png"/>
    <br />
    <table align="center" class="table">
        <tr>
            <td>
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="imagePreview" runat="server" ImageUrl="images/Recs/spacer.gif" AlternateText="preview" BorderWidth="0"></asp:Image>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Artículo:
                        </td>
                        <td>
                            <asp:Label ID="lblGift" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Descripción:
                        </td>
                        <td>
                            <asp:Label ID="lblDescrip" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Puntos:
                        </td>
                        <td>
                            <asp:Label ID="lblValue" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:50px">
                
            </td>
            <td>
               <table>
                   <tr>
                       <td>
                           <asp:Label ID="lblPoints" runat="server" Text=""></asp:Label>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <asp:ImageButton ID="btnRequest" runat="server" Height="40px" ImageUrl="~/img2/btn_Master03.png" OnClick="btnRequest_Click" />
                       </td>
                   </tr>
               </table> 
            </td>
        </tr>
    </table>
</asp:Content>

