<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table align="center" class="table">
        <tr>
            <td colspan="2">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img2/cc01.png" Height="148px" CssClass="zoom"/>
            </td>
        </tr>
        <tr>
            <td style="width: 200px">
                <table>
                    <tr>
                        <td colspan="2" style="color: #006699; font-weight: 700">Al día de hoy cuentas con los siguientes puntos:</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: 700;">Recibidos:</td>
                        <td style="width: 50px; text-align: center">
                            <asp:Label ID="lblRec" runat="server" Text="" Style="font-weight: 700; color: #006699;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: 700;">Canjeados:</td>
                        <td style="width: 50px; text-align: center">
                            <asp:Label ID="lblCan" runat="server" Text="" Style="font-weight: 700; color: #CC3300;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: 700;">Disponibles:</td>
                        <td style="width: 50px; text-align: center">
                            <asp:Label ID="lblDis" runat="server" Text="" Style="font-weight: 700; color: #006666;"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td style="height: 370px; width: 900px">
                <asp:Panel ID="Panel1" runat="server" Width="900px" Height="370px" ScrollBars="Vertical">
                    <telerik:RadListView ID="RadListView1" runat="server" DataSourceID="dsHR" DataKeyNames="ID" Skin="Metro" Width="900px" Height="370px" OnSelectedIndexChanged="RadListView1_SelectedIndexChanged" PageSize="10">
                        <LayoutTemplate>
                            <div class="RadListView RadListViewFloated RadListView_Metro">
                                <div class="rlvFloated">
                                    <div id="itemPlaceholder" runat="server">
                                    </div>
                                </div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="rlvI" style="height: 220px">
                                <table style="border-block-end-color:InactiveBorder">
                                    <tr>
                                        <td colspan="2">
                                            <table style="border-block-end-color:InactiveBorder">
                                                <tr>
                                                    <td style="vertical-align:auto;">
                                                        <asp:Image runat="server" ID="Image3" ImageUrl='<%# Eval("Type").ToString() != "HR" ? "images/outstock.png" : "images/spacer.gif"%>' Height='<%# Eval("Type").ToString() != "HR" ? 45 : 1%>' />
                                                    </td>
                                                    <td style="text-align: center; vertical-align:central">
                                                        <asp:Image runat="server" ID="imgPrev" ImageUrl='<%# Eval("ID", "~/images/Gifts/{0}.png") %>' Height="125px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="align-content:center">
                                            <asp:Image runat="server" ID="Image2" ImageUrl='<%# Eval("Type").ToString() == "HR" ? Eval("Value", "~/images/Nums/h{0}.png") : Eval("Value","~/images/Nums/f{0}.png")%>' Height="40px" />
                                        </td>
                                        <td>
                                            <table style="border-block-end-color:InactiveBorder">
                                                <tr>
                                                    <td style="text-align:match-parent; font-size:smaller" colspan="2">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descrip") %>' Width="150px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:match-parent" colspan="2">
                                                        <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl='<%# string.Format("Request.aspx?GID={0}", Eval("ID")) %>' ImageUrl="~/img2/btn_master03.png" Height="30px" Visible='<%# Eval("Active").ToString() == "1" ? false : true%>' CssClass="btn"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </telerik:RadListView>
                    <asp:SqlDataSource ID="dsHR" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT * FROM [vGifts] WHERE (([Active] = @Active)) order by Value">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

