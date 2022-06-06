<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>


<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=15.2.21.915, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    </telerik:RadCodeBlock>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentReports" runat="Server">

    <script type="text/javascript">
        function mngRequestStarted(ajaxManager, eventArgs) {
            debugger;
            if (eventArgs.EventTarget == "ctl00$ContentReports$RadButton2") {
                eventArgs.EnableAjax = false;
            }
        }
        function pnlRequestStarted(ajaxPanel, eventArgs) {
            if (eventArgs.EventTarget == "RadButton2") {
                eventArgs.EnableAjax = false;
            }
        }
        function gridRequestStart(grid, eventArgs) {
            if ((eventArgs.EventTarget.indexOf("RadButton2") != -1)) {
                eventArgs.EnableAjax = false;
            }
        }

    </script>
    <table>
        <tr>
            <td>
                <table align="center" style="font-family: 'Tahoma'">
                    <tr>
                        <td style="font-weight: bold;">Reporte:
                        </td>
                        <td>
                            <telerik:RadComboBox ID="RadComboBox1" Width="250px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadComboBox1_SelectedIndexChanged" DataSourceID="dsReports" DataTextField="Name" DataValueField="Report" Skin="Metro">
                            </telerik:RadComboBox>
                            <asp:SqlDataSource ID="dsReports" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [Name], [Report] FROM [Reports]"></asp:SqlDataSource>
                        </td>
                        <td>
                            <div runat="server" id="pnlDates">
                                <table>
                                    <tr>
                                        <td>Inicio:</td>
                                        <td>
                                            <telerik:RadDatePicker ID="dtBegin" runat="server" Culture="es-MX" SelectedDate="2016-08-01" Skin="Metro">
                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" Skin="Metro"></Calendar>
                                                <DateInput DisplayDateFormat="yyyy-MM-dd" DateFormat="yyyy-MM-dd" LabelWidth="40%"></DateInput>
                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>Fin:</td>
                                        <td>
                                            <telerik:RadDatePicker ID="dtEnd" runat="server" Culture="es-MX" Skin="Metro">
                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" Skin="Metro"></Calendar>
                                                <DateInput DisplayDateFormat="yyyy-MM-dd" DateFormat="yyyy-MM-dd" LabelWidth="40%"></DateInput>
                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            <div runat="server" id="pnlBlades">
                                <table>
                                    <tr>
                                        <td>Nombre:</td>
                                        <td>
                                            <telerik:RadTextBox runat="server" ID="Name"></telerik:RadTextBox>
                                        </td>
                                        <td>Mes:</td>
                                        <td>
                                            <telerik:RadNumericTextBox runat="server" ID="Month" MinValue="0">
                                                <NumberFormat GroupSeparator="" DecimalDigits="0" />
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div runat="server" id="pnlTotals">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblTotals" Text="Año Corriente"></asp:Label></td>
                                        <td>
                                            <telerik:RadButton runat="server" ID="RadTotalsYear" OnClick="RadTotalsYear_Click" Text="Mandar Reporte"></telerik:RadButton>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="Label1" Text="Año Pasado"></asp:Label></td>
                                        <td>
                                            <telerik:RadButton runat="server" ID="RadTotalsLastYear" OnClick="RadTotalsLastYear_Click" Text="Mandar Reporte"></telerik:RadButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="Label2" Text="Mes Corriente"></asp:Label></td>
                                        <td>
                                            <telerik:RadButton runat="server" ID="RadTotalsMonth" OnClick="RadTotalsMonth_Click" Text="Mandar Reporte"></telerik:RadButton>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="Label3" Text="Mes Pasado"></asp:Label></td>
                                        <td>
                                            <telerik:RadButton runat="server" ID="RadTotalsLastMonth" OnClick="RadTotalsLastMonth_Click" Text="Mandar Reporte"></telerik:RadButton>
                                        </td>
                                    </tr>

                                </table>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div runat="server" id="pnlManager" visible="true">
                                <table>
                                    <tr>
                                        <td>Manager:</td>
                                        <td>
                                            <telerik:RadComboBox ID="RadComboBox2" HighlightTemplatedItems="True" Filter="Contains" Width="250px" runat="server" DataSourceID="dsManagers" DataTextField="Name" DataValueField="Name" Skin="Metro" Height="300px"></telerik:RadComboBox>
                                            <asp:SqlDataSource ID="dsManagers" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="Select '_Todos' Name Union select Name from vUsers where rol='Administrador'"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>

            </td>
            <td>
                <telerik:RadButton ID="RadButton1" runat="server" Text="Ver Reporte" OnClick="RadButton1_Click" Skin="MetroTouch" Width="150px"></telerik:RadButton>
                <br />
                <telerik:RadButton ID="RadButton2" runat="server" Text="Exportar" OnClick="RadButton2_Click" Skin="MetroTouch" Width="150px"></telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <telerik:RadGrid ID="grdManagers" runat="server" CellSpacing="0" DataSourceID="dsGrdManagers" GridLines="None" Skin="Metro" Height="400px" Width="1050px" ShowFooter="True">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsGrdManagers">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="UserGive" FilterControlAltText="Filter UserGive column" HeaderText="Entrega" SortExpression="UserGive" UniqueName="UserGive" HeaderStyle-Width="200px"
                                Aggregate="Count" FooterAggregateFormatString="Entregados: {0}">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UserGSap" FilterControlAltText="Filter UserGSap column" HeaderText="SAP Entrega" SortExpression="UserGSap" UniqueName="UserGSap" HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="Recibe" SortExpression="UserName" UniqueName="UserName" HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Sap" FilterControlAltText="Filter Sap column" HeaderText="SAP Recibe" SortExpression="Sap" UniqueName="Sap" HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Area" FilterControlAltText="Filter Area column" HeaderText="Área" SortExpression="Area" UniqueName="Area" HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="odlname" FilterControlAltText="Filter odlname column" HeaderText="ODL" SortExpression="odlname" UniqueName="odlname" HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="Folio" SortExpression="ID" UniqueName="ID" HeaderStyle-Width="50px">
                                <HeaderStyle Width="50px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RecName" FilterControlAltText="Filter RecName column" HeaderText="Reconocimiento" SortExpression="RecName" UniqueName="RecName" HeaderStyle-Width="150px">
                                <HeaderStyle Width="150px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RecValue" DataType="System.Int32" FilterControlAltText="Filter RecValue column" HeaderText="Puntos" SortExpression="RecValue" UniqueName="RecValue" HeaderStyle-Width="70px"
                                Aggregate="Sum" FooterAggregateFormatString="Total: {0}">
                                <HeaderStyle Width="70px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Reason" FilterControlAltText="Filter Reason column" HeaderText="Motivo" ReadOnly="True" SortExpression="Reason" UniqueName="Reason" HeaderStyle-Width="250px">
                                <HeaderStyle Width="250px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RockName" FilterControlAltText="Filter RockName column" HeaderText="Roca" ReadOnly="True" SortExpression="RockName" UniqueName="RockName" HeaderStyle-Width="250px">
                                <HeaderStyle Width="250px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="timestamp" FilterControlAltText="Filter timestamp column" HeaderText="Fecha" ReadOnly="True" SortExpression="timestamp" UniqueName="timestamp" HeaderStyle-Width="100px">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                        <PagerStyle AlwaysVisible="True" />
                    </MasterTableView>
                    <PagerStyle AlwaysVisible="True" />
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsGrdManagers" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="rRecognitionDetails" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="UG" Type="String" />
                        <asp:Parameter Name="B" Type="String" />
                        <asp:Parameter Name="E" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <telerik:RadGrid ID="grdRecognitios" runat="server" CellSpacing="0" GridLines="None" Skin="Metro" Height="400px" Width="1050px" ShowFooter="True" DataSourceID="dsGrdRecognitions">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsGrdRecognitions">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="Folio" SortExpression="ID" UniqueName="ID" HeaderStyle-Width="50px">
                                <HeaderStyle Width="50px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RecName" FilterControlAltText="Filter RecName column" HeaderText="Reconocimiento" SortExpression="RecName" UniqueName="RecName"
                                Aggregate="Count" FooterAggregateFormatString="Entregados: {0}" HeaderStyle-Width="150px">
                                <HeaderStyle Width="150px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RecValue" DataType="System.Int32" FilterControlAltText="Filter RecValue column" HeaderText="Puntos" SortExpression="RecValue" UniqueName="RecValue"
                                Aggregate="Sum" FooterAggregateFormatString="Total: {0}" HeaderStyle-Width="70px">
                                <HeaderStyle Width="70px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UserGive" FilterControlAltText="Filter UserGive column" HeaderText="Entrega" SortExpression="UserGive" UniqueName="UserGive"
                                HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="Recibe" SortExpression="UserName" UniqueName="UserName"
                                HeaderStyle-Width="200px">
                                <HeaderStyle Width="200px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Reason" FilterControlAltText="Filter Reason column" HeaderText="Motivo" ReadOnly="True" SortExpression="Reason" UniqueName="Reason"
                                HeaderStyle-Width="250px">
                                <HeaderStyle Width="250px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="timestamp" FilterControlAltText="Filter timestamp column" HeaderText="Fecha" ReadOnly="True" SortExpression="timestamp" UniqueName="timestamp"
                                HeaderStyle-Width="100px">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                        </Columns>
                        <%--<GroupByExpressions>
                            <telerik:GridGroupByExpression>
                                <SelectFields>
                                    <telerik:GridGroupByField FieldAlias="Rec" FieldName="RecName" />
                                </SelectFields>
                                <GroupByFields>
                                    <telerik:GridGroupByField FieldAlias="Rec_" FieldName="RecName" FormatString="" HeaderText="" />
                                </GroupByFields>
                            </telerik:GridGroupByExpression>
                        </GroupByExpressions>--%>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False"></FilterMenu>

                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsGrdRecognitions" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="rRecognitionDetails2" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="B" Type="String" />
                        <asp:Parameter Name="E" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <telerik:RadGrid ID="grdInventory" runat="server" CellSpacing="0" GridLines="None" Skin="Metro" Height="400px" Width="1050px" ShowFooter="True" DataSourceID="dsGrdInventory">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataSourceID="dsGrdInventory">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>

                        <Columns>
                            <telerik:GridBoundColumn DataField="Nombre" FilterControlAltText="Filter Nombre column" HeaderText="Nombre" SortExpression="Nombre" UniqueName="Nombre"
                                HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Descrip" FilterControlAltText="Filter Descrip column" HeaderText="Descripción" SortExpression="Descrip" UniqueName="Descrip"
                                HeaderStyle-Width="400px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Puntos" DataType="System.Int32" FilterControlAltText="Filter Puntos column" HeaderText="Puntos" SortExpression="Puntos" UniqueName="Puntos"
                                HeaderStyle-Width="75px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Entradas" DataType="System.Int32" FilterControlAltText="Filter Entradas column" HeaderText="Entradas" SortExpression="Entradas" UniqueName="Entradas"
                                HeaderStyle-Width="75px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Salidas" DataType="System.Int32" FilterControlAltText="Filter Salidas column" HeaderText="Salidas" SortExpression="Salidas" UniqueName="Salidas"
                                HeaderStyle-Width="75px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Total" DataType="System.Int32" FilterControlAltText="Filter Total column" HeaderText="Existencia" ReadOnly="True" SortExpression="Total" UniqueName="Total"
                                HeaderStyle-Width="75px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Administra" FilterControlAltText="Filter Administra column" HeaderText="Administra" SortExpression="Administra" UniqueName="Administra"
                                HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>

                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsGrdInventory" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT Name AS Nombre, Descrip, Value AS Puntos, Entry AS Entradas, Out AS Salidas, Total, Type AS Administra FROM vGifts"></asp:SqlDataSource>

                <telerik:RadGrid ID="grdExchange" runat="server" CellSpacing="0" GridLines="None" Skin="Metro" Height="400px" Width="1050px" ShowFooter="True" DataSourceID="dsGrdExchange">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataSourceID="dsGrdExchange">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Nombre" SortExpression="Name" UniqueName="Name" HeaderStyle-Width="250px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Gift" FilterControlAltText="Filter Gift column" HeaderText="Artículo" SortExpression="Gift" UniqueName="Gift" HeaderStyle-Width="250px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Value" FilterControlAltText="Filter Value column" HeaderText="Puntos" SortExpression="Value" UniqueName="Value"
                                HeaderStyle-Width="200px" DataType="System.Int32">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TimeStamp" FilterControlAltText="Filter TimeStamp column" HeaderText="Fecha" SortExpression="TimeStamp" UniqueName="TimeStamp"
                                HeaderStyle-Width="200px" DataType="System.DateTime">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False"></FilterMenu>

                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsGrdExchange" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="rGiftsExchance" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="B" Type="String" />
                        <asp:Parameter Name="E" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <telerik:RadGrid ID="grdLogPrint" runat="server" CellSpacing="0" GridLines="None" Skin="Metro" Height="400px" Width="1050px" ShowFooter="True" DataSourceID="dsGrdLogPrint">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataSourceID="dsGrdLogPrint">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>

                        <Columns>
                            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Usuario" SortExpression="Name" UniqueName="Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Rec" FilterControlAltText="Filter Rec column" HeaderText="Reconocimiento" SortExpression="Rec" UniqueName="Rec">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="timestamp" DataType="System.DateTime" FilterControlAltText="Filter timestamp column" HeaderText="Fecha" SortExpression="timestamp" UniqueName="timestamp" Aggregate="Count" FooterAggregateFormatString="Impresiones: {0}">
                            </telerik:GridBoundColumn>
                        </Columns>

                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>

                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsGrdLogPrint" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT * FROM [vLogPrint]"></asp:SqlDataSource>

                <telerik:RadGrid ID="GrdBlades" runat="server" CellSpacing="0" DataSourceID="dsBlades" GridLines="None" Skin="Metro" Height="400px" Width="1050px" ShowFooter="True">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsBlades">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="200px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Transaccion" SortExpression="Id" UniqueName="Id"
                                Aggregate="Count" FooterAggregateFormatString="Asignaciones Totales: {0}">
                                <HeaderStyle Width="25px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Nombre" FilterControlAltText="Filter Nombre column" HeaderText="Nombre" SortExpression="Nombre" UniqueName="Nombre">
                                <HeaderStyle Width="150px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Month" FilterControlAltText="Filter  Month column" HeaderText="Mes" SortExpression="Month" UniqueName="Month">
                                <HeaderStyle Width="50px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Reconocimiento" FilterControlAltText="Filter  Reconocimiento column" HeaderText="Reconocimiento" SortExpression="Reconocimiento" UniqueName="Reconocimiento">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Cantidad" FilterControlAltText="Filter Cantidad column" HeaderText="Cantidad" SortExpression="Cantidad" UniqueName="Cantidad">
                                <HeaderStyle Width="25px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                        <PagerStyle AlwaysVisible="True" />
                    </MasterTableView>
                    <PagerStyle AlwaysVisible="True" />
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsBlades" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="GetBlades" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="Name" DbType="String" />
                        <asp:Parameter Name="Month" DbType="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" ClientEvents-OnRequestStart="mngRequestStarted" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="grdManagers">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdManagers" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="grdRecognitios">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdRecognitios" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="GrdBlades">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="GrdBlades" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="grdInventory">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdInventory" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="grdExchange">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdExchange" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="grdLogPrint">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdLogPrint" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="RadButton2">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdManagers" />
                                <telerik:AjaxUpdatedControl ControlID="grdRecognitios" />
                                <telerik:AjaxUpdatedControl ControlID="grdInventory" />
                                <telerik:AjaxUpdatedControl ControlID="grdExchange" />
                                <telerik:AjaxUpdatedControl ControlID="grdLogPrint" />
                                <telerik:AjaxUpdatedControl ControlID="GrdBlades" />
                                <telerik:AjaxUpdatedControl ControlID="RadButton2" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="RadButton1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="grdManagers" />
                                <telerik:AjaxUpdatedControl ControlID="grdRecognitios" />
                                <telerik:AjaxUpdatedControl ControlID="grdInventory" />
                                <telerik:AjaxUpdatedControl ControlID="grdExchange" />
                                <telerik:AjaxUpdatedControl ControlID="grdLogPrint" />
                                <telerik:AjaxUpdatedControl ControlID="GrdBlades" />
                                <telerik:AjaxUpdatedControl ControlID="RadButton1" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="Panel1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="ConfigurationPanel1" LoadingPanelID="RadAjaxLoadingPanel2"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="ConfigurationPanel1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadAjaxLoadingPanel1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="ConfigurationPanel1" LoadingPanelID="RadAjaxLoadingPanel2"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                    <ClientEvents OnRequestStart="mngRequestStarted" />
                </telerik:RadAjaxManager>
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
                </telerik:RadAjaxLoadingPanel>
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" Transparency="70">
                </telerik:RadAjaxLoadingPanel>

            </td>
        </tr>
    </table>
</asp:Content>

