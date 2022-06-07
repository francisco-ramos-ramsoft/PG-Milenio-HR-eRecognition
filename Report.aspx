<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=6.2.12.1017, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
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
                                            <telerik:RadDatePicker ID="dtBegin" runat="server" Culture="es-MX"  SelectedDate="2016-08-01" Skin="Metro" >
                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" Skin="Metro"></Calendar>
                                                <DateInput DisplayDateFormat="yyyy-MM-dd" DateFormat="yyyy-MM-dd" LabelWidth="40%"></DateInput>
                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>Fin:</td>
                                        <td>
                                            <telerik:RadDatePicker ID="dtEnd" runat="server" Culture="es-MX" Skin="Metro" >
                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" Skin="Metro"></Calendar>
                                                <DateInput DisplayDateFormat="yyyy-MM-dd" DateFormat="yyyy-MM-dd" LabelWidth="40%"></DateInput>
                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                            </telerik:RadDatePicker>
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
                                            <asp:SqlDataSource ID="dsManagers" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="Select '_Todos' Name Union select Name from vUsers where rol = 'Admin'"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </div>                            
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <telerik:RadButton ID="RadButton1" runat="server" Text="Ver Reporte" OnClick="RadButton1_Click" Skin="MetroTouch"></telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <telerik:ReportViewer ID="ReportViewer1" runat="server" Height="450px" Width="1100px">
                </telerik:ReportViewer>
            </td>
        </tr>
    </table>
</asp:Content>

