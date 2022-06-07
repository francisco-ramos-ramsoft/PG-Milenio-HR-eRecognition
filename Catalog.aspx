<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table align="center" class="table">
        <tr>
            <td colspan="2">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img2/cc01.png" Height="148px" />
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
                    <telerik:RadListView ID="RadListView1" runat="server" DataSourceID="dsHR" DataKeyNames="ID" Skin="Metro" Width="900px" Height="370px" OnSelectedIndexChanged="RadListView1_SelectedIndexChanged" PageSize="20">
                        <LayoutTemplate>
                            <div class="RadListView RadListViewFloated RadListView_Metro">
                                <div class="rlvFloated">
                                    <div id="itemPlaceholder" runat="server">
                                    </div>
                                </div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="rlvI" style="height: 230px">
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <table>
                                                <tr>
                                                    <td style="vertical-align: top">
                                                        <asp:Image runat="server" ID="Image3" ImageUrl='<%# Eval("Total").ToString() == "0" ? "images/outstock.png" : "images/spacer.gif"%>' Height='<%# Eval("Total").ToString() == "0" ? 60 : 1%>' />
                                                    </td>
                                                    <td style="text-align: center; vertical-align: middle;">
                                                        <asp:Image runat="server" ID="imgPrev" ImageUrl='<%# Eval("ID", "~/images/Gifts/{0}.png") %>' Height="160px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image runat="server" ID="Image2" ImageUrl='<%# Eval("Type").ToString() == "HR" ? Eval("Value", "~/images/Nums/h{0}.png") : Eval("Value","~/images/Nums/f{0}.png")%>' Height="48px" />
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style="text-align: center; font-size: x-small" colspan="2">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descrip") %>' Width="150px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center" colspan="2">
                                                        <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl='<%# string.Format("Request.aspx?GID={0}", Eval("ID")) %>' ImageUrl="~/img2/btn_master03.png" Height="24px" Visible='<%# Eval("Type").ToString() == "HR" ? true : false%>' />
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

