<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyPage.aspx.cs" Inherits="MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <table class="table" align="center" style="width: 1100px">
        <tr>
            <td style="height: 7%" colspan="3">
                <img alt="" src="img2/misrecs01.png" height="100px" />
            </td>
            <td colspan="2" style="vertical-align: middle">
                <table style="color: #FFFFFF; background-color: #006699">
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align:center">
                            <asp:Label ID="lblPoints" runat="server" Text="" ></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 300px; vertical-align: top;">
                <table align="center">
                    <tr>
                        <td style="height: 30px; background-image: url(img2/misrecs02.png); background-repeat: no-repeat; background-size: cover">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" Width="100%" Height="100%" ScrollBars="Vertical">
                            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="dsMyRecsDisp" Height="350px" Width="290px" CellSpacing="0" GridLines="None">
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsMyRecsDisp">
                                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridImageColumn DataImageUrlFields="ID" DataType="System.String" DataImageUrlFormatString="~/Images/Recs/{0}.png" ImageAlign="Middle" ImageHeight="70px" ImageWidth="120px" HeaderText="Rec">
                                        </telerik:GridImageColumn>
                                        <telerik:GridBoundColumn DataField="Asignadas" DataType="System.Int32" FilterControlAltText="Filter Asignadas column" HeaderText="Asignadas" SortExpression="Asignadas" UniqueName="Asignadas">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Extras" DataType="System.Int32" FilterControlAltText="Filter Extras column" HeaderText="Extras" ReadOnly="True" SortExpression="Extras" UniqueName="Extras" Visible="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Entregadas" DataType="System.Int32" FilterControlAltText="Filter Entregadas column" HeaderText="Entregadas" ReadOnly="True" SortExpression="Entregadas" UniqueName="Entregadas">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Total" DataType="System.Int32" FilterControlAltText="Filter Total column" HeaderText="Disponibles" ReadOnly="True" SortExpression="Total" UniqueName="Total">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dsMyRecsDisp" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="select * from vRecsDisp where UserID=@User">
                                <SelectParameters>
                                    <asp:SessionParameter Name="User" SessionField="UserID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75px"></td>
            <td style="width: 300px; vertical-align: top; ">
                <table align="center">
                    <tr>
                        <td style="height: 30px; background-image: url(img2/misrecs03.png); background-repeat: no-repeat; background-size: cover">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel2" runat="server" Width="100%" Height="100%" ScrollBars="Vertical">
                            <telerik:RadGrid ID="RadGrid2" runat="server" DataSourceID="dsMyBlades" CellSpacing="0" GridLines="None" Height="350px" Width="290px">
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="dsMyBlades" ShowFooter="True">
                                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridImageColumn DataImageUrlFields="[Blade]" DataType="System.String" DataImageUrlFormatString="~/Images/Recs/{0}.png" ImageAlign="Middle" ImageHeight="70px" ImageWidth="120px" HeaderText="">
                                        </telerik:GridImageColumn>
                                        <telerik:GridBoundColumn DataField="Total" DataType="System.Int32" FilterControlAltText="Filter Total column" HeaderText="Total" SortExpression="Total" UniqueName="Total">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Valor" DataType="System.Int32" FilterControlAltText="Filter Valor column" HeaderText="Valor" SortExpression="Valor" UniqueName="Valor">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Puntos" DataType="System.Int32" FilterControlAltText="Filter Puntos column" HeaderText="Puntos" SortExpression="Puntos" UniqueName="Puntos" Aggregate="Sum" FooterAggregateFormatString="Puntos Recibidos: {0}">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>

                                <FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dsMyBlades" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT * FROM [vMyBlades] WHERE ([UserID] = @UserID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75px"></td>
            <td style="width: 300px; vertical-align: top; ">
                <table align="center">
                    <tr>
                        <td style="height: 50px; background-image: url(img2/misrecs04.png); background-repeat: no-repeat; background-size: cover">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel3" runat="server" Width="100%" Height="100%" ScrollBars="Vertical">
                            <telerik:RadGrid ID="RadGrid3" runat="server" DataSourceID="dsMyGifts" Height="350px" Width="290px" CellSpacing="0" GridLines="None">
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="dsMyGifts" ShowFooter="true">
                                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>

                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Fecha" DataType="System.DateTime" FilterControlAltText="Filter Fecha column" HeaderText="Fecha" SortExpression="Fecha" UniqueName="Fecha">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Obsequio" FilterControlAltText="Filter Obsequio column" HeaderText="Articulo" SortExpression="Obsequio" UniqueName="Obsequio">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Puntos" DataType="System.Int32" FilterControlAltText="Filter Puntos column" HeaderText="Puntos" SortExpression="Puntos" UniqueName="Puntos" Aggregate="Sum" FooterAggregateFormatString="Puntos Canjeados: {0}">
                                        </telerik:GridBoundColumn>
                                    </Columns>

                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>

                                <FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dsMyGifts" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT * FROM [vMyGifts] WHERE ([UserID] = @UserID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--<tr>
            <td colspan="5">
                <table align="center">
                    <tr>
                        <td>Mi Correo:
                            <asp:HiddenField ID="hfUserMail" runat="server" />
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txbMail" runat="server"></telerik:RadTextBox>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnSend" runat="server" Text="Actualizar correo" OnClick="btnSend_Click"></telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>--%>
    </table>
</asp:Content>

