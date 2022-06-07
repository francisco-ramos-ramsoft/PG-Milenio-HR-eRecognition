<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" Runat="Server">
    <table class="table" align="center">
        <tr>
            <td style="height:350px; vertical-align:middle">
                <telerik:RadRotator RenderMode="Lightweight" runat="server" ID="rttBanners" ScrollDirection="Left" Skin="MetroTouch"
                        FrameDuration="1000" Width="1080px" Height="300px" ItemHeight="300px" DataSourceID="dsPhotos" PauseOnMouseOver="False">
                        <ItemTemplate>
                            <div>
                                <%--<a href='<%# DataBinder.Eval(Container.DataItem,"href") %>'>--%>
                                    <asp:Image ID="Image" runat="server"  ImageUrl='<%#Eval("ImageName", "~/images/Photos/{0}")%>' Height="300px"></asp:Image>
                                <%--</a>--%>
                            </div>
                        </ItemTemplate>
                        <ControlButtons LeftButtonID="img_left" RightButtonID="img_right"></ControlButtons>
                    </telerik:RadRotator>
                <asp:SqlDataSource ID="dsPhotos" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT * FROM Images"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsBanners" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT ID, FileName, href, Description, Active FROM Banners WHERE (Active = 1)"></asp:SqlDataSource>
            </td>
            <td style="vertical-align:top">
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/btn_Main01.png" Height="120px" PostBackUrl="~/UploadPhoto.aspx"/>
            </td>            
        </tr>
        <tr>
            <td colspan="2">
                <table align="center">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Blade.aspx" ImageUrl="~/img2/mailbtn01.png" Height="120px"/></td>
                        <td style="width:50px"></td>
                        <td><asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/Catalog.aspx" ImageUrl="~/img2/mailbtn02.png" Height="120px"/></td>
                        <td style="width:50px"></td>
                        <td><asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/Experience.aspx" ImageUrl="~/img2/mailbtn03.png" Height="120px"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

